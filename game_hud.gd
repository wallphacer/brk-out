extends Control

var score_label : RichTextLabel

func _ready():
	score_label = get_node("Score")
	
func _on_game_score_update(new_score: int) -> void:
	score_label.text = str(new_score)
