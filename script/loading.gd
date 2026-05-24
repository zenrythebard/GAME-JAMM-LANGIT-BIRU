extends Control

@onready var progress_bar: ProgressBar = $ProgressBar
var next_scene_path = Global.load_level
var progress : Array[float] = []

func _ready():
	next_scene_path = Global.load_level
	ResourceLoader.load_threaded_request(next_scene_path)
	
func _process(delta: float) -> void:
	var status = ResourceLoader.load_threaded_get_status(next_scene_path, progress)
	
	match status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			var pct = progress[0] * 100
			progress_bar.value = pct
		ResourceLoader.THREAD_LOAD_LOADED:
			progress_bar.value = 100
			var scene = ResourceLoader.load_threaded_get(next_scene_path)
			get_tree().change_scene_to_packed(scene)
