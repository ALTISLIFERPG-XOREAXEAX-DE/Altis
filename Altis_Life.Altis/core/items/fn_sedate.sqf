#include "..\..\script_macros.hpp"
/*
	File: fn_sedate.sqf
*/
private["_victim"];
_victim = param [0,ObjNull,[ObjNull]];

if(isNull _victim) exitWith {};
if(!(_victim isKindOf "Man")) exitWith {};

[_victim,profileName] remoteExec ["life_fnc_sedatedOut",_victim];