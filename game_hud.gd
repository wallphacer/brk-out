extends Control

var score_label : RichTextLabel
var life_label : RichTextLabel

func _ready():
	score_label = get_node("Score")
	life_label = get_node("Life")
	
func _on_game_score_update(new_score: int) -> void:
	score_label.text = str(new_score)

func _on_game_life_update(new_life: int) -> void:
	life_label.text = str(new_life)
