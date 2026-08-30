import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Graphics;

// View for selecting a locally downloaded playlist
class YuMusicLocalPlaylistsView extends WatchUi.Menu2 {
    private var _library as YuMusicLibrary;
    private var _itemCount as Number = 0;

    function initialize() {
        Menu2.initialize({:title => "Local Playlists"});
        _library = new YuMusicLibrary();
    }

    function onShow() as Void {
        clearItems();
        var playlists = _library.getPlaylists();
        var playableSongCount = _library.getPlayableSongCount();
        var currentPlaylistId = _library.getCurrentPlaylist();

        if (playableSongCount > 0) {
            var subtitle = playableSongCount.toString() + " downloaded";
            if (currentPlaylistId == null) {
                subtitle = "\u25B6 " + subtitle;
            }
            addItem(new WatchUi.MenuItem("Shuffle All", subtitle, "__yumusic_play_all__", {}));
            _itemCount++;
        }
        
        if (playlists == null || playlists.size() == 0) {
            if (playableSongCount == 0) {
                addItem(new WatchUi.MenuItem("No Playlists", "Sync music first", "empty", {}));
                _itemCount++;
            }
            return;
        }

        for (var i = 0; i < playlists.size(); i++) {
            var playlist = playlists[i] as Dictionary?;
            if (playlist == null) {
                continue;
            }
            var name = playlist["name"] as String?;
            var id = playlist["id"] as String?;
            var songCount = playlist["songCount"] as Number?;
            
            if (name != null && id != null) {
                var subtitle = (songCount != null ? songCount.toString() : "0") + " songs";
                if (id.equals(currentPlaylistId)) {
                    subtitle = "\u25B6 " + subtitle; // Add a visual indicator for current playlist
                }
                addItem(new WatchUi.MenuItem(name, subtitle, id, {}));
                _itemCount++;
            }
        }
    }

    private function clearItems() as Void {
        while(_itemCount > 0) {
            deleteItem(0);
            _itemCount--;
        }
    }
}
