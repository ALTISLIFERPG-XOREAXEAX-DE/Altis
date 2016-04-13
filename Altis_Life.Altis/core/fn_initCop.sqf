#include "..\script_macros.hpp"
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Cop Initialization file.
*/
private "_end";
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;

if(life_blacklisted) exitWith {
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(FETCH_CONST(life_adminlevel) > 0) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 600;
};

if(FETCH_CONST(life_coplevel) == 0) then {
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};

//
// backpack texture
//
[] spawn {
	while {true} do {
		waitUntil {backpack player == "B_Kitbag_cbr"};
		(unitBackpack player) setObjectTextureGlobal [0, "textures\clothing\cop\backpack_police_2.paa"];
		waitUntil {backpack player != "B_Kitbag_cbr"};
	};
};

//
// SEK
//
[] spawn {
	while {true} do {
		waitUntil {uniform player == "U_B_CombatUniform_mcam_worn"};
		player setObjectTextureGlobal [0, "textures\clothing\cop\SEK.jpg"];
		waitUntil {uniform player != "U_B_CombatUniform_mcam_worn"};
	};
};

//
// SEK
//
[] spawn {
	while {true} do {
		waitUntil {uniform player == "U_B_CombatUniform_mcam_tshirt"};
		player setObjectTextureGlobal [0, "textures\clothing\cop\SEK.jpg"];
		waitUntil {uniform player != "U_B_CombatUniform_mcam_tshirt"};
	};
};

player setVariable["rank",(FETCH_CONST(life_coplevel)),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
