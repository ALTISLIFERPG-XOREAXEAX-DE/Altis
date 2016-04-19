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

//
// Field Service Trucks and Ammo Transports can only be slowed, not fully disabled.
//
if (typeOf _vehicle in ["B_Truck_01_mover_F","B_Truck_01_ammo_F"]) then {
	_vehicle setHitPointDamage["HitRFWheel",1];
} else {
	_vehicle setHitPointDamage["HitLFWheel",1];
	_vehicle setHitPointDamage["HitRFWheel",1];

	_vehicle setHitPointDamage["HitLMWheel",1];
	_vehicle setHitPointDamage["HitRMWheel",1];

	_vehicle setHitPointDamage["HitLF2Wheel",1];
	_vehicle setHitPointDamage["HitRF2Wheel",1];

	_vehicle setHitPointDamage["HitLBWheel",1];
	_vehicle setHitPointDamage["HitRBWheel",1];
};
