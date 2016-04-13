
closeDialog 0;

player say2D "Cocaine_sound";

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

"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
"dynamicBlur" ppEffectCommit 20; // time it takes to normal
20 fadeSound 1; //fades the sound back to normal

player setDamage (0.2 + (damage player));

"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [9]; // intensity of blur
"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
enableCamShake true; // enables camera shake
addCamShake [20, 100, 10]; // sets shakevalues
player setFatigue 1; // sets the fatigue to 100%
5 fadeSound 0.1; // fades the sound to 10% in 5 seconds

sleep 50;

"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
"dynamicBlur" ppEffectCommit 20; // time it takes to normal
20 fadeSound 1; //fades the sound back to normal

deleteVehicle _smoke1;
deleteVehicle _smoke2;
