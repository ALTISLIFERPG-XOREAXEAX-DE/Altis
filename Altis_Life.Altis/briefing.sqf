waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["controls","Controls"];

player createDiaryRecord ["controls",
	[
		"",
			"
			Y/Z: Open Player Menu<br/>
			U: Lock and unlock vehicles and houses<br/>
			F: Cop Siren (if cop)<br/>
			T: Vehicle Trunk<br/>
			Left Shift + B: Surrender<br/>
			Left Shift + R: Restrain (Cop Only)<br/>
			Left Shift + G: Knock out / stun (Civ Only, used for robbing them)<br/>
			Left Windows: Main Interaction key which is used for interacting with vehicles/houses (repair, etc) and for cops to interact with civilians. Can be rebound to a single key like H by pressing ESC->Configure->Controls->Custom->Use Action 10<br/>
			Left Windows + T: Used for picking up items/money and gathering<br/>
			Left Shift + L: Activates cop/medic siren lights (as a cop/medic)<br/>
			Left Shift + H: Holster's your pistol<br/>
			Left Ctrl + H: Revert holster action<br/>
			H: Unrestrain the player you are looking at<br/>
			"
	]
];
