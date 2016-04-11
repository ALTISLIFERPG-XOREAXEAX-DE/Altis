#include "..\script_macros.hpp"
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((FETCH_CONST(life_medicLevel)) < 1 && (FETCH_CONST(life_adminlevel) == 0)) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

if(EQUAL(LIFE_SETTINGS(getNumber,"allow_medic_weapons"),0)) then
{
	[] spawn
	{
		while {true} do
		{
			waitUntil {sleep 3; currentWeapon player != ""};
			removeAllWeapons player;
		};
	};
};

//
// disable Autohover for medics
//
//["disableAutohover", "onEachFrame", {
//	_vehicle = vehicle player;
//	if(isAutoHoverOn _vehicle) then {
//		player action ["autoHoverCancel", _vehicle];
//	}
//}] call BIS_fnc_addStackedEventHandler;
//

//
// disable third person for medics in cars, switch to 3rd person when getting out of car
//
[] spawn {
	while {true} do {
		waitUntil {sleep 3; vehicle player != player};
		player switchCamera "Internal";

		waitUntil {sleep 3; vehicle player == player};
		player switchCamera "External";
	};
};

//
// backpack texture
//

[] spawn {
	while {true} do {
		waitUntil {backpack player == "B_Kitbag_cbr"};
		(unitBackpack player) setObjectTextureGlobal [0, "textures\clothing\med\medic_backpack1.jpg"];
		waitUntil {backpack player != "B_Kitbag_cbr"};
	};
};

[] spawn {
	while {true} do {
		waitUntil {backpack player == "B_Carryall_oucamo"};
		(unitBackpack player) setObjectTextureGlobal [0, "#(rgb,8,8,3)color(1,1,1,1)"];
		waitUntil {backpack player != "B_Carryall_oucamo"};
	};
};

[] execVM "IgiLoad\IgiLoadInit.sqf";

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
