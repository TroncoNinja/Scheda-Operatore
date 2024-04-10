extends TextureRect

var akImg = load("res://weapons/weapon_ak.svg");
var arImg = load("res://weapons/weapon_ar.svg");
var benImg = load("res://weapons/weapon_benelli.svg")
var barImg = load("res://weapons/weapon_barret.svg");
var mosImg = load("res://weapons/weapon_mossberg.svg");
var pisImg = load("res://weapons/weapon_pistol.svg");
var vicImg = load("res://weapons/weapon_victrix.svg");

func _on_weapon_selector_item_selected(index):
	match index:
		0:
			texture = akImg;
		1:
			texture = arImg;
		2:
			texture = benImg;
		3:
			texture = mosImg;
		4:
			texture = vicImg;
		5:
			texture = barImg;
		6:
			texture = pisImg;
