
sleep 30;

while {true} do {
	if (alive player) then {
		[] call life_fnc_saveGear;
		sleep 10;
		[] call SOCK_fnc_syncData;
		sleep 30;
		
		hint "Automatically synced player information to the server.";
	};
	sleep 600;
};
