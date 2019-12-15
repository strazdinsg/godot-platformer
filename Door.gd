extends Area2D

export (String, FILE, "*.tscn") var nextScene;

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "player":
			print("Reached door!")
			if nextScene:
				get_tree().change_scene(nextScene)