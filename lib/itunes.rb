
require 'win32ole'

module ITunes
  # ITunes
  # ==== DESCRIPTION
  # IiTunes Interface
  class ITunes
    # Initializer
    # ==== DESCRIPTION
    # create new instance and connect to OLE Automation Server
    def initialize
      @ole = WIN32OLE.new('iTunes.Application')
    end
      
    # AppCommandMessageProcessingEnabled
    # ==== DESCRIPTION
    # True if iTunes will process APPCOMMAND Windows messages.
    # ==== RETURNS
    # BOOL(true | false)
    def app_command_message_processing_enabled
      @ole.AppCommandMessageProcessingEnabled
    end
    
    # AppCommandMessageProcessingEnabled
    # ==== DESCRIPTION
    # True if iTunes will process APPCOMMAND Windows messages.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def app_command_message_processing_enabled(value)
      @ole.AppCommandMessageProcessingEnabled = value
      nil
    end
    
    # Authorize
    # ==== DESCRIPTION
    # 
    # ==== PARAMS
    # I4(Fixnum) numElems
    # VARIANT data
    # BSTR(String) names
    # ==== RETURNS
    # VOID(nil)
    def authorize(num_elems, data, names)
      @ole.Authorize(num_elems, data, names)
    end
    
    # BackTrack
    # ==== DESCRIPTION
    # Reposition to the beginning of the current track or go to the previous track if already at start of current track.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def back_track()
      @ole.BackTrack()
    end
    
    # BrowserWindow
    # ==== DESCRIPTION
    # Returns the main iTunes browser window.
    # ==== RETURNS
    # IITBrowserWindow
    def browser_window
      IITBrowserWindow.new(@ole.BrowserWindow)
    end
    
    # CanSetShuffle
    # ==== DESCRIPTION
    # True if the Shuffle property is writable for the specified playlist.
    # ==== RETURNS
    # BOOL(true | false)
    def can_set_shuffle
      @ole.CanSetShuffle
    end
    
    # CanSetSongRepeat
    # ==== DESCRIPTION
    # True if the SongRepeat property is writable for the specified playlist.
    # ==== RETURNS
    # BOOL(true | false)
    def can_set_song_repeat
      @ole.CanSetSongRepeat
    end
    
    # CheckVersion
    # ==== DESCRIPTION
    # Returns true if this version of the iTunes type library is compatible with the specified version.
    # ==== PARAMS
    # I4(Fixnum) majorVersion
    # I4(Fixnum) minorVersion
    # ==== RETURNS
    # BOOL(true | false)
    def check_version(major_version, minor_version)
      @ole.CheckVersion(major_version, minor_version)
    end
    
    # ConvertFile
    # ==== DESCRIPTION
    # Start converting the specified file path.
    # ==== PARAMS
    # BSTR(String) filePath
    # ==== RETURNS
    # IITOperationStatus
    def convert_file(file_path)
      @ole.ConvertFile(file_path)
    end
    
    # ConvertFile2
    # ==== DESCRIPTION
    # Start converting the specified file path.
    # ==== PARAMS
    # BSTR(String) filePath
    # ==== RETURNS
    # IITConvertOperationStatus
    def convert_file2(file_path)
      @ole.ConvertFile2(file_path)
    end
    
    # ConvertFiles
    # ==== DESCRIPTION
    # Start converting the specified array of file paths. filePaths can be of type VT_ARRAY|VT_VARIANT, where each entry is a VT_BSTR, or VT_ARRAY|VT_BSTR.  You can also pass a JScript Array object.
    # ==== PARAMS
    # VARIANT filePaths
    # ==== RETURNS
    # IITOperationStatus
    def convert_files(file_paths)
      @ole.ConvertFiles(file_paths)
    end
    
    # ConvertFiles2
    # ==== DESCRIPTION
    # Start converting the specified array of file paths. filePaths can be of type VT_ARRAY|VT_VARIANT, where each entry is a VT_BSTR, or VT_ARRAY|VT_BSTR.  You can also pass a JScript Array object.
    # ==== PARAMS
    # VARIANT filePaths
    # ==== RETURNS
    # IITConvertOperationStatus
    def convert_files2(file_paths)
      @ole.ConvertFiles2(file_paths)
    end
    
    # ConvertOperationStatus
    # ==== DESCRIPTION
    # Returns an IITConvertOperationStatus object if there is currently a conversion in progress.
    # ==== RETURNS
    # IITConvertOperationStatus
    def convert_operation_status
      @ole.ConvertOperationStatus
    end
    
    # ConvertTrack
    # ==== DESCRIPTION
    # Start converting the specified track.  iTrackToConvert is a VARIANT of type VT_DISPATCH that points to an IITTrack.
    # ==== PARAMS
    # VARIANT iTrackToConvert
    # ==== RETURNS
    # IITOperationStatus
    def convert_track(i_track_to_convert)
      @ole.ConvertTrack(i_track_to_convert)
    end
    
    # ConvertTrack2
    # ==== DESCRIPTION
    # Start converting the specified track.  iTrackToConvert is a VARIANT of type VT_DISPATCH that points to an IITTrack.
    # ==== PARAMS
    # VARIANT iTrackToConvert
    # ==== RETURNS
    # IITConvertOperationStatus
    def convert_track2(i_track_to_convert)
      @ole.ConvertTrack2(i_track_to_convert)
    end
    
    # ConvertTracks
    # ==== DESCRIPTION
    # Start converting the specified tracks.  iTracksToConvert is a VARIANT of type VT_DISPATCH that points to an IITTrackCollection.
    # ==== PARAMS
    # VARIANT iTracksToConvert
    # ==== RETURNS
    # IITOperationStatus
    def convert_tracks(i_tracks_to_convert)
      @ole.ConvertTracks(i_tracks_to_convert)
    end
    
    # ConvertTracks2
    # ==== DESCRIPTION
    # Start converting the specified tracks.  iTracksToConvert is a VARIANT of type VT_DISPATCH that points to an IITTrackCollection.
    # ==== PARAMS
    # VARIANT iTracksToConvert
    # ==== RETURNS
    # IITConvertOperationStatus
    def convert_tracks2(i_tracks_to_convert)
      @ole.ConvertTracks2(i_tracks_to_convert)
    end
    
    # CreateEQPreset
    # ==== DESCRIPTION
    # Create a new EQ preset.
    # ==== PARAMS
    # BSTR(String) eqPresetName
    # ==== RETURNS
    # IITEQPreset
    def create_eq_preset(eq_preset_name)
      IITEQPreset.new(@ole.CreateEQPreset(eq_preset_name))
    end
    
    # CreateFolder
    # ==== DESCRIPTION
    # Creates a new folder in the main library.
    # ==== PARAMS
    # BSTR(String) folderName
    # ==== RETURNS
    # IITPlaylist
    def create_folder(folder_name)
      IITPlaylist.new(@ole.CreateFolder(folder_name))
    end
    
    # CreateFolderInSource
    # ==== DESCRIPTION
    # Creates a new folder in an existing source.
    # ==== PARAMS
    # BSTR(String) folderName
    # VARIANT iSource
    # ==== RETURNS
    # IITPlaylist
    def create_folder_in_source(folder_name, i_source)
      IITPlaylist.new(@ole.CreateFolderInSource(folder_name, i_source))
    end
    
    # CreatePlaylist
    # ==== DESCRIPTION
    # Creates a new playlist in the main library.
    # ==== PARAMS
    # BSTR(String) playlistName
    # ==== RETURNS
    # IITPlaylist
    def create_playlist(playlist_name)
      IITPlaylist.new(@ole.CreatePlaylist(playlist_name))
    end
    
    # CreatePlaylistInSource
    # ==== DESCRIPTION
    # Creates a new playlist in an existing source.
    # ==== PARAMS
    # BSTR(String) playlistName
    # VARIANT iSource
    # ==== RETURNS
    # IITPlaylist
    def create_playlist_in_source(playlist_name, i_source)
      IITPlaylist.new(@ole.CreatePlaylistInSource(playlist_name, i_source))
    end
    
    # CurrentEQPreset
    # ==== DESCRIPTION
    # Returns the currently selected EQ preset.
    # ==== RETURNS
    # IITEQPreset
    def current_eq_preset
      IITEQPreset.new(@ole.CurrentEQPreset)
    end
    
    # CurrentEQPreset
    # ==== DESCRIPTION
    # Returns the currently selected EQ preset.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def current_eq_preset(value)
      @ole.CurrentEQPreset = value
      nil
    end
    
    # CurrentEncoder
    # ==== DESCRIPTION
    # Returns the currently selected encoder (AAC, MP3, AIFF, WAV, etc.).
    # ==== RETURNS
    # IITEncoder
    def current_encoder
      IITEncoder.new(@ole.CurrentEncoder)
    end
    
    # CurrentEncoder
    # ==== DESCRIPTION
    # Returns the currently selected encoder (AAC, MP3, AIFF, WAV, etc.).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def current_encoder(value)
      @ole.CurrentEncoder = value
      nil
    end
    
    # CurrentPlaylist
    # ==== DESCRIPTION
    # Returns the playlist containing the currently targeted track.
    # ==== RETURNS
    # IITPlaylist
    def current_playlist
      IITPlaylist.new(@ole.CurrentPlaylist)
    end
    
    # CurrentStreamTitle
    # ==== DESCRIPTION
    # The name of the current song in the playing stream (provided by streaming server).
    # ==== RETURNS
    # BSTR(String)
    def current_stream_title
      @ole.CurrentStreamTitle
    end
    
    # CurrentStreamURL
    # ==== DESCRIPTION
    # The URL of the playing stream or streaming web site (provided by streaming server).
    # ==== RETURNS
    # BSTR(String)
    def current_stream_url
      @ole.CurrentStreamURL
    end
    
    # CurrentTrack
    # ==== DESCRIPTION
    # Returns the currently targeted track.
    # ==== RETURNS
    # IITTrack
    def current_track
      IITTrack.new(@ole.CurrentTrack)
    end
    
    # CurrentVisual
    # ==== DESCRIPTION
    # Returns the currently selected visual plug-in.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def current_visual(value)
      @ole.CurrentVisual = value
      nil
    end
    
    # CurrentVisual
    # ==== DESCRIPTION
    # Returns the currently selected visual plug-in.
    # ==== RETURNS
    # IITVisual
    def current_visual
      IITVisual.new(@ole.CurrentVisual)
    end
    
    # EQEnabled
    # ==== DESCRIPTION
    # True if the equalizer is enabled.
    # ==== RETURNS
    # BOOL(true | false)
    def eq_enabled
      @ole.EQEnabled
    end
    
    # EQEnabled
    # ==== DESCRIPTION
    # True if the equalizer is enabled.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def eq_enabled(value)
      @ole.EQEnabled = value
      nil
    end
    
    # EQPresets
    # ==== DESCRIPTION
    # Returns a collection of EQ presets.
    # ==== RETURNS
    # IITEQPresetCollection
    def eq_presets
      IITEQPresetCollection.new(@ole.EQPresets)
    end
    
    # EQWindow
    # ==== DESCRIPTION
    # Returns the EQ window.
    # ==== RETURNS
    # IITWindow
    def eq_window
      IITWindow.new(@ole.EQWindow)
    end
    
    # Encoders
    # ==== DESCRIPTION
    # Returns a collection of encoders.
    # ==== RETURNS
    # IITEncoderCollection
    def encoders
      IITEncoderCollection.new(@ole.Encoders)
    end
    
    # FastForward
    # ==== DESCRIPTION
    # Skip forward in a playing track.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def fast_forward()
      @ole.FastForward()
    end
    
    # ForceToForegroundOnDialog
    # ==== DESCRIPTION
    # True if iTunes will force itself to be the foreground application when it displays a dialog.
    # ==== RETURNS
    # BOOL(true | false)
    def force_to_foreground_on_dialog
      @ole.ForceToForegroundOnDialog
    end
    
    # ForceToForegroundOnDialog
    # ==== DESCRIPTION
    # True if iTunes will force itself to be the foreground application when it displays a dialog.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def force_to_foreground_on_dialog(value)
      @ole.ForceToForegroundOnDialog = value
      nil
    end
    
    # FullScreenVisuals
    # ==== DESCRIPTION
    # True if the visuals are displayed using the entire screen.
    # ==== RETURNS
    # BOOL(true | false)
    def full_screen_visuals
      @ole.FullScreenVisuals
    end
    
    # FullScreenVisuals
    # ==== DESCRIPTION
    # True if the visuals are displayed using the entire screen.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def full_screen_visuals(value)
      @ole.FullScreenVisuals = value
      nil
    end
    
    # GetITObjectByID
    # ==== DESCRIPTION
    # Returns an IITObject corresponding to the specified IDs.
    # ==== PARAMS
    # I4(Fixnum) sourceID
    # I4(Fixnum) playlistID
    # I4(Fixnum) trackID
    # I4(Fixnum) databaseID
    # ==== RETURNS
    # IITObject
    def get_it_object_by_id(source_id, playlist_id, track_id, database_id)
      @ole.GetITObjectByID(source_id, playlist_id, track_id, database_id)
    end
    
    # GetITObjectPersistentIDs
    # ==== DESCRIPTION
    # Returns the high and low 32 bits of the persistent ID of the specified IITObject.
    # ==== PARAMS
    # VARIANT iObject
    # I4(Fixnum) highID
    # I4(Fixnum) lowID
    # ==== RETURNS
    # VOID(nil)
    def get_it_object_persistent_i_ds(i_object, high_id, low_id)
      @ole.GetITObjectPersistentIDs(i_object, high_id, low_id)
    end
    
    # GetPlayerButtonsState
    # ==== DESCRIPTION
    # Retrieves the current state of the player buttons.
    # ==== PARAMS
    # BOOL(true | false) previousEnabled
    # ITPlayButtonState playPauseStopState
    # BOOL(true | false) nextEnabled
    # ==== RETURNS
    # VOID(nil)
    def get_player_buttons_state(previous_enabled, play_pause_stop_state, next_enabled)
      @ole.GetPlayerButtonsState(previous_enabled, play_pause_stop_state, next_enabled)
    end
    
    # GotoMusicStoreHomePage
    # ==== DESCRIPTION
    # Go to the iTunes Store home page.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def goto_music_store_home_page()
      @ole.GotoMusicStoreHomePage()
    end
    
    # ITObjectPersistentIDHigh
    # ==== DESCRIPTION
    # Returns the high 32 bits of the persistent ID of the specified IITObject.
    # ==== RETURNS
    # I4(Fixnum)
    def it_object_persistent_id_high
      @ole.ITObjectPersistentIDHigh
    end
    
    # ITObjectPersistentIDLow
    # ==== DESCRIPTION
    # Returns the low 32 bits of the persistent ID of the specified IITObject.
    # ==== RETURNS
    # I4(Fixnum)
    def it_object_persistent_id_low
      @ole.ITObjectPersistentIDLow
    end
    
    # LibraryPlaylist
    # ==== DESCRIPTION
    # Returns the main library playlist in the main library source.
    # ==== RETURNS
    # IITLibraryPlaylist
    def library_playlist
      IITLibraryPlaylist.new(@ole.LibraryPlaylist)
    end
    
    # LibrarySource
    # ==== DESCRIPTION
    # Returns the source that represents the main library.
    # ==== RETURNS
    # IITSource
    def library_source
      IITSource.new(@ole.LibrarySource)
    end
    
    # LibraryXMLPath
    # ==== DESCRIPTION
    # The full path to the current iTunes library XML file.
    # ==== RETURNS
    # BSTR(String)
    def library_xml_path
      @ole.LibraryXMLPath
    end
    
    # Mute
    # ==== DESCRIPTION
    # True if sound output is muted.
    # ==== RETURNS
    # BOOL(true | false)
    def mute
      @ole.Mute
    end
    
    # Mute
    # ==== DESCRIPTION
    # True if sound output is muted.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def mute(value)
      @ole.Mute = value
      nil
    end
    
    # NextTrack
    # ==== DESCRIPTION
    # Advance to the next track in the current playlist.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def next_track()
      @ole.NextTrack()
    end
    
    # OpenURL
    # ==== DESCRIPTION
    # Open the specified iTunes Store or streaming audio URL.
    # ==== PARAMS
    # BSTR(String) URL
    # ==== RETURNS
    # VOID(nil)
    def open_url(url)
      @ole.OpenURL(url)
    end
    
    # Pause
    # ==== DESCRIPTION
    # Pause playback.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def pause()
      @ole.Pause()
    end
    
    # Play
    # ==== DESCRIPTION
    # Play the currently targeted track.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def play()
      @ole.Play()
    end
    
    # PlayFile
    # ==== DESCRIPTION
    # Play the specified file path, adding it to the library if not already present.
    # ==== PARAMS
    # BSTR(String) filePath
    # ==== RETURNS
    # VOID(nil)
    def play_file(file_path)
      @ole.PlayFile(file_path)
    end
    
    # PlayPause
    # ==== DESCRIPTION
    # Toggle the playing/paused state of the current track.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def play_pause()
      @ole.PlayPause()
    end
    
    # PlayerButtonClicked
    # ==== DESCRIPTION
    # Simulate click on a player control button.
    # ==== PARAMS
    # ITPlayerButton playerButton
    # I4(Fixnum) playerButtonModifierKeys
    # ==== RETURNS
    # VOID(nil)
    def player_button_clicked(player_button, player_button_modifier_keys)
      @ole.PlayerButtonClicked(player_button, player_button_modifier_keys)
    end
    
    # PlayerPosition
    # ==== DESCRIPTION
    # Returns the player's position within the currently playing track in seconds.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def player_position(value)
      @ole.PlayerPosition = value
      nil
    end
    
    # PlayerPosition
    # ==== DESCRIPTION
    # Returns the player's position within the currently playing track in seconds.
    # ==== RETURNS
    # I4(Fixnum)
    def player_position
      @ole.PlayerPosition
    end
    
    # PlayerState
    # ==== DESCRIPTION
    # Returns the current player state.
    # ==== RETURNS
    # ITPlayerState(Fixnum)
    def player_state
      @ole.PlayerState
    end
    
    # PreviousTrack
    # ==== DESCRIPTION
    # Return to the previous track in the current playlist.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def previous_track()
      @ole.PreviousTrack()
    end
    
    # Quit
    # ==== DESCRIPTION
    # Exits the iTunes application.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def quit()
      @ole.Quit()
    end
    
    # Resume
    # ==== DESCRIPTION
    # Disable fast forward/rewind and resume playback, if playing.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def resume()
      @ole.Resume()
    end
    
    # Rewind
    # ==== DESCRIPTION
    # Skip backwards in a playing track.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def rewind()
      @ole.Rewind()
    end
    
    # SelectedTracks
    # ==== DESCRIPTION
    # Returns a collection containing the currently selected track or tracks.
    # ==== RETURNS
    # IITTrackCollection
    def selected_tracks
      IITTrackCollection.new(@ole.SelectedTracks)
    end
    
    # SetOptions
    # ==== DESCRIPTION
    # 
    # ==== PARAMS
    # I4(Fixnum) options
    # ==== RETURNS
    # VOID(nil)
    def set_options(options)
      @ole.SetOptions(options)
    end
    
    # SoundVolume
    # ==== DESCRIPTION
    # Returns the sound output volume (0 = minimum, 100 = maximum).
    # ==== RETURNS
    # I4(Fixnum)
    def sound_volume
      @ole.SoundVolume
    end
    
    # SoundVolume
    # ==== DESCRIPTION
    # Returns the sound output volume (0 = minimum, 100 = maximum).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def sound_volume(value)
      @ole.SoundVolume = value
      nil
    end
    
    # SoundVolumeControlEnabled
    # ==== DESCRIPTION
    # True if the sound volume control is enabled.
    # ==== RETURNS
    # BOOL(true | false)
    def sound_volume_control_enabled
      @ole.SoundVolumeControlEnabled
    end
    
    # Sources
    # ==== DESCRIPTION
    # Returns a collection of music sources (music library, CD, device, etc.).
    # ==== RETURNS
    # IITSourceCollection
    def sources
      IITSourceCollection.new(@ole.Sources)
    end
    
    # Stop
    # ==== DESCRIPTION
    # Stop playback.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def stop()
      @ole.Stop()
    end
    
    # SubscribeToPodcast
    # ==== DESCRIPTION
    # Subscribe to the specified podcast feed URL.
    # ==== PARAMS
    # BSTR(String) URL
    # ==== RETURNS
    # VOID(nil)
    def subscribe_to_podcast(url)
      @ole.SubscribeToPodcast(url)
    end
    
    # UpdateIPod
    # ==== DESCRIPTION
    # Update the contents of the iPod.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def update_i_pod()
      @ole.UpdateIPod()
    end
    
    # UpdatePodcastFeeds
    # ==== DESCRIPTION
    # Update all podcast feeds.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def update_podcast_feeds()
      @ole.UpdatePodcastFeeds()
    end
    
    # Version
    # ==== DESCRIPTION
    # Returns the version of the iTunes application.
    # ==== RETURNS
    # BSTR(String)
    def version
      @ole.Version
    end
    
    # VisualSize
    # ==== DESCRIPTION
    # Returns the size of the displayed visual.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def visual_size(value)
      @ole.VisualSize = value
      nil
    end
    
    # VisualSize
    # ==== DESCRIPTION
    # Returns the size of the displayed visual.
    # ==== RETURNS
    # ITVisualSize(Fixnum)
    def visual_size
      @ole.VisualSize
    end
    
    # Visuals
    # ==== DESCRIPTION
    # Returns a collection of visual plug-ins.
    # ==== RETURNS
    # IITVisualCollection
    def visuals
      IITVisualCollection.new(@ole.Visuals)
    end
    
    # VisualsEnabled
    # ==== DESCRIPTION
    # True if visuals are currently being displayed.
    # ==== RETURNS
    # BOOL(true | false)
    def visuals_enabled
      @ole.VisualsEnabled
    end
    
    # VisualsEnabled
    # ==== DESCRIPTION
    # True if visuals are currently being displayed.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def visuals_enabled(value)
      @ole.VisualsEnabled = value
      nil
    end
    
    # Windows
    # ==== DESCRIPTION
    # Returns a collection of windows.
    # ==== RETURNS
    # IITWindowCollection
    def windows
      IITWindowCollection.new(@ole.Windows)
    end
  end

  # IITArtwork
  # ==== DESCRIPTION
  # IITArtwork Interface
  class IITArtwork
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # Delete
    # ==== DESCRIPTION
    # Delete this piece of artwork from the track.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def delete()
      @ole.Delete()
    end
    
    # Description
    # ==== DESCRIPTION
    # The description for the artwork.
    # ==== RETURNS
    # BSTR(String)
    def description
      @ole.Description
    end
    
    # Description
    # ==== DESCRIPTION
    # The description for the artwork.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def description(value)
      @ole.Description = value
      nil
    end
    
    # Format
    # ==== DESCRIPTION
    # The format of the artwork.
    # ==== RETURNS
    # ITArtworkFormat(Fixnum)
    def format
      @ole.Format
    end
    
    # IsDownloadedArtwork
    # ==== DESCRIPTION
    # True if the artwork was downloaded by iTunes.
    # ==== RETURNS
    # BOOL(true | false)
    def is_downloaded_artwork
      @ole.IsDownloadedArtwork
    end
    
    # SaveArtworkToFile
    # ==== DESCRIPTION
    # Save artwork data to an image file.
    # ==== PARAMS
    # BSTR(String) filePath
    # ==== RETURNS
    # VOID(nil)
    def save_artwork_to_file(file_path)
      @ole.SaveArtworkToFile(file_path)
    end
    
    # SetArtworkFromFile
    # ==== DESCRIPTION
    # Replace existing artwork data with new artwork from an image file.
    # ==== PARAMS
    # BSTR(String) filePath
    # ==== RETURNS
    # VOID(nil)
    def set_artwork_from_file(file_path)
      @ole.SetArtworkFromFile(file_path)
    end
  end

  # IITArtworkCollection
  # ==== DESCRIPTION
  # IITArtworkCollection Interface
  class IITArtworkCollection
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # Count
    # ==== DESCRIPTION
    # Returns the number of pieces of artwork in the collection.
    # ==== RETURNS
    # I4(Fixnum)
    def count
      @ole.Count
    end
    
    # Item
    # ==== DESCRIPTION
    # Returns an IITArtwork object corresponding to the given index (1-based).
    # ==== RETURNS
    # IITArtwork
    def item
      IITArtwork.new(@ole.Item)
    end
  end

  # IITBrowserWindow
  # ==== DESCRIPTION
  # IITBrowserWindow Interface
  class IITBrowserWindow
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # Bottom
    # ==== DESCRIPTION
    # The screen coordinate of the bottom edge of the window.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def bottom(value)
      @ole.Bottom = value
      nil
    end
    
    # Bottom
    # ==== DESCRIPTION
    # The screen coordinate of the bottom edge of the window.
    # ==== RETURNS
    # I4(Fixnum)
    def bottom
      @ole.Bottom
    end
    
    # Height
    # ==== DESCRIPTION
    # The height of the window.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def height(value)
      @ole.Height = value
      nil
    end
    
    # Height
    # ==== DESCRIPTION
    # The height of the window.
    # ==== RETURNS
    # I4(Fixnum)
    def height
      @ole.Height
    end
    
    # Kind
    # ==== DESCRIPTION
    # The window kind.
    # ==== RETURNS
    # ITWindowKind(Fixnum)
    def kind
      @ole.Kind
    end
    
    # Left
    # ==== DESCRIPTION
    # The screen coordinate of the left edge of the window.
    # ==== RETURNS
    # I4(Fixnum)
    def left
      @ole.Left
    end
    
    # Left
    # ==== DESCRIPTION
    # The screen coordinate of the left edge of the window.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def left(value)
      @ole.Left = value
      nil
    end
    
    # Maximizable
    # ==== DESCRIPTION
    # True if the window is maximizable.
    # ==== RETURNS
    # BOOL(true | false)
    def maximizable
      @ole.Maximizable
    end
    
    # Maximized
    # ==== DESCRIPTION
    # True if the window is maximized.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def maximized(value)
      @ole.Maximized = value
      nil
    end
    
    # Maximized
    # ==== DESCRIPTION
    # True if the window is maximized.
    # ==== RETURNS
    # BOOL(true | false)
    def maximized
      @ole.Maximized
    end
    
    # MiniPlayer
    # ==== DESCRIPTION
    # True if window is in Mini Player mode.
    # ==== RETURNS
    # BOOL(true | false)
    def mini_player
      @ole.MiniPlayer
    end
    
    # MiniPlayer
    # ==== DESCRIPTION
    # True if window is in Mini Player mode.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def mini_player(value)
      @ole.MiniPlayer = value
      nil
    end
    
    # Minimized
    # ==== DESCRIPTION
    # True if the window is minimized.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def minimized(value)
      @ole.Minimized = value
      nil
    end
    
    # Minimized
    # ==== DESCRIPTION
    # True if the window is minimized.
    # ==== RETURNS
    # BOOL(true | false)
    def minimized
      @ole.Minimized
    end
    
    # Name
    # ==== DESCRIPTION
    # The title of the window.
    # ==== RETURNS
    # BSTR(String)
    def name
      @ole.Name
    end
    
    # Resizable
    # ==== DESCRIPTION
    # True if the window is resizable.
    # ==== RETURNS
    # BOOL(true | false)
    def resizable
      @ole.Resizable
    end
    
    # Right
    # ==== DESCRIPTION
    # The screen coordinate of the right edge of the window.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def right(value)
      @ole.Right = value
      nil
    end
    
    # Right
    # ==== DESCRIPTION
    # The screen coordinate of the right edge of the window.
    # ==== RETURNS
    # I4(Fixnum)
    def right
      @ole.Right
    end
    
    # SelectedPlaylist
    # ==== DESCRIPTION
    # The currently selected playlist in the Source list.
    # ==== RETURNS
    # IITPlaylist
    def selected_playlist
      IITPlaylist.new(@ole.SelectedPlaylist)
    end
    
    # SelectedPlaylist
    # ==== DESCRIPTION
    # The currently selected playlist in the Source list.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def selected_playlist(value)
      @ole.SelectedPlaylist = value
      nil
    end
    
    # SelectedTracks
    # ==== DESCRIPTION
    # Returns a collection containing the currently selected track or tracks.
    # ==== RETURNS
    # IITTrackCollection
    def selected_tracks
      IITTrackCollection.new(@ole.SelectedTracks)
    end
    
    # Top
    # ==== DESCRIPTION
    # The screen coordinate of the top edge of the window.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def top(value)
      @ole.Top = value
      nil
    end
    
    # Top
    # ==== DESCRIPTION
    # The screen coordinate of the top edge of the window.
    # ==== RETURNS
    # I4(Fixnum)
    def top
      @ole.Top
    end
    
    # Visible
    # ==== DESCRIPTION
    # True if the window is visible. Note that the main browser window cannot be hidden.
    # ==== RETURNS
    # BOOL(true | false)
    def visible
      @ole.Visible
    end
    
    # Visible
    # ==== DESCRIPTION
    # True if the window is visible. Note that the main browser window cannot be hidden.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def visible(value)
      @ole.Visible = value
      nil
    end
    
    # Width
    # ==== DESCRIPTION
    # The width of the window.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def width(value)
      @ole.Width = value
      nil
    end
    
    # Width
    # ==== DESCRIPTION
    # The width of the window.
    # ==== RETURNS
    # I4(Fixnum)
    def width
      @ole.Width
    end
    
    # Zoomable
    # ==== DESCRIPTION
    # True if the window is zoomable.
    # ==== RETURNS
    # BOOL(true | false)
    def zoomable
      @ole.Zoomable
    end
    
    # Zoomed
    # ==== DESCRIPTION
    # True if the window is zoomed.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def zoomed(value)
      @ole.Zoomed = value
      nil
    end
    
    # Zoomed
    # ==== DESCRIPTION
    # True if the window is zoomed.
    # ==== RETURNS
    # BOOL(true | false)
    def zoomed
      @ole.Zoomed
    end
  end

  # IITEQPreset
  # ==== DESCRIPTION
  # IITEQPreset Interface
  class IITEQPreset
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # Band1
    # ==== DESCRIPTION
    # The equalizer 32Hz band level (-12.0 db to +12.0 db).
    # ==== RETURNS
    # R8(Float)
    def band1
      @ole.Band1
    end
    
    # Band1
    # ==== DESCRIPTION
    # The equalizer 32Hz band level (-12.0 db to +12.0 db).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def band1(value)
      @ole.Band1 = value
      nil
    end
    
    # Band10
    # ==== DESCRIPTION
    # The equalizer 16KHz band level (-12.0 db to +12.0 db).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def band10(value)
      @ole.Band10 = value
      nil
    end
    
    # Band10
    # ==== DESCRIPTION
    # The equalizer 16KHz band level (-12.0 db to +12.0 db).
    # ==== RETURNS
    # R8(Float)
    def band10
      @ole.Band10
    end
    
    # Band2
    # ==== DESCRIPTION
    # The equalizer 64Hz band level (-12.0 db to +12.0 db).
    # ==== RETURNS
    # R8(Float)
    def band2
      @ole.Band2
    end
    
    # Band2
    # ==== DESCRIPTION
    # The equalizer 64Hz band level (-12.0 db to +12.0 db).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def band2(value)
      @ole.Band2 = value
      nil
    end
    
    # Band3
    # ==== DESCRIPTION
    # The equalizer 125Hz band level (-12.0 db to +12.0 db).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def band3(value)
      @ole.Band3 = value
      nil
    end
    
    # Band3
    # ==== DESCRIPTION
    # The equalizer 125Hz band level (-12.0 db to +12.0 db).
    # ==== RETURNS
    # R8(Float)
    def band3
      @ole.Band3
    end
    
    # Band4
    # ==== DESCRIPTION
    # The equalizer 250Hz band level (-12.0 db to +12.0 db).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def band4(value)
      @ole.Band4 = value
      nil
    end
    
    # Band4
    # ==== DESCRIPTION
    # The equalizer 250Hz band level (-12.0 db to +12.0 db).
    # ==== RETURNS
    # R8(Float)
    def band4
      @ole.Band4
    end
    
    # Band5
    # ==== DESCRIPTION
    # The equalizer 500Hz band level (-12.0 db to +12.0 db).
    # ==== RETURNS
    # R8(Float)
    def band5
      @ole.Band5
    end
    
    # Band5
    # ==== DESCRIPTION
    # The equalizer 500Hz band level (-12.0 db to +12.0 db).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def band5(value)
      @ole.Band5 = value
      nil
    end
    
    # Band6
    # ==== DESCRIPTION
    # The equalizer 1KHz band level (-12.0 db to +12.0 db).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def band6(value)
      @ole.Band6 = value
      nil
    end
    
    # Band6
    # ==== DESCRIPTION
    # The equalizer 1KHz band level (-12.0 db to +12.0 db).
    # ==== RETURNS
    # R8(Float)
    def band6
      @ole.Band6
    end
    
    # Band7
    # ==== DESCRIPTION
    # The equalizer 2KHz band level (-12.0 db to +12.0 db).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def band7(value)
      @ole.Band7 = value
      nil
    end
    
    # Band7
    # ==== DESCRIPTION
    # The equalizer 2KHz band level (-12.0 db to +12.0 db).
    # ==== RETURNS
    # R8(Float)
    def band7
      @ole.Band7
    end
    
    # Band8
    # ==== DESCRIPTION
    # The equalizer 4KHz band level (-12.0 db to +12.0 db).
    # ==== RETURNS
    # R8(Float)
    def band8
      @ole.Band8
    end
    
    # Band8
    # ==== DESCRIPTION
    # The equalizer 4KHz band level (-12.0 db to +12.0 db).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def band8(value)
      @ole.Band8 = value
      nil
    end
    
    # Band9
    # ==== DESCRIPTION
    # The equalizer 8KHz band level (-12.0 db to +12.0 db).
    # ==== RETURNS
    # R8(Float)
    def band9
      @ole.Band9
    end
    
    # Band9
    # ==== DESCRIPTION
    # The equalizer 8KHz band level (-12.0 db to +12.0 db).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def band9(value)
      @ole.Band9 = value
      nil
    end
    
    # Delete
    # ==== DESCRIPTION
    # Delete this EQ preset.
    # ==== PARAMS
    # BOOL(true | false) updateAllTracks
    # ==== RETURNS
    # VOID(nil)
    def delete(update_all_tracks)
      @ole.Delete(update_all_tracks)
    end
    
    # Modifiable
    # ==== DESCRIPTION
    # True if this EQ preset can be modified.
    # ==== RETURNS
    # BOOL(true | false)
    def modifiable
      @ole.Modifiable
    end
    
    # Name
    # ==== DESCRIPTION
    # The name of the the EQ preset.
    # ==== RETURNS
    # BSTR(String)
    def name
      @ole.Name
    end
    
    # Preamp
    # ==== DESCRIPTION
    # The equalizer preamp level (-12.0 db to +12.0 db).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def preamp(value)
      @ole.Preamp = value
      nil
    end
    
    # Preamp
    # ==== DESCRIPTION
    # The equalizer preamp level (-12.0 db to +12.0 db).
    # ==== RETURNS
    # R8(Float)
    def preamp
      @ole.Preamp
    end
    
    # Rename
    # ==== DESCRIPTION
    # Rename this EQ preset.
    # ==== PARAMS
    # BSTR(String) newName
    # BOOL(true | false) updateAllTracks
    # ==== RETURNS
    # VOID(nil)
    def rename(new_name, update_all_tracks)
      @ole.Rename(new_name, update_all_tracks)
    end
  end

  # IITEQPresetCollection
  # ==== DESCRIPTION
  # IITEQPresetCollection Interface
  class IITEQPresetCollection
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # Count
    # ==== DESCRIPTION
    # Returns the number of EQ presets in the collection.
    # ==== RETURNS
    # I4(Fixnum)
    def count
      @ole.Count
    end
    
    # Item
    # ==== DESCRIPTION
    # Returns an IITEQPreset object corresponding to the given index (1-based).
    # ==== RETURNS
    # IITEQPreset
    def item
      IITEQPreset.new(@ole.Item)
    end
    
    # ItemByName
    # ==== DESCRIPTION
    # Returns an IITEQPreset object with the specified name.
    # ==== RETURNS
    # IITEQPreset
    def item_by_name
      IITEQPreset.new(@ole.ItemByName)
    end
  end

  # IITEncoder
  # ==== DESCRIPTION
  # IITEncoder Interface
  class IITEncoder
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # Format
    # ==== DESCRIPTION
    # The data format created by the encoder.
    # ==== RETURNS
    # BSTR(String)
    def format
      @ole.Format
    end
    
    # Name
    # ==== DESCRIPTION
    # The name of the the encoder.
    # ==== RETURNS
    # BSTR(String)
    def name
      @ole.Name
    end
  end

  # IITEncoderCollection
  # ==== DESCRIPTION
  # IITEncoderCollection Interface
  class IITEncoderCollection
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # Count
    # ==== DESCRIPTION
    # Returns the number of encoders in the collection.
    # ==== RETURNS
    # I4(Fixnum)
    def count
      @ole.Count
    end
    
    # Item
    # ==== DESCRIPTION
    # Returns an IITEncoder object corresponding to the given index (1-based).
    # ==== RETURNS
    # IITEncoder
    def item
      IITEncoder.new(@ole.Item)
    end
    
    # ItemByName
    # ==== DESCRIPTION
    # Returns an IITEncoder object with the specified name.
    # ==== RETURNS
    # IITEncoder
    def item_by_name
      IITEncoder.new(@ole.ItemByName)
    end
  end

  # IITLibraryPlaylist
  # ==== DESCRIPTION
  # IITLibraryPlaylist Interface
  class IITLibraryPlaylist
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # AddFile
    # ==== DESCRIPTION
    # Add the specified file path to the library.
    # ==== PARAMS
    # BSTR(String) filePath
    # ==== RETURNS
    # IITOperationStatus
    def add_file(file_path)
      @ole.AddFile(file_path)
    end
    
    # AddFiles
    # ==== DESCRIPTION
    # Add the specified array of file paths to the library. filePaths can be of type VT_ARRAY|VT_VARIANT, where each entry is a VT_BSTR, or VT_ARRAY|VT_BSTR.  You can also pass a JScript Array object.
    # ==== PARAMS
    # VARIANT filePaths
    # ==== RETURNS
    # IITOperationStatus
    def add_files(file_paths)
      @ole.AddFiles(file_paths)
    end
    
    # AddTrack
    # ==== DESCRIPTION
    # Add the specified track to the library.  iTrackToAdd is a VARIANT of type VT_DISPATCH that points to an IITTrack.
    # ==== PARAMS
    # VARIANT iTrackToAdd
    # ==== RETURNS
    # IITTrack
    def add_track(i_track_to_add)
      IITTrack.new(@ole.AddTrack(i_track_to_add))
    end
    
    # AddURL
    # ==== DESCRIPTION
    # Add the specified streaming audio URL to the library.
    # ==== PARAMS
    # BSTR(String) URL
    # ==== RETURNS
    # IITURLTrack
    def add_url(url)
      @ole.AddURL(url)
    end
    
    # Delete
    # ==== DESCRIPTION
    # Delete this playlist.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def delete()
      @ole.Delete()
    end
    
    # Duration
    # ==== DESCRIPTION
    # The total length of all songs in the playlist (in seconds).
    # ==== RETURNS
    # I4(Fixnum)
    def duration
      @ole.Duration
    end
    
    # GetITObjectIDs
    # ==== DESCRIPTION
    # Returns the four IDs that uniquely identify this object.
    # ==== PARAMS
    # I4(Fixnum) sourceID
    # I4(Fixnum) playlistID
    # I4(Fixnum) trackID
    # I4(Fixnum) databaseID
    # ==== RETURNS
    # VOID(nil)
    def get_it_object_i_ds(source_id, playlist_id, track_id, database_id)
      @ole.GetITObjectIDs(source_id, playlist_id, track_id, database_id)
    end
    
    # Index
    # ==== DESCRIPTION
    # The index of the object in internal application order (1-based).
    # ==== RETURNS
    # I4(Fixnum)
    def index
      @ole.Index
    end
    
    # Kind
    # ==== DESCRIPTION
    # The playlist kind.
    # ==== RETURNS
    # ITPlaylistKind(Fixnum)
    def kind
      @ole.Kind
    end
    
    # Name
    # ==== DESCRIPTION
    # The name of the object.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def name(value)
      @ole.Name = value
      nil
    end
    
    # Name
    # ==== DESCRIPTION
    # The name of the object.
    # ==== RETURNS
    # BSTR(String)
    def name
      @ole.Name
    end
    
    # PlayFirstTrack
    # ==== DESCRIPTION
    # Start playing the first track in this playlist.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def play_first_track()
      @ole.PlayFirstTrack()
    end
    
    # Print
    # ==== DESCRIPTION
    # Print this playlist.
    # ==== PARAMS
    # BOOL(true | false) showPrintDialog
    # ITPlaylistPrintKind printKind
    # BSTR(String) theme
    # ==== RETURNS
    # VOID(nil)
    def print(show_print_dialog, print_kind, theme)
      @ole.Print(show_print_dialog, print_kind, theme)
    end
    
    # Search
    # ==== DESCRIPTION
    # Search tracks in this playlist for the specified string.
    # ==== PARAMS
    # BSTR(String) searchText
    # ITPlaylistSearchField searchFields
    # ==== RETURNS
    # IITTrackCollection
    def search(search_text, search_fields)
      IITTrackCollection.new(@ole.Search(search_text, search_fields))
    end
    
    # Shuffle
    # ==== DESCRIPTION
    # True if songs in the playlist are played in random order.
    # ==== RETURNS
    # BOOL(true | false)
    def shuffle
      @ole.Shuffle
    end
    
    # Shuffle
    # ==== DESCRIPTION
    # True if songs in the playlist are played in random order.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def shuffle(value)
      @ole.Shuffle = value
      nil
    end
    
    # Size
    # ==== DESCRIPTION
    # The total size of all songs in the playlist (in bytes).
    # ==== RETURNS
    # R8(Float)
    def size
      @ole.Size
    end
    
    # SongRepeat
    # ==== DESCRIPTION
    # The playback repeat mode.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def song_repeat(value)
      @ole.SongRepeat = value
      nil
    end
    
    # SongRepeat
    # ==== DESCRIPTION
    # The playback repeat mode.
    # ==== RETURNS
    # ITPlaylistRepeatMode(Fixnum)
    def song_repeat
      @ole.SongRepeat
    end
    
    # Source
    # ==== DESCRIPTION
    # The source that contains this playlist.
    # ==== RETURNS
    # IITSource
    def source
      IITSource.new(@ole.Source)
    end
    
    # Time
    # ==== DESCRIPTION
    # The total length of all songs in the playlist (in MM:SS format).
    # ==== RETURNS
    # BSTR(String)
    def time
      @ole.Time
    end
    
    # TrackDatabaseID
    # ==== DESCRIPTION
    # The track database ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def track_database_id
      @ole.TrackDatabaseID
    end
    
    # Tracks
    # ==== DESCRIPTION
    # Returns a collection of tracks in this playlist.
    # ==== RETURNS
    # IITTrackCollection
    def tracks
      IITTrackCollection.new(@ole.Tracks)
    end
    
    # Visible
    # ==== DESCRIPTION
    # True if the playlist is visible in the Source list.
    # ==== RETURNS
    # BOOL(true | false)
    def visible
      @ole.Visible
    end
    
    # playlistID
    # ==== DESCRIPTION
    # The playlist ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def playlist_id
      @ole.playlistID
    end
    
    # sourceID
    # ==== DESCRIPTION
    # The source ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def source_id
      @ole.sourceID
    end
    
    # trackID
    # ==== DESCRIPTION
    # The track ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def track_id
      @ole.trackID
    end
  end

  # IITPlaylist
  # ==== DESCRIPTION
  # IITLibraryPlaylist Interface
  class IITPlaylist
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # AddFile
    # ==== DESCRIPTION
    # Add the specified file path to the library.
    # ==== PARAMS
    # BSTR(String) filePath
    # ==== RETURNS
    # IITOperationStatus
    def add_file(file_path)
      @ole.AddFile(file_path)
    end
    
    # AddFiles
    # ==== DESCRIPTION
    # Add the specified array of file paths to the library. filePaths can be of type VT_ARRAY|VT_VARIANT, where each entry is a VT_BSTR, or VT_ARRAY|VT_BSTR.  You can also pass a JScript Array object.
    # ==== PARAMS
    # VARIANT filePaths
    # ==== RETURNS
    # IITOperationStatus
    def add_files(file_paths)
      @ole.AddFiles(file_paths)
    end
    
    # AddTrack
    # ==== DESCRIPTION
    # Add the specified track to the library.  iTrackToAdd is a VARIANT of type VT_DISPATCH that points to an IITTrack.
    # ==== PARAMS
    # VARIANT iTrackToAdd
    # ==== RETURNS
    # IITTrack
    def add_track(i_track_to_add)
      IITTrack.new(@ole.AddTrack(i_track_to_add))
    end
    
    # AddURL
    # ==== DESCRIPTION
    # Add the specified streaming audio URL to the library.
    # ==== PARAMS
    # BSTR(String) URL
    # ==== RETURNS
    # IITURLTrack
    def add_url(url)
      @ole.AddURL(url)
    end
    
    # Delete
    # ==== DESCRIPTION
    # Delete this playlist.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def delete()
      @ole.Delete()
    end
    
    # Duration
    # ==== DESCRIPTION
    # The total length of all songs in the playlist (in seconds).
    # ==== RETURNS
    # I4(Fixnum)
    def duration
      @ole.Duration
    end
    
    # GetITObjectIDs
    # ==== DESCRIPTION
    # Returns the four IDs that uniquely identify this object.
    # ==== PARAMS
    # I4(Fixnum) sourceID
    # I4(Fixnum) playlistID
    # I4(Fixnum) trackID
    # I4(Fixnum) databaseID
    # ==== RETURNS
    # VOID(nil)
    def get_it_object_i_ds(source_id, playlist_id, track_id, database_id)
      @ole.GetITObjectIDs(source_id, playlist_id, track_id, database_id)
    end
    
    # Index
    # ==== DESCRIPTION
    # The index of the object in internal application order (1-based).
    # ==== RETURNS
    # I4(Fixnum)
    def index
      @ole.Index
    end
    
    # Kind
    # ==== DESCRIPTION
    # The playlist kind.
    # ==== RETURNS
    # ITPlaylistKind(Fixnum)
    def kind
      @ole.Kind
    end
    
    # Name
    # ==== DESCRIPTION
    # The name of the object.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def name(value)
      @ole.Name = value
      nil
    end
    
    # Name
    # ==== DESCRIPTION
    # The name of the object.
    # ==== RETURNS
    # BSTR(String)
    def name
      @ole.Name
    end
    
    # PlayFirstTrack
    # ==== DESCRIPTION
    # Start playing the first track in this playlist.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def play_first_track()
      @ole.PlayFirstTrack()
    end
    
    # Print
    # ==== DESCRIPTION
    # Print this playlist.
    # ==== PARAMS
    # BOOL(true | false) showPrintDialog
    # ITPlaylistPrintKind printKind
    # BSTR(String) theme
    # ==== RETURNS
    # VOID(nil)
    def print(show_print_dialog, print_kind, theme)
      @ole.Print(show_print_dialog, print_kind, theme)
    end
    
    # Search
    # ==== DESCRIPTION
    # Search tracks in this playlist for the specified string.
    # ==== PARAMS
    # BSTR(String) searchText
    # ITPlaylistSearchField searchFields
    # ==== RETURNS
    # IITTrackCollection
    def search(search_text, search_fields)
      IITTrackCollection.new(@ole.Search(search_text, search_fields))
    end
    
    # Shuffle
    # ==== DESCRIPTION
    # True if songs in the playlist are played in random order.
    # ==== RETURNS
    # BOOL(true | false)
    def shuffle
      @ole.Shuffle
    end
    
    # Shuffle
    # ==== DESCRIPTION
    # True if songs in the playlist are played in random order.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def shuffle(value)
      @ole.Shuffle = value
      nil
    end
    
    # Size
    # ==== DESCRIPTION
    # The total size of all songs in the playlist (in bytes).
    # ==== RETURNS
    # R8(Float)
    def size
      @ole.Size
    end
    
    # SongRepeat
    # ==== DESCRIPTION
    # The playback repeat mode.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def song_repeat(value)
      @ole.SongRepeat = value
      nil
    end
    
    # SongRepeat
    # ==== DESCRIPTION
    # The playback repeat mode.
    # ==== RETURNS
    # ITPlaylistRepeatMode(Fixnum)
    def song_repeat
      @ole.SongRepeat
    end
    
    # Source
    # ==== DESCRIPTION
    # The source that contains this playlist.
    # ==== RETURNS
    # IITSource
    def source
      IITSource.new(@ole.Source)
    end
    
    # Time
    # ==== DESCRIPTION
    # The total length of all songs in the playlist (in MM:SS format).
    # ==== RETURNS
    # BSTR(String)
    def time
      @ole.Time
    end
    
    # TrackDatabaseID
    # ==== DESCRIPTION
    # The track database ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def track_database_id
      @ole.TrackDatabaseID
    end
    
    # Tracks
    # ==== DESCRIPTION
    # Returns a collection of tracks in this playlist.
    # ==== RETURNS
    # IITTrackCollection
    def tracks
      IITTrackCollection.new(@ole.Tracks)
    end
    
    # Visible
    # ==== DESCRIPTION
    # True if the playlist is visible in the Source list.
    # ==== RETURNS
    # BOOL(true | false)
    def visible
      @ole.Visible
    end
    
    # playlistID
    # ==== DESCRIPTION
    # The playlist ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def playlist_id
      @ole.playlistID
    end
    
    # sourceID
    # ==== DESCRIPTION
    # The source ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def source_id
      @ole.sourceID
    end
    
    # trackID
    # ==== DESCRIPTION
    # The track ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def track_id
      @ole.trackID
    end
  end

  # IITPlaylistCollection
  # ==== DESCRIPTION
  # IITPlaylistCollection Interface
  class IITPlaylistCollection
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # Count
    # ==== DESCRIPTION
    # Returns the number of playlists in the collection.
    # ==== RETURNS
    # I4(Fixnum)
    def count
      @ole.Count
    end
    
    # Item
    # ==== DESCRIPTION
    # Returns an IITPlaylist object corresponding to the given index (1-based).
    # ==== RETURNS
    # IITPlaylist
    def item
      IITPlaylist.new(@ole.Item)
    end
    
    # ItemByName
    # ==== DESCRIPTION
    # Returns an IITPlaylist object with the specified name.
    # ==== RETURNS
    # IITPlaylist
    def item_by_name
      IITPlaylist.new(@ole.ItemByName)
    end
    
    # ItemByPersistentID
    # ==== DESCRIPTION
    # Returns an IITPlaylist object with the specified persistent ID.
    # ==== RETURNS
    # IITPlaylist
    def item_by_persistent_id
      IITPlaylist.new(@ole.ItemByPersistentID)
    end
  end

  # IITSource
  # ==== DESCRIPTION
  # IITSource Interface
  class IITSource
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # Capacity
    # ==== DESCRIPTION
    # The total size of the source, if it has a fixed size.
    # ==== RETURNS
    # R8(Float)
    def capacity
      @ole.Capacity
    end
    
    # FreeSpace
    # ==== DESCRIPTION
    # The free space on the source, if it has a fixed size.
    # ==== RETURNS
    # R8(Float)
    def free_space
      @ole.FreeSpace
    end
    
    # GetITObjectIDs
    # ==== DESCRIPTION
    # Returns the four IDs that uniquely identify this object.
    # ==== PARAMS
    # I4(Fixnum) sourceID
    # I4(Fixnum) playlistID
    # I4(Fixnum) trackID
    # I4(Fixnum) databaseID
    # ==== RETURNS
    # VOID(nil)
    def get_it_object_i_ds(source_id, playlist_id, track_id, database_id)
      @ole.GetITObjectIDs(source_id, playlist_id, track_id, database_id)
    end
    
    # Index
    # ==== DESCRIPTION
    # The index of the object in internal application order (1-based).
    # ==== RETURNS
    # I4(Fixnum)
    def index
      @ole.Index
    end
    
    # Kind
    # ==== DESCRIPTION
    # The source kind.
    # ==== RETURNS
    # ITSourceKind(Fixnum)
    def kind
      @ole.Kind
    end
    
    # Name
    # ==== DESCRIPTION
    # The name of the object.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def name(value)
      @ole.Name = value
      nil
    end
    
    # Name
    # ==== DESCRIPTION
    # The name of the object.
    # ==== RETURNS
    # BSTR(String)
    def name
      @ole.Name
    end
    
    # Playlists
    # ==== DESCRIPTION
    # Returns a collection of playlists.
    # ==== RETURNS
    # IITPlaylistCollection
    def playlists
      IITPlaylistCollection.new(@ole.Playlists)
    end
    
    # TrackDatabaseID
    # ==== DESCRIPTION
    # The track database ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def track_database_id
      @ole.TrackDatabaseID
    end
    
    # playlistID
    # ==== DESCRIPTION
    # The playlist ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def playlist_id
      @ole.playlistID
    end
    
    # sourceID
    # ==== DESCRIPTION
    # The source ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def source_id
      @ole.sourceID
    end
    
    # trackID
    # ==== DESCRIPTION
    # The track ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def track_id
      @ole.trackID
    end
  end

  # IITSourceCollection
  # ==== DESCRIPTION
  # IITSourceCollection Interface
  class IITSourceCollection
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # Count
    # ==== DESCRIPTION
    # Returns the number of sources in the collection.
    # ==== RETURNS
    # I4(Fixnum)
    def count
      @ole.Count
    end
    
    # Item
    # ==== DESCRIPTION
    # Returns an IITSource object corresponding to the given index (1-based).
    # ==== RETURNS
    # IITSource
    def item
      IITSource.new(@ole.Item)
    end
    
    # ItemByName
    # ==== DESCRIPTION
    # Returns an IITSource object with the specified name.
    # ==== RETURNS
    # IITSource
    def item_by_name
      IITSource.new(@ole.ItemByName)
    end
    
    # ItemByPersistentID
    # ==== DESCRIPTION
    # Returns an IITSource object with the specified persistent ID.
    # ==== RETURNS
    # IITSource
    def item_by_persistent_id
      IITSource.new(@ole.ItemByPersistentID)
    end
  end

  # IITTrack
  # ==== DESCRIPTION
  # IITFileOrCDTrack Interface
  class IITTrack
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # AddArtworkFromFile
    # ==== DESCRIPTION
    # Add artwork from an image file to this track.
    # ==== PARAMS
    # BSTR(String) filePath
    # ==== RETURNS
    # IITArtwork
    def add_artwork_from_file(file_path)
      IITArtwork.new(@ole.AddArtworkFromFile(file_path))
    end
    
    # Album
    # ==== DESCRIPTION
    # The album containing the track.
    # ==== RETURNS
    # BSTR(String)
    def album
      @ole.Album
    end
    
    # Album
    # ==== DESCRIPTION
    # The album containing the track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def album(value)
      @ole.Album = value
      nil
    end
    
    # AlbumArtist
    # ==== DESCRIPTION
    # The album artist of the track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def album_artist(value)
      @ole.AlbumArtist = value
      nil
    end
    
    # AlbumArtist
    # ==== DESCRIPTION
    # The album artist of the track.
    # ==== RETURNS
    # BSTR(String)
    def album_artist
      @ole.AlbumArtist
    end
    
    # AlbumRating
    # ==== DESCRIPTION
    # The user or computed rating of the album that this track belongs to (0 to 100).
    # ==== RETURNS
    # I4(Fixnum)
    def album_rating
      @ole.AlbumRating
    end
    
    # AlbumRating
    # ==== DESCRIPTION
    # The user or computed rating of the album that this track belongs to (0 to 100).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def album_rating(value)
      @ole.AlbumRating = value
      nil
    end
    
    # AlbumRatingKind
    # ==== DESCRIPTION
    # The album rating kind.
    # ==== RETURNS
    # ITRatingKind(Fixnum)
    def album_rating_kind
      @ole.AlbumRatingKind
    end
    
    # Artist
    # ==== DESCRIPTION
    # The artist/source of the track.
    # ==== RETURNS
    # BSTR(String)
    def artist
      @ole.Artist
    end
    
    # Artist
    # ==== DESCRIPTION
    # The artist/source of the track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def artist(value)
      @ole.Artist = value
      nil
    end
    
    # Artwork
    # ==== DESCRIPTION
    # Returns a collection of artwork.
    # ==== RETURNS
    # IITArtworkCollection
    def artwork
      IITArtworkCollection.new(@ole.Artwork)
    end
    
    # BPM
    # ==== DESCRIPTION
    # The tempo of the track (in beats per minute).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def bpm(value)
      @ole.BPM = value
      nil
    end
    
    # BPM
    # ==== DESCRIPTION
    # The tempo of the track (in beats per minute).
    # ==== RETURNS
    # I4(Fixnum)
    def bpm
      @ole.BPM
    end
    
    # BitRate
    # ==== DESCRIPTION
    # The bit rate of the track (in kbps).
    # ==== RETURNS
    # I4(Fixnum)
    def bit_rate
      @ole.BitRate
    end
    
    # BookmarkTime
    # ==== DESCRIPTION
    # The bookmark time of the track (in seconds).
    # ==== RETURNS
    # I4(Fixnum)
    def bookmark_time
      @ole.BookmarkTime
    end
    
    # BookmarkTime
    # ==== DESCRIPTION
    # The bookmark time of the track (in seconds).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def bookmark_time(value)
      @ole.BookmarkTime = value
      nil
    end
    
    # Category
    # ==== DESCRIPTION
    # Category for the track.
    # ==== RETURNS
    # BSTR(String)
    def category
      @ole.Category
    end
    
    # Category
    # ==== DESCRIPTION
    # Category for the track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def category(value)
      @ole.Category = value
      nil
    end
    
    # Comment
    # ==== DESCRIPTION
    # Freeform notes about the track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def comment(value)
      @ole.Comment = value
      nil
    end
    
    # Comment
    # ==== DESCRIPTION
    # Freeform notes about the track.
    # ==== RETURNS
    # BSTR(String)
    def comment
      @ole.Comment
    end
    
    # Compilation
    # ==== DESCRIPTION
    # True if this track is from a compilation album.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def compilation(value)
      @ole.Compilation = value
      nil
    end
    
    # Compilation
    # ==== DESCRIPTION
    # True if this track is from a compilation album.
    # ==== RETURNS
    # BOOL(true | false)
    def compilation
      @ole.Compilation
    end
    
    # Composer
    # ==== DESCRIPTION
    # The composer of the track.
    # ==== RETURNS
    # BSTR(String)
    def composer
      @ole.Composer
    end
    
    # Composer
    # ==== DESCRIPTION
    # The composer of the track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def composer(value)
      @ole.Composer = value
      nil
    end
    
    # DateAdded
    # ==== DESCRIPTION
    # The date the track was added to the playlist.
    # ==== RETURNS
    # DATE(String)
    def date_added
      @ole.DateAdded
    end
    
    # Delete
    # ==== DESCRIPTION
    # Delete this track.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def delete()
      @ole.Delete()
    end
    
    # Description
    # ==== DESCRIPTION
    # Description for the track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def description(value)
      @ole.Description = value
      nil
    end
    
    # Description
    # ==== DESCRIPTION
    # Description for the track.
    # ==== RETURNS
    # BSTR(String)
    def description
      @ole.Description
    end
    
    # DiscCount
    # ==== DESCRIPTION
    # The total number of discs in the source album.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def disc_count(value)
      @ole.DiscCount = value
      nil
    end
    
    # DiscCount
    # ==== DESCRIPTION
    # The total number of discs in the source album.
    # ==== RETURNS
    # I4(Fixnum)
    def disc_count
      @ole.DiscCount
    end
    
    # DiscNumber
    # ==== DESCRIPTION
    # The index of the disc containing the track on the source album.
    # ==== RETURNS
    # I4(Fixnum)
    def disc_number
      @ole.DiscNumber
    end
    
    # DiscNumber
    # ==== DESCRIPTION
    # The index of the disc containing the track on the source album.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def disc_number(value)
      @ole.DiscNumber = value
      nil
    end
    
    # Duration
    # ==== DESCRIPTION
    # The length of the track (in seconds).
    # ==== RETURNS
    # I4(Fixnum)
    def duration
      @ole.Duration
    end
    
    # EQ
    # ==== DESCRIPTION
    # The name of the EQ preset of the track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def eq(value)
      @ole.EQ = value
      nil
    end
    
    # EQ
    # ==== DESCRIPTION
    # The name of the EQ preset of the track.
    # ==== RETURNS
    # BSTR(String)
    def eq
      @ole.EQ
    end
    
    # Enabled
    # ==== DESCRIPTION
    # True if the track is checked for playback.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def enabled(value)
      @ole.Enabled = value
      nil
    end
    
    # Enabled
    # ==== DESCRIPTION
    # True if the track is checked for playback.
    # ==== RETURNS
    # BOOL(true | false)
    def enabled
      @ole.Enabled
    end
    
    # EpisodeID
    # ==== DESCRIPTION
    # The episode ID of the track.
    # ==== RETURNS
    # BSTR(String)
    def episode_id
      @ole.EpisodeID
    end
    
    # EpisodeID
    # ==== DESCRIPTION
    # The episode ID of the track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def episode_id(value)
      @ole.EpisodeID = value
      nil
    end
    
    # EpisodeNumber
    # ==== DESCRIPTION
    # The episode number of the track.
    # ==== RETURNS
    # I4(Fixnum)
    def episode_number
      @ole.EpisodeNumber
    end
    
    # EpisodeNumber
    # ==== DESCRIPTION
    # The episode number of the track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def episode_number(value)
      @ole.EpisodeNumber = value
      nil
    end
    
    # ExcludeFromShuffle
    # ==== DESCRIPTION
    # True if track is skipped when shuffling.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def exclude_from_shuffle(value)
      @ole.ExcludeFromShuffle = value
      nil
    end
    
    # ExcludeFromShuffle
    # ==== DESCRIPTION
    # True if track is skipped when shuffling.
    # ==== RETURNS
    # BOOL(true | false)
    def exclude_from_shuffle
      @ole.ExcludeFromShuffle
    end
    
    # Finish
    # ==== DESCRIPTION
    # The stop time of the track (in seconds).
    # ==== RETURNS
    # I4(Fixnum)
    def finish
      @ole.Finish
    end
    
    # Finish
    # ==== DESCRIPTION
    # The stop time of the track (in seconds).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def finish(value)
      @ole.Finish = value
      nil
    end
    
    # Genre
    # ==== DESCRIPTION
    # The music/audio genre (category) of the track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def genre(value)
      @ole.Genre = value
      nil
    end
    
    # Genre
    # ==== DESCRIPTION
    # The music/audio genre (category) of the track.
    # ==== RETURNS
    # BSTR(String)
    def genre
      @ole.Genre
    end
    
    # GetITObjectIDs
    # ==== DESCRIPTION
    # Returns the four IDs that uniquely identify this object.
    # ==== PARAMS
    # I4(Fixnum) sourceID
    # I4(Fixnum) playlistID
    # I4(Fixnum) trackID
    # I4(Fixnum) databaseID
    # ==== RETURNS
    # VOID(nil)
    def get_it_object_i_ds(source_id, playlist_id, track_id, database_id)
      @ole.GetITObjectIDs(source_id, playlist_id, track_id, database_id)
    end
    
    # Grouping
    # ==== DESCRIPTION
    # The grouping (piece) of the track.  Generally used to denote movements within classical work.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def grouping(value)
      @ole.Grouping = value
      nil
    end
    
    # Grouping
    # ==== DESCRIPTION
    # The grouping (piece) of the track.  Generally used to denote movements within classical work.
    # ==== RETURNS
    # BSTR(String)
    def grouping
      @ole.Grouping
    end
    
    # Index
    # ==== DESCRIPTION
    # The index of the object in internal application order (1-based).
    # ==== RETURNS
    # I4(Fixnum)
    def index
      @ole.Index
    end
    
    # Kind
    # ==== DESCRIPTION
    # The track kind.
    # ==== RETURNS
    # ITTrackKind(Fixnum)
    def kind
      @ole.Kind
    end
    
    # KindAsString
    # ==== DESCRIPTION
    # A text description of the track.
    # ==== RETURNS
    # BSTR(String)
    def kind_as_string
      @ole.KindAsString
    end
    
    # Location
    # ==== DESCRIPTION
    # The full path to the file represented by this track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def location(value)
      @ole.Location = value
      nil
    end
    
    # Location
    # ==== DESCRIPTION
    # The full path to the file represented by this track.
    # ==== RETURNS
    # BSTR(String)
    def location
      @ole.Location
    end
    
    # LongDescription
    # ==== DESCRIPTION
    # Long description for the track.
    # ==== RETURNS
    # BSTR(String)
    def long_description
      @ole.LongDescription
    end
    
    # LongDescription
    # ==== DESCRIPTION
    # Long description for the track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def long_description(value)
      @ole.LongDescription = value
      nil
    end
    
    # Lyrics
    # ==== DESCRIPTION
    # Lyrics for the track.
    # ==== RETURNS
    # BSTR(String)
    def lyrics
      @ole.Lyrics
    end
    
    # Lyrics
    # ==== DESCRIPTION
    # Lyrics for the track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def lyrics(value)
      @ole.Lyrics = value
      nil
    end
    
    # ModificationDate
    # ==== DESCRIPTION
    # The modification date of the content of the track.
    # ==== RETURNS
    # DATE(String)
    def modification_date
      @ole.ModificationDate
    end
    
    # Name
    # ==== DESCRIPTION
    # The name of the object.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def name(value)
      @ole.Name = value
      nil
    end
    
    # Name
    # ==== DESCRIPTION
    # The name of the object.
    # ==== RETURNS
    # BSTR(String)
    def name
      @ole.Name
    end
    
    # PartOfGaplessAlbum
    # ==== DESCRIPTION
    # True if track is part of a gapless album.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def part_of_gapless_album(value)
      @ole.PartOfGaplessAlbum = value
      nil
    end
    
    # PartOfGaplessAlbum
    # ==== DESCRIPTION
    # True if track is part of a gapless album.
    # ==== RETURNS
    # BOOL(true | false)
    def part_of_gapless_album
      @ole.PartOfGaplessAlbum
    end
    
    # Play
    # ==== DESCRIPTION
    # Start playing this track.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def play()
      @ole.Play()
    end
    
    # PlayOrderIndex
    # ==== DESCRIPTION
    # The play order index of the track in the owner playlist (1-based).
    # ==== RETURNS
    # I4(Fixnum)
    def play_order_index
      @ole.PlayOrderIndex
    end
    
    # PlayedCount
    # ==== DESCRIPTION
    # The number of times the track has been played.
    # ==== RETURNS
    # I4(Fixnum)
    def played_count
      @ole.PlayedCount
    end
    
    # PlayedCount
    # ==== DESCRIPTION
    # The number of times the track has been played.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def played_count(value)
      @ole.PlayedCount = value
      nil
    end
    
    # PlayedDate
    # ==== DESCRIPTION
    # The date and time the track was last played.  A value of zero means no played date.
    # ==== RETURNS
    # DATE(String)
    def played_date
      @ole.PlayedDate
    end
    
    # PlayedDate
    # ==== DESCRIPTION
    # The date and time the track was last played.  A value of zero means no played date.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def played_date(value)
      @ole.PlayedDate = value
      nil
    end
    
    # Playlist
    # ==== DESCRIPTION
    # The playlist that contains this track.
    # ==== RETURNS
    # IITPlaylist
    def playlist
      IITPlaylist.new(@ole.Playlist)
    end
    
    # Playlists
    # ==== DESCRIPTION
    # Returns a collection of playlists that contain the song that this track represents.
    # ==== RETURNS
    # IITPlaylistCollection
    def playlists
      IITPlaylistCollection.new(@ole.Playlists)
    end
    
    # Podcast
    # ==== DESCRIPTION
    # True if this is a podcast track.
    # ==== RETURNS
    # BOOL(true | false)
    def podcast
      @ole.Podcast
    end
    
    # Rating
    # ==== DESCRIPTION
    # The rating of the track (0 to 100).
    # ==== RETURNS
    # I4(Fixnum)
    def rating
      @ole.Rating
    end
    
    # Rating
    # ==== DESCRIPTION
    # The rating of the track (0 to 100).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def rating(value)
      @ole.Rating = value
      nil
    end
    
    # ReleaseDate
    # ==== DESCRIPTION
    # The release date of the track.  A value of zero means no release date.
    # ==== RETURNS
    # DATE(String)
    def release_date
      @ole.ReleaseDate
    end
    
    # RememberBookmark
    # ==== DESCRIPTION
    # True if playback position is remembered.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def remember_bookmark(value)
      @ole.RememberBookmark = value
      nil
    end
    
    # RememberBookmark
    # ==== DESCRIPTION
    # True if playback position is remembered.
    # ==== RETURNS
    # BOOL(true | false)
    def remember_bookmark
      @ole.RememberBookmark
    end
    
    # Reveal
    # ==== DESCRIPTION
    # Reveal the track in the main browser window.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def reveal()
      @ole.Reveal()
    end
    
    # SampleRate
    # ==== DESCRIPTION
    # The sample rate of the track (in Hz).
    # ==== RETURNS
    # I4(Fixnum)
    def sample_rate
      @ole.SampleRate
    end
    
    # SeasonNumber
    # ==== DESCRIPTION
    # The season number of the track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def season_number(value)
      @ole.SeasonNumber = value
      nil
    end
    
    # SeasonNumber
    # ==== DESCRIPTION
    # The season number of the track.
    # ==== RETURNS
    # I4(Fixnum)
    def season_number
      @ole.SeasonNumber
    end
    
    # Show
    # ==== DESCRIPTION
    # The show name of the track.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def show(value)
      @ole.Show = value
      nil
    end
    
    # Show
    # ==== DESCRIPTION
    # The show name of the track.
    # ==== RETURNS
    # BSTR(String)
    def show
      @ole.Show
    end
    
    # Size
    # ==== DESCRIPTION
    # The size of the track (in bytes).
    # ==== RETURNS
    # I4(Fixnum)
    def size
      @ole.Size
    end
    
    # Size64High
    # ==== DESCRIPTION
    # The high 32-bits of the size of the track (in bytes).
    # ==== RETURNS
    # I4(Fixnum)
    def size64_high
      @ole.Size64High
    end
    
    # Size64Low
    # ==== DESCRIPTION
    # The low 32-bits of the size of the track (in bytes).
    # ==== RETURNS
    # I4(Fixnum)
    def size64_low
      @ole.Size64Low
    end
    
    # SkippedCount
    # ==== DESCRIPTION
    # The number of times the track has been skipped.
    # ==== RETURNS
    # I4(Fixnum)
    def skipped_count
      @ole.SkippedCount
    end
    
    # SkippedCount
    # ==== DESCRIPTION
    # The number of times the track has been skipped.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def skipped_count(value)
      @ole.SkippedCount = value
      nil
    end
    
    # SkippedDate
    # ==== DESCRIPTION
    # The date and time the track was last skipped.  A value of zero means no skipped date.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def skipped_date(value)
      @ole.SkippedDate = value
      nil
    end
    
    # SkippedDate
    # ==== DESCRIPTION
    # The date and time the track was last skipped.  A value of zero means no skipped date.
    # ==== RETURNS
    # DATE(String)
    def skipped_date
      @ole.SkippedDate
    end
    
    # SortAlbum
    # ==== DESCRIPTION
    # The album used for sorting.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def sort_album(value)
      @ole.SortAlbum = value
      nil
    end
    
    # SortAlbum
    # ==== DESCRIPTION
    # The album used for sorting.
    # ==== RETURNS
    # BSTR(String)
    def sort_album
      @ole.SortAlbum
    end
    
    # SortAlbumArtist
    # ==== DESCRIPTION
    # The album artist used for sorting.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def sort_album_artist(value)
      @ole.SortAlbumArtist = value
      nil
    end
    
    # SortAlbumArtist
    # ==== DESCRIPTION
    # The album artist used for sorting.
    # ==== RETURNS
    # BSTR(String)
    def sort_album_artist
      @ole.SortAlbumArtist
    end
    
    # SortArtist
    # ==== DESCRIPTION
    # The artist used for sorting.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def sort_artist(value)
      @ole.SortArtist = value
      nil
    end
    
    # SortArtist
    # ==== DESCRIPTION
    # The artist used for sorting.
    # ==== RETURNS
    # BSTR(String)
    def sort_artist
      @ole.SortArtist
    end
    
    # SortComposer
    # ==== DESCRIPTION
    # The composer used for sorting.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def sort_composer(value)
      @ole.SortComposer = value
      nil
    end
    
    # SortComposer
    # ==== DESCRIPTION
    # The composer used for sorting.
    # ==== RETURNS
    # BSTR(String)
    def sort_composer
      @ole.SortComposer
    end
    
    # SortName
    # ==== DESCRIPTION
    # The track name used for sorting.
    # ==== RETURNS
    # BSTR(String)
    def sort_name
      @ole.SortName
    end
    
    # SortName
    # ==== DESCRIPTION
    # The track name used for sorting.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def sort_name(value)
      @ole.SortName = value
      nil
    end
    
    # SortShow
    # ==== DESCRIPTION
    # The show name used for sorting.
    # ==== RETURNS
    # BSTR(String)
    def sort_show
      @ole.SortShow
    end
    
    # SortShow
    # ==== DESCRIPTION
    # The show name used for sorting.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def sort_show(value)
      @ole.SortShow = value
      nil
    end
    
    # Start
    # ==== DESCRIPTION
    # The start time of the track (in seconds).
    # ==== RETURNS
    # I4(Fixnum)
    def start
      @ole.Start
    end
    
    # Start
    # ==== DESCRIPTION
    # The start time of the track (in seconds).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def start(value)
      @ole.Start = value
      nil
    end
    
    # Time
    # ==== DESCRIPTION
    # The length of the track (in MM:SS format).
    # ==== RETURNS
    # BSTR(String)
    def time
      @ole.Time
    end
    
    # TrackCount
    # ==== DESCRIPTION
    # The total number of tracks on the source album.
    # ==== RETURNS
    # I4(Fixnum)
    def track_count
      @ole.TrackCount
    end
    
    # TrackCount
    # ==== DESCRIPTION
    # The total number of tracks on the source album.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def track_count(value)
      @ole.TrackCount = value
      nil
    end
    
    # TrackDatabaseID
    # ==== DESCRIPTION
    # The track database ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def track_database_id
      @ole.TrackDatabaseID
    end
    
    # TrackNumber
    # ==== DESCRIPTION
    # The index of the track on the source album.
    # ==== RETURNS
    # I4(Fixnum)
    def track_number
      @ole.TrackNumber
    end
    
    # TrackNumber
    # ==== DESCRIPTION
    # The index of the track on the source album.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def track_number(value)
      @ole.TrackNumber = value
      nil
    end
    
    # Unplayed
    # ==== DESCRIPTION
    # True if track has not been played.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def unplayed(value)
      @ole.Unplayed = value
      nil
    end
    
    # Unplayed
    # ==== DESCRIPTION
    # True if track has not been played.
    # ==== RETURNS
    # BOOL(true | false)
    def unplayed
      @ole.Unplayed
    end
    
    # UpdateInfoFromFile
    # ==== DESCRIPTION
    # Update this track's information with the information stored in its file.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def update_info_from_file()
      @ole.UpdateInfoFromFile()
    end
    
    # UpdatePodcastFeed
    # ==== DESCRIPTION
    # Update the podcast feed for this track.
    # ==== PARAMS
    # ()
    # ==== RETURNS
    # VOID(nil)
    def update_podcast_feed()
      @ole.UpdatePodcastFeed()
    end
    
    # VideoKind
    # ==== DESCRIPTION
    # The video track kind.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def video_kind(value)
      @ole.VideoKind = value
      nil
    end
    
    # VideoKind
    # ==== DESCRIPTION
    # The video track kind.
    # ==== RETURNS
    # ITVideoKind(Fixnum)
    def video_kind
      @ole.VideoKind
    end
    
    # VolumeAdjustment
    # ==== DESCRIPTION
    # The relative volume adjustment of the track (-100% to 100%).
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def volume_adjustment(value)
      @ole.VolumeAdjustment = value
      nil
    end
    
    # VolumeAdjustment
    # ==== DESCRIPTION
    # The relative volume adjustment of the track (-100% to 100%).
    # ==== RETURNS
    # I4(Fixnum)
    def volume_adjustment
      @ole.VolumeAdjustment
    end
    
    # Year
    # ==== DESCRIPTION
    # The year the track was recorded/released.
    # ==== RETURNS
    # I4(Fixnum)
    def year
      @ole.Year
    end
    
    # Year
    # ==== DESCRIPTION
    # The year the track was recorded/released.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def year(value)
      @ole.Year = value
      nil
    end
    
    # playlistID
    # ==== DESCRIPTION
    # The playlist ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def playlist_id
      @ole.playlistID
    end
    
    # ratingKind
    # ==== DESCRIPTION
    # The track rating kind.
    # ==== RETURNS
    # ITRatingKind(Fixnum)
    def rating_kind
      @ole.ratingKind
    end
    
    # sourceID
    # ==== DESCRIPTION
    # The source ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def source_id
      @ole.sourceID
    end
    
    # trackID
    # ==== DESCRIPTION
    # The track ID of the object.
    # ==== RETURNS
    # I4(Fixnum)
    def track_id
      @ole.trackID
    end
  end

  # IITTrackCollection
  # ==== DESCRIPTION
  # IITTrackCollection Interface
  class IITTrackCollection
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # Count
    # ==== DESCRIPTION
    # Returns the number of tracks in the collection.
    # ==== RETURNS
    # I4(Fixnum)
    def count
      @ole.Count
    end
    
    # Item
    # ==== DESCRIPTION
    # Returns an IITTrack object corresponding to the given fixed index, where the index is independent of the play order (1-based).
    # ==== RETURNS
    # IITTrack
    def item
      IITTrack.new(@ole.Item)
    end
    
    # ItemByName
    # ==== DESCRIPTION
    # Returns an IITTrack object with the specified name.
    # ==== RETURNS
    # IITTrack
    def item_by_name
      IITTrack.new(@ole.ItemByName)
    end
    
    # ItemByPersistentID
    # ==== DESCRIPTION
    # Returns an IITTrack object with the specified persistent ID.
    # ==== RETURNS
    # IITTrack
    def item_by_persistent_id
      IITTrack.new(@ole.ItemByPersistentID)
    end
    
    # ItemByPlayOrder
    # ==== DESCRIPTION
    # Returns an IITTrack object corresponding to the given index, where the index is defined by the play order of the playlist containing the track collection (1-based).
    # ==== RETURNS
    # IITTrack
    def item_by_play_order
      IITTrack.new(@ole.ItemByPlayOrder)
    end
  end

  # IITVisual
  # ==== DESCRIPTION
  # IITVisual Interface
  class IITVisual
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # Name
    # ==== DESCRIPTION
    # The name of the the visual plug-in.
    # ==== RETURNS
    # BSTR(String)
    def name
      @ole.Name
    end
  end

  # IITVisualCollection
  # ==== DESCRIPTION
  # IITVisualCollection Interface
  class IITVisualCollection
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # Count
    # ==== DESCRIPTION
    # Returns the number of visual plug-ins in the collection.
    # ==== RETURNS
    # I4(Fixnum)
    def count
      @ole.Count
    end
    
    # Item
    # ==== DESCRIPTION
    # Returns an IITVisual object corresponding to the given index (1-based).
    # ==== RETURNS
    # IITVisual
    def item
      IITVisual.new(@ole.Item)
    end
    
    # ItemByName
    # ==== DESCRIPTION
    # Returns an IITVisual object with the specified name.
    # ==== RETURNS
    # IITVisual
    def item_by_name
      IITVisual.new(@ole.ItemByName)
    end
  end

  # IITWindow
  # ==== DESCRIPTION
  # IITWindow Interface
  class IITWindow
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # Bottom
    # ==== DESCRIPTION
    # The screen coordinate of the bottom edge of the window.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def bottom(value)
      @ole.Bottom = value
      nil
    end
    
    # Bottom
    # ==== DESCRIPTION
    # The screen coordinate of the bottom edge of the window.
    # ==== RETURNS
    # I4(Fixnum)
    def bottom
      @ole.Bottom
    end
    
    # Height
    # ==== DESCRIPTION
    # The height of the window.
    # ==== RETURNS
    # I4(Fixnum)
    def height
      @ole.Height
    end
    
    # Height
    # ==== DESCRIPTION
    # The height of the window.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def height(value)
      @ole.Height = value
      nil
    end
    
    # Kind
    # ==== DESCRIPTION
    # The window kind.
    # ==== RETURNS
    # ITWindowKind(Fixnum)
    def kind
      @ole.Kind
    end
    
    # Left
    # ==== DESCRIPTION
    # The screen coordinate of the left edge of the window.
    # ==== RETURNS
    # I4(Fixnum)
    def left
      @ole.Left
    end
    
    # Left
    # ==== DESCRIPTION
    # The screen coordinate of the left edge of the window.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def left(value)
      @ole.Left = value
      nil
    end
    
    # Maximizable
    # ==== DESCRIPTION
    # True if the window is maximizable.
    # ==== RETURNS
    # BOOL(true | false)
    def maximizable
      @ole.Maximizable
    end
    
    # Maximized
    # ==== DESCRIPTION
    # True if the window is maximized.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def maximized(value)
      @ole.Maximized = value
      nil
    end
    
    # Maximized
    # ==== DESCRIPTION
    # True if the window is maximized.
    # ==== RETURNS
    # BOOL(true | false)
    def maximized
      @ole.Maximized
    end
    
    # Minimized
    # ==== DESCRIPTION
    # True if the window is minimized.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def minimized(value)
      @ole.Minimized = value
      nil
    end
    
    # Minimized
    # ==== DESCRIPTION
    # True if the window is minimized.
    # ==== RETURNS
    # BOOL(true | false)
    def minimized
      @ole.Minimized
    end
    
    # Name
    # ==== DESCRIPTION
    # The title of the window.
    # ==== RETURNS
    # BSTR(String)
    def name
      @ole.Name
    end
    
    # Resizable
    # ==== DESCRIPTION
    # True if the window is resizable.
    # ==== RETURNS
    # BOOL(true | false)
    def resizable
      @ole.Resizable
    end
    
    # Right
    # ==== DESCRIPTION
    # The screen coordinate of the right edge of the window.
    # ==== RETURNS
    # I4(Fixnum)
    def right
      @ole.Right
    end
    
    # Right
    # ==== DESCRIPTION
    # The screen coordinate of the right edge of the window.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def right(value)
      @ole.Right = value
      nil
    end
    
    # Top
    # ==== DESCRIPTION
    # The screen coordinate of the top edge of the window.
    # ==== RETURNS
    # I4(Fixnum)
    def top
      @ole.Top
    end
    
    # Top
    # ==== DESCRIPTION
    # The screen coordinate of the top edge of the window.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def top(value)
      @ole.Top = value
      nil
    end
    
    # Visible
    # ==== DESCRIPTION
    # True if the window is visible. Note that the main browser window cannot be hidden.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def visible(value)
      @ole.Visible = value
      nil
    end
    
    # Visible
    # ==== DESCRIPTION
    # True if the window is visible. Note that the main browser window cannot be hidden.
    # ==== RETURNS
    # BOOL(true | false)
    def visible
      @ole.Visible
    end
    
    # Width
    # ==== DESCRIPTION
    # The width of the window.
    # ==== RETURNS
    # I4(Fixnum)
    def width
      @ole.Width
    end
    
    # Width
    # ==== DESCRIPTION
    # The width of the window.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def width(value)
      @ole.Width = value
      nil
    end
    
    # Zoomable
    # ==== DESCRIPTION
    # True if the window is zoomable.
    # ==== RETURNS
    # BOOL(true | false)
    def zoomable
      @ole.Zoomable
    end
    
    # Zoomed
    # ==== DESCRIPTION
    # True if the window is zoomed.
    # ==== PARAMS
    # value
    # ==== RETURNS
    # VOID(nil)
    def zoomed(value)
      @ole.Zoomed = value
      nil
    end
    
    # Zoomed
    # ==== DESCRIPTION
    # True if the window is zoomed.
    # ==== RETURNS
    # BOOL(true | false)
    def zoomed
      @ole.Zoomed
    end
  end

  # IITWindowCollection
  # ==== DESCRIPTION
  # IITWindowCollection Interface
  class IITWindowCollection
    # Initializer
    # ==== PARAMS
    # ole :: OLE Object
    def initialize(ole)
      @ole = ole
    end
        
    # Count
    # ==== DESCRIPTION
    # Returns the number of windows in the collection.
    # ==== RETURNS
    # I4(Fixnum)
    def count
      @ole.Count
    end
    
    # Item
    # ==== DESCRIPTION
    # Returns an IITWindow object corresponding to the given index (1-based).
    # ==== RETURNS
    # IITWindow
    def item
      IITWindow.new(@ole.Item)
    end
    
    # ItemByName
    # ==== DESCRIPTION
    # Returns an IITWindow object with the specified name.
    # ==== RETURNS
    # IITWindow
    def item_by_name
      IITWindow.new(@ole.ItemByName)
    end
  end

end

if __FILE__ == $0
  puts "defined methods of ITunes are"
  methods = ITunes::ITunes.new.methods - Object.methods
  puts methods.sort
end

__END__
