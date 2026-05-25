extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(preload("uid://cmv5rqf0di7c2"))


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_packed(preload("uid://400m2ad7p71t"))


func _on_quit_pressed() -> void:
	get_tree().quit()
