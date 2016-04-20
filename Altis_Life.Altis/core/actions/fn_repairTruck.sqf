#include "..\..\script_macros.hpp"
/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_test"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then {
	if("ToolKit" in (items player)) then {
		life_action_inUse = true;
		_displayName = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _veh),"displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];

		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = GVAR_UINS "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;

		while{true} do {
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				[player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
				player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};

			sleep 0.27;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
		};

		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_ActionInVehicle","PLAIN"];};
		player removeItem "ToolKit";

		//
		// https://resources.bisimulations.com/wiki/Damage_Modeling:_Objects:_Vehicles#HitLBWheel
		//

		if(_veh isKindOf "Car") then {
			if ((_veh getHitPointDamage "HitLFWheel") > 0.5) then {
				_veh setHitPointDamage["HitLFWheel",0.4];
				
				titleText[localize "STR_NOTF_RepairedVehiclePartly","PLAIN"];
			} else {
				if ((_veh getHitPointDamage "HitRFWheel") > 0.5) then {
					_veh setHitPointDamage["HitRFWheel",0.4];
					
					titleText[localize "STR_NOTF_RepairedVehiclePartly","PLAIN"];
				} else {
					if ((_veh getHitPointDamage "HitLBWheel") > 0.5) then {
						_veh setHitPointDamage["HitLBWheel",0.4];
						_veh setDamage 0.5;
						_veh setHitPointDamage["HitRBWheel",1];
						
						titleText[localize "STR_NOTF_RepairedVehiclePartlyLB","PLAIN"];
					} else {
					if ((_veh getHitPointDamage "HitRBWheel") > 0.5) then {
						_veh setHitPointDamage["HitRBWheel",0.4];
						_veh setDamage 0.25;

						titleText[localize "STR_NOTF_RepairedVehiclePartlyRB","PLAIN"];
					} else {
						_veh setDamage 0;
						titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
					};
				};
			};
		};
		} else {
			_veh setDamage 0;			
			titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
		};
	};
};
