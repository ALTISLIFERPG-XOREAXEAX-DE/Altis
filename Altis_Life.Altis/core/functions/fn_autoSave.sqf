
while {true} do {
	sleep 310;
	
	if (alive player) then {
		[] call life_fnc_saveGear;

		[] call SOCK_fnc_syncData;

		hint "Game autosaved.";
	};
};
