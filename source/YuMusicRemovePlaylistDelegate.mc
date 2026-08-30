import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Timer;
import Toybox.System;

class YuMusicRemovePlaylistDelegate extends WatchUi.Menu2InputDelegate {
    private var _library as YuMusicLibrary;

    function initialize() {
        Menu2InputDelegate.initialize();
        _library = new YuMusicLibrary();
    }

    function onSelect(item as MenuItem) as Void {
        var id = item.getId();
        if (id == null || id.equals("empty")) {
            return;
        }

        var playlistId = id as String;
        
        try {
            _library.removePlaylist(playlistId);
        } catch (ex) {
            System.println("remove playlist failed: " + ex.toString());
            var errorView = new YuMusicConfirmView("Error", "Remove failed");
            WatchUi.pushView(errorView, new WatchUi.BehaviorDelegate(), WatchUi.SLIDE_LEFT);
            return;
        }
        
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        
        var successView = new YuMusicConfirmView("Success", "Playlist removed");
        WatchUi.pushView(successView, new YuMusicConfirmDelegate(false), WatchUi.SLIDE_LEFT);
    }

    function onBack() as Void {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }
}
