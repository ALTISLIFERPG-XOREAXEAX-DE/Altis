
closeDialog 0;

player say2D "Weed_sound";

_smokefarbe1 = ["SmokeShellRed", "SmokeShellYellow", "SmokeShellPurple", "SmokeShellOrange"] call BIS_fnc_selectRandom;
_smokefarbe2 = ["SmokeShellRed", "SmokeShellYellow", "SmokeShellPurple", "SmokeShellOrange"] call BIS_fnc_selectRandom;

_smoke1 = _smokefarbe1 createVehicle position player;
_smoke2 = _smokefarbe2 createVehicle position player;
if (vehicle player != player) then {
_smoke1 attachTo [vehicle player, [-0.6,-1,0]];
_smoke2 attachTo [vehicle player, [-0.6,-1,0]];
} else {
_smoke1 attachTo [player, [0,0,1]];
_smoke2 attachTo [player, [0,0,1]];
};

"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

for "_i" from 0 to 30 do
{
	if(life_drug > 0) then {
		"chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
		"chromAberration" ppEffectCommit 1;
		"radialBlur" ppEffectAdjust [random 0.02,random 0.02,0.15,0.15];
		"radialBlur" ppEffectCommit 1;
		addcamShake[random 3, 1, random 3];
		sleep 1;
	};
};

"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust [0,0,0,0];
"radialBlur" ppEffectCommit 5;

sleep 6;

"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;
enableCamShake false;
deleteVehicle _smoke1;
deleteVehicle _smoke2;
