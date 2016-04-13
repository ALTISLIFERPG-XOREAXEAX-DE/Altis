#include "script_macros.hpp"
/*
	File: initPlayerLocal.sqf
	Author:

	Description:
	Starts the initialization of the player.
*/
if (!hasInterface && !isServer) exitWith {
	[] call compile PreprocessFileLineNumbers "\life_hc\initHC.sqf";
}; //This is a headless client.

#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)

CONST(BIS_fnc_endMission,BIS_fnc_endMission);
if(EQUAL(LIFE_SETTINGS(getNumber,"spyglass_init"),1)) then {[] execVM "SpyGlass\fn_initSpy.sqf";};

[] execVM "core\init.sqf";

//
// save gear every 5 minutes
//
[] spawn life_fnc_autoSave;

//
// server intro
//
[] spawn life_fnc_IntroCam;

if(hasInterface)then {
	waitUntil {time > 0};
	group player selectLeader player;
	enableEnvironment false;
	enableRadio false;
	0 faderadio 0;
	player setSpeaker "NoVoice";
	setTerrainGrid 50;
	setViewDistance 800;
	setObjectViewDistance [800,3];

	//
	// weather:fog
	//
	[] spawn {
		while{true} do {
			uiSleep 10;
			200 setFog 0;
			uiSleep 590;
		};
	};

	//
	// weather:rain
	//
	[] spawn {
		while{true} do {
			uiSleep 10;
			200 setRain 0;
			uiSleep 590;
		};
	};
	
	[] execVM "custom\scripts\statusbar.sqf";
	[] execVM "custom\scripts\voiceControl.sqf";
	[] execVM "custom\scripts\depleteVehicleFuel.sqf";
};
