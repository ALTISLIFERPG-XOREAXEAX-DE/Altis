
_camera = "camera" camCreate [0,0,0];
_camera CameraEffect ["internal","back"];
_camera CamCommitPrepared 0;

_camera camPrepareTarget [5789.28,-83292.53,-25736.98];
_camera camPreparePos [3642.66,13284.80,48.97];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

titleText ["","Black IN",4];

playSound ["welcome",false];

any=[
	[

		["# XOR $EAX,$EAX","<t align = 'center' size = '1'>%1</t><br/>"],
		["# XOR $EBX,$EBX","<t align = 'center' size = '1'>%1</t><br/>"],
		["# XOR $ECX,$ECX","<t align = 'center' size = '1'>%1</t><br/>"],
		["# XOR $EDX,$EDX","<t align = 'center' size = '1'>%1</t><br/>"],

		["Willkommen auf dem ultimativen ArmaLife Server!                ","<t align = 'center' size = '0.7'>%1</t><br/>"],
		["Server Restarts: 04:00, 10:00, 16:00, 22:00 Uhr                ","<t align = 'center' size = '0.7'>%1</t><br/>"],
		["Du warst beim Einloggen im Knast und all Dein Geld war weg?    ","<t align = 'center' size = '0.7'>%1</t><br/>"],
		["Das ist leider ein manchmal auftretender Serverbug :(          ","<t align = 'center' size = '0.7'>%1</t><br/>"],
		["Waffen und Kohle gibt es wieder und Schmerzensgeld oben drauf! ","<t align = 'center' size = '0.7'>%1</t><br/>"],
		["Melde Dich einfach bei uns im TS Support :)                    ","<t align = 'center' size = '0.7'>%1</t><br/>"],
		["-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*EOL","<t align = 'center' size = '0.7'>%1</t><br/>"]
		
	]
] spawn BIS_fnc_typeText;

sleep 16;
titleText ["","black out",3];
waitUntil {camCommitted _camera};

sleep 5;
titleText ["","Black IN",4];
_camera cameraEffect ["terminate","back"];
camDestroy _camera;

//
// Text Intro
//

_onScreenTime = 3;

_role1 = "Home of the [XOREAXEAX] gang.";
_role1names = ["powered by github.com/armalife"];

_role2 = "Unser Teamspeak:";
_role2names = ["78.47.101.8:31337"];

_role3 = "Unsere Homepage:";
_role3names = ["xoreaxeax.de"];

_role4 = "Server-Admins";
_role4names = ["Dr. Sommer","Don Promillo","B. Parker","M. Coleman"];

_role5 = "Polizeidirektion";
_role5names = ["Semir Gerkhan"];

_role6 = "Server Restarts";
_role6names = ["04:00 10:00 16:00 22:00"];

_role7 = "Kontakt:";
_role7names = ["9mmfullclip@gmail.com"];

_role8 = "Und jetzt ...";
_role8names = ["... ab ins Getümmel!"];

{
	sleep 3;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.50' color='#ff0000' align='right'>%1<br /></t>", _memberFunction]; 
	_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='right'>";
	
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);

	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	
	sleep (_onScreenTime);
} forEach [
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role4, _role4names],
	[_role5, _role5names],
	[_role6, _role6names],
	[_role7, _role7names],
	[_role8, _role8names]
];

_ui = "osefStatusBar" call BIS_fnc_rscLayer;
_ui cutRsc["osefStatusBar","PLAIN"];
