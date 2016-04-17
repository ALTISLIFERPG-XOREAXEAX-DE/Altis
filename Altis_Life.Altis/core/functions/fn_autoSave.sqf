
sleep 30;

while {true} do {
	if (alive player) then {
		if (life_is_alive == true) then {
			[] call life_fnc_saveGear;
			sleep 10;
			[] call SOCK_fnc_syncData;
			sleep 30;
			hint "Sie wurden mit dem Server gesynced.";
		};
	};
	
	sleep 600;
};
