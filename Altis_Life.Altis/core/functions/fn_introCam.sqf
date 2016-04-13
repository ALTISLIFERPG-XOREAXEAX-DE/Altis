/*
	File: IntroCam
	Author: DeadP4xel (for SealDrop.de)
*/
private ["_camera", "_camDistance","_randCamX","_randCamY","_camTime"];
_camDistance = 1000;
_randCamX = 75 - floor(random 150);
_randCamY = 75 - floor(random 150);

// the one below basically says that if you already joined the server once the time of the camera movement will be faster, else it might get annoying

if(!life_firstSpawn) then {
	_camTime = 10;
} else {
	_camTime = 5;
};

//intro move
playSound ["welcome",false];
showCinemaBorder true;
camUseNVG false;

_camera = "camera" camCreate [(position player select 0)+_randCamX, (position player select 1)+_randCamY,(position player select 2)+_camDistance];
_camera cameraEffect ["internal","back"];

_camera camSetFOV 0.7;
_camera camCommit 0;
waitUntil {camCommitted _camera};

_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit _camTime;

waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;
life_firstSpawn = false;

//
// Text Intro
//

_onScreenTime = 3;

_role1 = "Welcome to altislife.xoreaxeax.de"; //In Rot
_role1names = ["powered by github.com/armalife"]; //In Weiß

_role2 = "Unser Teamspeak:";
_role2names = ["mail.xoreaxeax.de"]; 

_role3 = "Unsere Homepage:";
_role3names = ["xoreaxeax.de"];

_role4 = "Server-Admins";
_role4names = ["Dr. Sommer","B. Parker","M. Coleman"];

_role5 = "Polizeileitung";
_role5names = ["Max"];

_role6 = "Server Restarts";
_role6names = ["04:00 10:00 16:00 22:00"];

_role7 = "Support und technische Hilfe:";
_role7names = ["support@xoreaxeax.de"];

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
