#include "..\..\script_macros.hpp"
/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];

_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

if (FETCH_CONST(life_adminlevel) > 1) then {
	player addItem "FirstAidKit";
	player addItem "FirstAidKit";
	
	player addBackpack "B_Carryall_oucamo";
	player addVest "V_TacVestIR_blk";
	player addHeadgear "H_CrewHelmetHeli_B";

	player addItem "ItemMap";
	player assignItem "ItemMap";

	player addItem "ItemCompass";
	player assignItem "ItemCompass";

	player addItem "ItemWatch";
	player assignItem "ItemWatch";

	player addItem "ItemGPS";
	player assignItem "ItemGPS";

	player addItem "MediKit";

	player addItem "ToolKit";
	player addItem "ToolKit";
	player addItem "ToolKit";

	player addItem "NVGoggles_OPFOR";
	player assignItem "NVGoggles_OPFOR";
	
	player addUniform "U_Marshal";
};

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
