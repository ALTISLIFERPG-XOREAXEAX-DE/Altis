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
// Einsatzuniform (SEK oder COP, je nach Rang)
//
if(FETCH_CONST(life_coplevel) == 1) then {
	[] spawn {
		while {true} do {
			waitUntil {uniform player == "U_B_CombatUniform_mcam_worn"};
			player setObjectTextureGlobal [0, "textures\clothing\cop\polizei_weiss.jpg"];
			waitUntil {uniform player != "U_B_CombatUniform_mcam_worn"};
		};
	};
};

if(FETCH_CONST(life_coplevel) == 2) then {
	[] spawn {
		while {true} do {
			waitUntil {uniform player == "U_B_CombatUniform_mcam_worn"};
			player setObjectTextureGlobal [0, "textures\clothing\cop\polizei_weiss.jpg"];
			waitUntil {uniform player != "U_B_CombatUniform_mcam_worn"};
		};
	};
};

if(FETCH_CONST(life_coplevel) == 3) then {
	[] spawn {
		while {true} do {
			waitUntil {uniform player == "U_B_CombatUniform_mcam_worn"};
			player setObjectTextureGlobal [0, "textures\clothing\cop\polizei_blau.jpg"];
			waitUntil {uniform player != "U_B_CombatUniform_mcam_worn"};
		};
	};
};

if(FETCH_CONST(life_coplevel) == 4) then {
	[] spawn {
		while {true} do {
			waitUntil {uniform player == "U_B_CombatUniform_mcam_worn"};
			player setObjectTextureGlobal [0, "textures\clothing\cop\sek_blau.jpg"];
			waitUntil {uniform player != "U_B_CombatUniform_mcam_worn"};
		};
	};
};

if(FETCH_CONST(life_coplevel) == 5) then {
	[] spawn {
		while {true} do {
			waitUntil {uniform player == "U_B_CombatUniform_mcam_worn"};
			player setObjectTextureGlobal [0, "textures\clothing\cop\sek_schwarz.jpg"];
			waitUntil {uniform player != "U_B_CombatUniform_mcam_worn"};
		};
	};
};

if(FETCH_CONST(life_coplevel) > 5) then {
	[] spawn {
		while {true} do {
			waitUntil {uniform player == "U_B_CombatUniform_mcam_worn"};
			player setObjectTextureGlobal [0, "textures\clothing\cop\gsg9.paa"];
			waitUntil {uniform player != "U_B_CombatUniform_mcam_worn"};
		};
	};
};

//
// SEK (limited in shop to level 5)
//
[] spawn {
	while {true} do {
		waitUntil {uniform player == "U_B_CombatUniform_mcam_tshirt"};
		player setObjectTextureGlobal [0, "textures\clothing\cop\sek_schwarz.jpg"];
		waitUntil {uniform player != "U_B_CombatUniform_mcam_tshirt"};
	};
};

player setVariable["rank",(FETCH_CONST(life_coplevel)),true];
[] call life_fnc_spawnMenu;

waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn life_fnc_IntroCam;

[] spawn life_fnc_autoSave;
