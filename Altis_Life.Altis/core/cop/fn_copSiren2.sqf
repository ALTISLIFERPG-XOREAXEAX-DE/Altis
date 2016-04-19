#include "..\..\script_macros.hpp"

/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts a cop siren sound for other players
*/

private["_vehicle"];
_vehicle = param [0,ObjNull,[ObjNull]];

if(isNull _vehicle) exitWith {};
if(!alive _vehicle) exitWith {};
if(isNull _vehicle) exitWith {};

_vehicle say3D "polizei_rp";
sleep 5;