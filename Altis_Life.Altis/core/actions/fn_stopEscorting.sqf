/*
	File: fn_stopEscorting.sqf
	Author: 
	
	Description:
	ASFSDFHAGFASF
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(!(_unit getVariable "Escorting")) exitWith {};
if(isNull _unit) exitWith {}; //Not valid
detach _unit;
_unit setVariable["Escorting",false,true];
