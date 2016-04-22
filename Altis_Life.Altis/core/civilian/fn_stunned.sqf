#include "..\..\script_macros.hpp"
/*
	File: fn_stunned.sqf
	From fn_tazed by Bryan "Tonic" Boardwine
	
	Description:
	Starts the stunned animation and broadcasts out what it needs to.
*/
private["_curWep","_curMags","_attach"];
params [
	["_unit",objNull,[objNull]],
	["_shooter",objNull,[objNull]]
];

if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};

if(_shooter isKindOf "Man" && alive player) then {
	if(!life_istazed) then {
		life_istazed = true;

		player setFatigue 1;
		
		if ((getDammage player) < 0.9) then {
			player setDamage 0.9;
		};
		
		disableUserInput true;

		closeDialog 0;

		[0,"STR_NOTF_Stunned",true,[profileName, _shooter GVAR ["realname",name _shooter]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];		

		_curWep = currentWeapon player;
		_curMags = magazines player;
		_attach = if(!(EQUAL(RIFLE,""))) then {RIFLE_ITEMS} else {[]};
		
		{player removeMagazine _x} foreach _curMags;
		player removeWeapon _curWep;
		player addWeapon _curWep;
		if(!(EQUAL(count _attach,0)) && !(EQUAL(RIFLE,""))) then {
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _attach;
		};
		
		if(!(EQUAL(count _curMags,0))) then {
			{player addMagazine _x;} foreach _curMags;
		};

		_obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player);
		_obj setPosATL ASLTOATL(visiblePositionASL player);
		[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExecCall ["life_fnc_animSync",RCLIENT];
		_unit attachTo [_obj,[0,0,0]];
		sleep 180;

		[player,"amovppnemstpsraswrfldnon"] remoteExecCall ["life_fnc_animSync",RCLIENT];

		if(!(player GVAR ["Escorting",false])) then {
			detach player;
		};

		player allowDamage true;
		disableUserInput false;

		player setFatigue 1;
		
		if ((getDammage player) < 0.9) then {
			player setDamage 0.9;
		};

		//
		// 30 seconds resistance after getting shot for 3 minutes.
		//
		sleep 30;
		
		life_istazed = false;
	};
} else {
	_unit allowDamage true;
	life_istazed = false;
};