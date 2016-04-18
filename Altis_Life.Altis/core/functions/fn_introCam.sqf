#include "..\..\script_macros.hpp"

//
// (I) Camera Intro Kavala for everybody
//
_camera = "camera" camCreate [0,0,0];
_camera CameraEffect ["internal","back"];
_camera CamCommitPrepared 0;

_camera camPrepareTarget [5789.28,-83292.53,-25736.98];
_camera camPreparePos [3642.66,13284.80,48.97];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;

titleText ["","Black IN",4];

playSound ["welcome_teaser",false];

if(FETCH_CONST(life_adminlevel) > 0) then {
	//
	// ADMINS
	//
	any=[
		[
			["# XOR $EAX,$EAX","<t align = 'center' size = '1'>%1</t><br/>"],
			["Sie wurden als Spieladministrator angemeldet.","<t align = 'center' size = '1'>%1</t><br/>"],
			["Bitte beachten Sie unbedingt die Serverregeln.","<t align = 'center' size = '1'>%1</t><br/>"],
			["Admins und Support sind der Polizei im RP nicht weisungsbefugt.","<t align = 'center' size = '1'>%1</t><br/>"],
			["Seien Sie hilfsbereit, Sie haben eine Vorbildfunktion.","<t align = 'center' size = '1'>%1</t><br/>"],
			["#1) Respektieren Sie die Rechte der Spieler.","<t align = 'center' size = '1'>%1</t><br/>"],
			["Niemand darf grundlos ausspioniert werden.","<t align = 'center' size = '1'>%1</t><br/>"],
			["#2) Denken Sie nach bevor Sie etwas als Admin tun.","<t align = 'center' size = '1'>%1</t><br/>"],
			["Handeln Sie niemals aus Eigennutz.","<t align = 'center' size = '1'>%1</t><br/>"],
			["#3) Mit grosser Macht kommt grosse Verantwortung.","<t align = 'center' size = '1'>%1</t><br/>"],
			["Die Ihnen anvertrauten Rechte werden bei Missbrauch sofort wieder entzogen.","<t align = 'center' size = '1'>%1</t><br/>"],
			["~~~~~~~~~~~~~~~~~~~~~~~ BITTE WARTEN ~~~~~~~~~~~~~~~~~~~~~~~","<t align = 'center' size = '1'>%1</t><br/>"]
			
		]
	] spawn BIS_fnc_typeText;

	// has to be adjusted to the length of the text above.
	sleep 100;
	
	titleText ["","black out",3];
	waitUntil {camCommitted _camera};

	sleep 2;
	
	titleText ["","black in",4];
	_camera cameraEffect ["terminate","back"];
	camDestroy _camera;
	
} else {
	if(FETCH_CONST(life_coplevel) > 0) then {
		//
		// COPS
		//
		any=[
			[
				["# XOR $EAX,$EAX","<t align = 'center' size = '1'>%1</t><br/>"],
				["Sie sind in den Polizeidienst eingetreten.","<t align = 'center' size = '1'>%1</t><br/>"],
				["Halten Sie sich unbedingt an die Serverregeln (Cop-RP).","<t align = 'center' size = '1'>%1</t><br/>"],
				["Mord an Unbewaffneten und Wehrlosen wird sofort gebannt.","<t align = 'center' size = '1'>%1</t><br/>"],
				["Weisungen des Polizeichefs ist im TS und im Spiel Folge zu leisten.","<t align = 'center' size = '1'>%1</t><br/>"],
				["Das gleiche gilt bei Weisungen von Dienstvorgesetzten im Spiel.","<t align = 'center' size = '1'>%1</t><br/>"],
				["Admins und Support sind der Polizei im RP nicht weisungsbefugt.","<t align = 'center' size = '1'>%1</t><br/>"],
				["~~~~~~~~~~~~~~~~~~~~~~~ BITTE WARTEN ~~~~~~~~~~~~~~~~~~~~~~~","<t align = 'center' size = '1'>%1</t><br/>"]
				
			]
		] spawn BIS_fnc_typeText;

		// has to be adjusted to the length of the text above.
		sleep 60;

		titleText ["","black out",3];
		waitUntil {camCommitted _camera};
	
		sleep 2;
	
		titleText ["","black in",4];
		_camera cameraEffect ["terminate","back"];
		camDestroy _camera;
	} else {
		any=[
			[
				["# XOR $EAX,$EAX","<t align = 'center' size = '1'>%1</t><br/>"]
			]
		] spawn BIS_fnc_typeText;

		sleep 4;
	
		titleText ["","black out",3];
		waitUntil {camCommitted _camera};
	
		sleep 2;
	
		titleText ["","black in",4];
		_camera cameraEffect ["terminate","back"];
		camDestroy _camera;
	};
};

//
// Text Intro
//

_onScreenTime = 1;

if(FETCH_CONST(life_adminlevel) > 0) then {
	playSound ["welcome_admins",false];
} else {
	if(FETCH_CONST(life_coplevel) > 0) then {
		playSound ["welcome_cops",false];
	} else {
		// civs and medics
		playSound ["welcome_sample",false];
	};
};

_role1 = "Home of the [XOREAXEAX] gang.";
_role1names = ["powered by github.com/armalife"];

_role2 = "Unser Teamspeak:";
_role2names = ["78.47.101.8:31337"];

_role3 = "Unsere Homepage:";
_role3names = ["xoreaxeax.de"];

_role4 = "Server-Admins";
_role4names = ["Dr. M. Sommer","B. Parker","M. Coleman"];

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
