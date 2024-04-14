extends Control


func _on_save_btn_pressed():
	var dati = {
		"numero" : %Codice.text,
		"nome" : %Nome.text,
		"cognome" : %Cognome.text,
		"immagine" : %ImgPg.texture,
		"storia" : %Storia.text,
		"corpo" : {
			"head" : %Head.button_pressed,
			"lArm" : %LeftArm.button_pressed,
			"body" : %Body.button_pressed,
			"rArm" : %RightArm.button_pressed,
			"lLeg" : %LeftLeg.button_pressed,
			"rLeg" : %RightLeg.button_pressed
		 },
		"hp" : [%Hp1.button_pressed, %Hp2.button_pressed, %Hp3.button_pressed, %Hp4.button_pressed],
		"ca" : [%Ca1.button_pressed, %Ca2.button_pressed, %Ca3.button_pressed, %Ca4.button_pressed, %Ca5.button_pressed],
		"training" : %Trainig.text,
		"alteration" : %Alteration.text,
		"atletica" : %Atletica.value,
		"sapienza" : %Sapienza.value,
		"empatia" : %Empatia.value,
		"sensi" : %Sensi.value,
		"dollaro" : %Dollaro.value,
		"weapon1" : {
			"select" : %Weapon1/PanelContainer/MainWeapon/WeaponSelector.selected,
			"optic" : %Weapon1/PanelContainer/MainWeapon/OpticSelector.selected,
			"hand" : [
				%Weapon1/VBoxContainer/Hand.get_child(1).button_pressed,
				%Weapon1/VBoxContainer/Hand.get_child(2).button_pressed,
				%Weapon1/VBoxContainer/Hand.get_child(3).button_pressed,
				%Weapon1/VBoxContainer/Hand.get_child(4).button_pressed,
				%Weapon1/VBoxContainer/Hand.get_child(5).button_pressed
			],
			"short" : [
				%Weapon1/VBoxContainer/Short.get_child(1).button_pressed,
				%Weapon1/VBoxContainer/Short.get_child(2).button_pressed,
				%Weapon1/VBoxContainer/Short.get_child(3).button_pressed,
				%Weapon1/VBoxContainer/Short.get_child(4).button_pressed,
				%Weapon1/VBoxContainer/Short.get_child(5).button_pressed
			],
			"medium" : [
				%Weapon1/VBoxContainer/Medium.get_child(1).button_pressed,
				%Weapon1/VBoxContainer/Medium.get_child(2).button_pressed,
				%Weapon1/VBoxContainer/Medium.get_child(3).button_pressed,
				%Weapon1/VBoxContainer/Medium.get_child(4).button_pressed,
				%Weapon1/VBoxContainer/Medium.get_child(5).button_pressed
			],
			"long" : [
				%Weapon1/VBoxContainer/Long.get_child(1).button_pressed,
				%Weapon1/VBoxContainer/Long.get_child(2).button_pressed,
				%Weapon1/VBoxContainer/Long.get_child(3).button_pressed,
				%Weapon1/VBoxContainer/Long.get_child(4).button_pressed,
				%Weapon1/VBoxContainer/Long.get_child(5).button_pressed
			],
		},
		"weapon2" : {
			"select" : %Weapon2/PanelContainer/MainWeapon/WeaponSelector.selected,
			"optic" : %Weapon2/PanelContainer/MainWeapon/OpticSelector.selected,
			"hand" : [
				%Weapon2/VBoxContainer/Hand.get_child(1).button_pressed,
				%Weapon2/VBoxContainer/Hand.get_child(2).button_pressed,
				%Weapon2/VBoxContainer/Hand.get_child(3).button_pressed,
				%Weapon2/VBoxContainer/Hand.get_child(4).button_pressed,
				%Weapon2/VBoxContainer/Hand.get_child(5).button_pressed
			],
			"short" : [
				%Weapon2/VBoxContainer/Short.get_child(1).button_pressed,
				%Weapon2/VBoxContainer/Short.get_child(2).button_pressed,
				%Weapon2/VBoxContainer/Short.get_child(3).button_pressed,
				%Weapon2/VBoxContainer/Short.get_child(4).button_pressed,
				%Weapon2/VBoxContainer/Short.get_child(5).button_pressed
			],
			"medium" : [
				%Weapon2/VBoxContainer/Medium.get_child(1).button_pressed,
				%Weapon2/VBoxContainer/Medium.get_child(2).button_pressed,
				%Weapon2/VBoxContainer/Medium.get_child(3).button_pressed,
				%Weapon2/VBoxContainer/Medium.get_child(4).button_pressed,
				%Weapon2/VBoxContainer/Medium.get_child(5).button_pressed
			],
			"long" : [
				%Weapon2/VBoxContainer/Long.get_child(1).button_pressed,
				%Weapon2/VBoxContainer/Long.get_child(2).button_pressed,
				%Weapon2/VBoxContainer/Long.get_child(3).button_pressed,
				%Weapon2/VBoxContainer/Long.get_child(4).button_pressed,
				%Weapon2/VBoxContainer/Long.get_child(5).button_pressed
			],
		},
		"gadget" : %GadgetSelected.selected
	};
	var json_dati = JSON.stringify(dati);
	var file_access = FileAccess.open("save/personaggio.json", FileAccess.WRITE);
	if not file_access:
		print("An error happened while saving data: ", FileAccess.get_open_error());
		return
	file_access.store_line(json_dati);
	file_access.close();


func _on_load_btn_pressed():
	var json = JSON.new();
	var file_access = FileAccess.open("save/personaggio.json", FileAccess.READ);
	var error = json.parse(file_access.get_line());
	if error == OK:
		var dati = json.data;
		
		%Codice.text = dati.numero;
		%Nome.text = dati.nome;
		%Cognome.text = dati.cognome;
		%ImgPg.texture = load("save/personaggio.png");
		%Storia.text = dati.storia;
		
		%Head.button_pressed = dati.corpo.head;
		%LeftArm.button_pressed = dati.corpo.lArm;
		%Body.button_pressed = dati.corpo.body;
		%RightArm.button_pressed = dati.corpo.rArm;
		%LeftLeg.button_pressed = dati.corpo.lLeg;
		%RightLeg.button_pressed = dati.corpo.rLeg;
		
		%Hp1.button_pressed = dati.hp[0];
		%Hp2.button_pressed = dati.hp[1];
		%Hp3.button_pressed = dati.hp[2];
		%Hp4.button_pressed = dati.hp[3];
		
		%Ca1.button_pressed = dati.ca[0];
		%Ca2.button_pressed = dati.ca[1];
		%Ca3.button_pressed = dati.ca[2];
		%Ca4.button_pressed = dati.ca[3];
		%Ca5.button_pressed = dati.ca[4];
		%Trainig.text = dati.training;
		%Alteration.text = dati.alteration;
		%Atletica.value = dati.atletica;
		%Sapienza.value = dati.sapienza;
		%Empatia.value = dati.empatia;
		%Sensi.value = dati.sensi;
		
		%Dollaro.value = dati.dollaro;
		##	Arma e stat 1
		%Weapon1/PanelContainer/MainWeapon/WeaponSelector.select(dati.weapon1.select);
		%Weapon1/PanelContainer/MainWeapon/WeaponSelector.emit_signal(
			"item_selected", 
			%Weapon1/PanelContainer/MainWeapon/WeaponSelector.selected
			)
		%Weapon1/PanelContainer/MainWeapon/OpticSelector.select(dati.weapon1.optic);
		for i in range(5):
			%Weapon1/VBoxContainer/Hand.get_child(i+1).button_pressed = dati.weapon1.hand[i];
		for i in range(5):
			%Weapon1/VBoxContainer/Short.get_child(i+1).button_pressed = dati.weapon1.short[i];
		for i in range(5):
			%Weapon1/VBoxContainer/Medium.get_child(i+1).button_pressed = dati.weapon1.medium[i];
		for i in range(5):
			%Weapon1/VBoxContainer/Long.get_child(i+1).button_pressed = dati.weapon1.long[i];
		##	Arma e stat 2	
		%Weapon2/PanelContainer/MainWeapon/WeaponSelector.select(dati.weapon2.select);
		%Weapon2/PanelContainer/MainWeapon/WeaponSelector.emit_signal(
			"item_selected", 
			%Weapon2/PanelContainer/MainWeapon/WeaponSelector.selected
			)
		%Weapon2/PanelContainer/MainWeapon/OpticSelector.select(dati.weapon2.optic);
		for i in range(5):
			%Weapon2/VBoxContainer/Hand.get_child(i+1).button_pressed = dati.weapon2.hand[i];
		for i in range(5):
			%Weapon2/VBoxContainer/Short.get_child(i+1).button_pressed = dati.weapon2.short[i];
		for i in range(5):
			%Weapon2/VBoxContainer/Medium.get_child(i+1).button_pressed = dati.weapon2.medium[i];
		for i in range(5):
			%Weapon2/VBoxContainer/Long.get_child(i+1).button_pressed = dati.weapon2.long[i];
		
		%GadgetSelected.select(dati.gadget);
		%GadgetSelected.emit_signal("item_selected", %GadgetSelected.selected);
		
	else:
		print("JSON Parse Error: ", json.get_error_message());
