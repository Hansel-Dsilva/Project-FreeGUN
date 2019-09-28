extends RigidBody2D

onready var parent = self.get_parent()

func _ready() -> void:
	set_as_toplevel(true)


#Check the collision of the bullet with objects
func _on_bullet_body_entered(body: Node2D) -> void:
	#Find the collision layer on contact
	match body.collision_layer:
		#Player/enemy collision layer
		1:
			if self.parent != body:
				body.get_node("Health").health_check(parent.damage)
				print(body.get_node("Health").health)
				self.queue_free()
		#Wall collision layer
		2:
			self.queue_free()
			print("nice wall")


#Delete bullet after timer runs out
func _on_Timer_timeout() -> void:
	self.queue_free()