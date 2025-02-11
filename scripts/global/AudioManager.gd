extends Node

var music_player: AudioStreamPlayer
var current_song: String = ""  # This will store the name or path of the current song.

func _ready():
	music_player = AudioStreamPlayer.new()
	add_child(music_player)

# Function to play a song
func play_music(song_path: String, loop: bool = true):
	if current_song != song_path:  # If the song is different, change it
		var music_stream = load(song_path)  # Use load instead of preload for dynamic paths
		music_stream.loop = loop  # Set loop property
		music_player.stream = music_stream  # Set the new music stream
		music_player.play()  # Start playing
		current_song = song_path  # Update the current song

# Function to stop the music
func stop_music():
	music_player.stop()
	current_song = ""  # Reset the current song to empty

# Function to pause the music
func pause_music():
	music_player.stop()  # Stop the music without changing the song

# Function to resume the music (from the current position)
func resume_music():
	if current_song != "":
		play_music(current_song)  # Resume the song from where it stopped
