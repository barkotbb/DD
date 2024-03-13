extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	self.set_visible(false)
	await get_tree().create_timer(5).timeout
	self.set_visible(true)
	self.text = str("Oh wait, I was In my home a couple of seconds ago....")
	await get_tree().create_timer(5).timeout
	self.set_visible(false)
	await get_tree().create_timer(3).timeout
	self.set_visible(true)
	self.text = str("I don't the UIs that were there before except my HP. Weird...")
	await get_tree().create_timer(5).timeout
	self.set_visible(false)
	await get_tree().create_timer(3).timeout
	self.set_visible(true)
	self.text = str("Just let me find anything else out there that could help me...")
	await get_tree().create_timer(5).timeout
	self.set_visible(false)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
