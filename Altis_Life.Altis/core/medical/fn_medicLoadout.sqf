#include "..\..\script_macros.hpp"
/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];

if (FETCH_CONST(life_adminlevel) == 0) then {
	_handle = [] spawn life_fnc_stripDownPlayer;
	waitUntil {scriptDone _handle};

	player addUniform "U_Rangemaster";
	player addItem "FirstAidKit";
	player addItem "FirstAidKit";
	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";
	player addItem "ItemWatch";
	player assignItem "ItemWatch";

	[] call life_fnc_playerSkins;
	[] call life_fnc_saveGear;
} else {
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
};
