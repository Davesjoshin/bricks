extends Node

# Set Limits
var min_points = 0
var points = 0 setget set_points

# Signals
signal points_changed(value)

func set_points(value):
	points = points + value
	emit_signal("points_changed", points)

# Set Max Limits
# var max_hp = 25
# var max_ap = 3
# var max_mp = 10

# var hp = max_hp setget set_hp
# var ap = max_ap	setget set_ap
# var mp = max_mp setget set_mp

# Signals
# signal hp_changed(value)
# signal ap_changed(value)
# signal mp_changed(value)
# signal end_turn

# func set_hp(value):
#	hp = clamp(value, 0, max_hp)
#	emit_signal("hp_changed", hp)
	
# func set_ap(value):
#	ap = clamp(value, 0, max_ap)
#	emit_signal("ap_changed", ap)
#	if ap == 0:
#		emit_signal("end_turn")

# func set_mp(value):
#	mp = clamp(value, 0, max_mp)
#	emit_signal("mp_changed", mp)