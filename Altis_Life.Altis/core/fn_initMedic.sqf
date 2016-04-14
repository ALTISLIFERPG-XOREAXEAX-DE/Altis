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

if(FETCH_CONST(life_medicLevel) == 0) exitWith {
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
// switch off third person for medics in cars.
// switch to 3rd person when getting out of car.
//
// this can be reverted by the medic once in the car, or out of the car.
// this is expected. its honestly just a convenience thing.
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
// BACKPACKS
//
[] spawn {
	while {true} do {
		waitUntil {backpack player == "B_Kitbag_sgg"};
		// (unitBackpack player) setObjectTextureGlobal [0, "textures\clothing\med\medic_backpack.jpg"];
		(unitBackpack player) setObjectTextureGlobal [0, "#(rgb,8,8,3)color(1,0,0,1)"];
		waitUntil {backpack player != "B_Kitbag_sgg"};
	};
};

[] spawn {
	while {true} do {
		waitUntil {backpack player == "B_Kitbag_cbr"};
		(unitBackpack player) setObjectTextureGlobal [0, "#(rgb,8,8,3)color(1,1,0,1)"];
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

//
// UNIFORMS
//
[] spawn {
	while {true} do {
		waitUntil {uniform player == "U_O_OfficerUniform_ocamo"};
		player setObjectTextureGlobal [0, "textures\clothing\med\medic_uniform.jpg"];
		waitUntil {uniform player != "U_O_OfficerUniform_ocamo"};
	};
};

[] spawn {
	while {true} do {
		waitUntil {uniform player == "U_B_HeliPilotCoveralls"};
		player setObjectTextureGlobal [0, "textures\clothing\med\adac_uniform.jpg"];
		waitUntil {uniform player != "U_B_HeliPilotCoveralls"};
	};
};

//
// Nur der ADAC kann die Abschleppfahrzeugfahrzeugabschleppfunktion aktivieren :)
//
if((str(player) in ["adac_1","adac_2","adac_3","adac_4"])) then {
	[] execVM "IgiLoad\IgiLoadInit.sqf";
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
