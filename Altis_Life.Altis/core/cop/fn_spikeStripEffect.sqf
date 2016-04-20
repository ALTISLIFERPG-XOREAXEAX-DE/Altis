#include "..\..\script_macros.hpp"
/*
	File: fn_spikeStripEffect.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Doesn't work without the server-side effect but shifted part of it clientside
	so code can easily be changed. Ultimately it just pops the tires.
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Bad vehicle type

if (speed _vehicle < 40) then {
	{
		if ((getDammage _x) < 0.4) then { _x setDamage 0.4; };
	} forEach crew _vehicle;
} else {
	[_vehicle] remoteExec ["life_fnc_copSiren4",RCLIENT];

	if (typeOf _vehicle in ["B_Truck_01_mover_F","B_Truck_01_ammo_F"]) then {
		_vehicle setDamage 0.25;
	} else {
		if (typeOf _vehicle in ["B_MRAP_01_F","B_MRAP_01_hmg_F"]) then {
			_vehicle setDamage 0.75;
		} else {
			_vehicle setDamage 0.5;
		};
	};
	
	if (speed _vehicle < 80) then {
		{
			if ((getDammage _x) < 0.6) then { _x setDamage 0.6; };
		} forEach crew _vehicle;
	} else {
		_vehicle setFuel 0;

		if (speed _vehicle < 120) then {
			{
				if ((getDammage _x) < 0.8) then { _x setDamage 0.8; };
			} forEach crew _vehicle;
		} else {
			{ _x setDamage 0.9; } forEach crew _vehicle;
		};
	};
};

_vehicle setHitPointDamage["HitLFWheel",1];
_vehicle setHitPointDamage["HitRFWheel",1];

if (speed _vehicle > 40) then {
	_vehicle setHitPointDamage["HitLMWheel",1];
	_vehicle setHitPointDamage["HitRMWheel",1];

	_vehicle setHitPointDamage["HitLF2Wheel",1];
	_vehicle setHitPointDamage["HitRF2Wheel",1];

	_vehicle setHitPointDamage["HitLBWheel",1];
	_vehicle setHitPointDamage["HitRBWheel",1];
};
