#include "..\..\script_macros.hpp"
/*
	File: fn_sedatedOut.sqf
*/
private "_obj";
params [
	["_target",objNull,[objNull]],
	["_who","",[""]]
];

if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(EQUAL(_who,"")) exitWith {};

// life_isknocked = true;
// life_istazed = true;

player setFatigue 1;

if ((getDammage player) < 0.5) then {
	player setDamage 0.5;
};

// life_isknocked = false;
// life_istazed = false;
