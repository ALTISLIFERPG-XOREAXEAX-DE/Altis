#include "..\script_macros.hpp"
/*
	File: fn_survival.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	All survival? things merged into one thread.
*/
private["_fnc_food","_fnc_water","_fnc_incremental_paycheck","_foodTime","_waterTime","_paycheckTime","_paycheckStartTime","_bp","_walkDis","_lastPos","_curPos","_currentIncrementalPaycheck"];

_fnc_food =  {
	if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
	else
	{
		SUB(life_hunger,10);
	
		[] call life_fnc_hudUpdate;

		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
		switch(life_hunger) do {
			case 30: {hint localize "STR_NOTF_EatMSG_1";};
			case 20: {hint localize "STR_NOTF_EatMSG_2";};
			case 10: {
				hint localize "STR_NOTF_EatMSG_3";
				if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
			};
		};
	};
};
	
_fnc_water = {
	if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
	else
	{
		SUB(life_thirst,10);

		[] call life_fnc_hudUpdate;

		if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
		switch(life_thirst) do  {
			case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
			case 20: {
				hint localize "STR_NOTF_DrinkMSG_2";
				if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
			};
			case 10: {
				hint localize "STR_NOTF_DrinkMSG_3";
				if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
			};
		};
	};
};

_fnc_incremental_paycheck = {
	if (playerSide == civilian) then {
		if ((life_hunger > 50) && (life_thirst > 50)) then {
		
			if ((life_atmbank + life_cash) < 200000) then {
				_currentIncrementalPaycheck = (time - _paycheckStartTime) * 1.7;
			};

			if ((life_atmbank + life_cash) < 400000) then {
				_currentIncrementalPaycheck = (time - _paycheckStartTime) * 1.5;
			};
		
			if ((life_atmbank + life_cash) < 600000) then {
				_currentIncrementalPaycheck = (time - _paycheckStartTime) * 1.3;
			};

			if ((life_atmbank + life_cash) < 800000) then {
				_currentIncrementalPaycheck = (time - _paycheckStartTime) * 1.1;
			};
		
			if ((life_atmbank + life_cash) < 1000000) then {
				_currentIncrementalPaycheck = (time - _paycheckStartTime) * 1;
			};

			if ((life_atmbank + life_cash) < 2000000) then {
				_currentIncrementalPaycheck = (time - _paycheckStartTime) * 0.9;
			};
		
			if ((life_atmbank + life_cash) < 4000000) then {
				_currentIncrementalPaycheck = (time - _paycheckStartTime) * 0.7;
			};
		
			if ((life_atmbank + life_cash) < 6000000) then {
				_currentIncrementalPaycheck = (time - _paycheckStartTime) * 0.5;
			} else {
				_currentIncrementalPaycheck = (time - _paycheckStartTime) * 0.2;
			};
		
			life_atmbank = life_atmbank + _currentIncrementalPaycheck;

			systemChat format[localize "STR_FSM_ReceivedIncrementalPay",[_currentIncrementalPaycheck] call life_fnc_numberText];
			
		};
	};
};

//Setup the time-based variables.
_foodTime = time;
_waterTime = time;
_paycheckTime = time;
_paycheckStartTime = time;

_walkDis = 0;
_bp = "";
_lastPos = visiblePosition player;
_lastPos = (SEL(_lastPos,0)) + (SEL(_lastPos,1));
_lastState = vehicle player;

while {true} do {
	/* Incremental paycheck */
	if((time - _paycheckTime) > 600) then {[] call _fnc_incremental_paycheck; _paycheckTime = time;};

	/* Thirst / Hunger adjustment that is time based */
	if((time - _waterTime) > 600) then {
		[] call _fnc_water;
		_waterTime = time;
		
		if ((FETCH_CONST(life_adminlevel)) > 1) then {
			if (playerSide == independent) then {
				life_thirst = 99;
			};
		};
	};
	
	if((time - _foodTime) > 1200) then {
		[] call _fnc_food;
		_foodTime = time;
		
		if ((FETCH_CONST(life_adminlevel)) > 1) then {
			if (playerSide == independent) then {
				life_hunger = 99;
			};
		};
	};

	/* Adjustment of carrying capacity based on backpack changes */
	if(EQUAL(backpack player,"")) then {
		life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight");
		_bp = backpack player;
	} else {
		if(!(EQUAL(backpack player,"")) && {!(EQUAL(backpack player,_bp))}) then {
			_bp = backpack player;
			life_maxWeight = LIFE_SETTINGS(getNumber,"total_maxWeight") + round(FETCH_CONFIG2(getNumber,CONFIG_VEHICLES,_bp,"maximumload") / 4);
		};
	};
	
	/* Check if the player's state changed? */
	if(vehicle player != _lastState OR {!alive player}) then {
		[] call life_fnc_updateViewDistance;
		_lastState = vehicle player;
	};
	
	/* Check if the weight has changed and the player is carrying to much */
	if(life_carryWeight > life_maxWeight && {!isForcedWalk player}) then {
		player forceWalk true;
		if(EQUAL(LIFE_SETTINGS(getNumber,"enable_fatigue"),1)) then {player setFatigue 1;};
		hint localize "STR_NOTF_MaxWeight";
	} else {
		if(isForcedWalk player) then {
			player forceWalk false;
		};
	};
	
	/* Travelling distance to decrease thirst/hunger which is captured every second so the distance is actually greater then 650 */
	if(!alive player) then {_walkDis = 0;} else {
		_curPos = visiblePosition player;
		_curPos = (SEL(_curPos,0)) + (SEL(_curPos,1));
		if(!(EQUAL(_curPos,_lastPos)) && {(vehicle player == player)}) then {
			ADD(_walkDis,1);
			if(EQUAL(_walkDis,650)) then {
				_walkDis = 0;
				SUB(life_thirst,5);
				SUB(life_hunger,5);
				[] call life_fnc_hudUpdate;
			};
		};
		_lastPos = visiblePosition player;
		_lastPos = (SEL(_lastPos,0)) + (SEL(_lastPos,1));
	};
	uiSleep 1;
};
