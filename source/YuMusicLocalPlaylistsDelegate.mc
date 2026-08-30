import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Timer;
import Toybox.Media;

class YuMusicLocalPlaylistsDelegate extends WatchUi.Menu2InputDelegate {
    private var _library as YuMusicLibrary;
    private var _timer as Timer.Timer?;

    function initialize() {
        Menu2InputDelegate.initialize();
        _library = new YuMusicLibrary();
    }

    function onSelect(item as MenuItem) as Void {
        var id = item.getId();
        if (id == null || id.equals("empty")) {
            return;
        }

        if (id.equals("__yumusic_play_all__")) {
            if (_library.getPlayableSongCount() == 0) {
                showError("Sync music first");
                return;
            }

            _library.clearCurrentPlaylist();
            _library.setShuffle(true);
            startPlayback();
            return;
        }

        // Set the current playlist
        var playlistId = id as String;
        _library.setCurrentPlaylist(playlistId);
        startPlayback();
    }

    private function startPlayback() as Void {
        try {
            // Tell the OS to cleanly exit configuration and transition to the music player
            Media.startPlayback(null);
        } catch (ex) {
            // Fallback for older devices/firmwares if startPlayback fails
            WatchUi.popView(WatchUi.SLIDE_RIGHT);
            _timer = new Timer.Timer();
            _timer.start(method(:triggerSecondPop), 200, false);
        }
    }

    private function showError(message as String) as Void {
        var errorView = new YuMusicConfirmView("Error", message);
        WatchUi.pushView(errorView, new YuMusicConfirmDelegate(false), WatchUi.SLIDE_LEFT);
    }

    function triggerSecondPop() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }

    function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }
}
