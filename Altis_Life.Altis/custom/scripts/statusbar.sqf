
waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

4 cutRsc ["osefStatusBar","PLAIN"];

[] spawn {
    sleep 30;
    
	_colourDefault    = parseText "#ADADAD";
	_colour100 		  = parseText "#33FF00";
	_colour90 		  = parseText "#33FF00";
	_colour80 		  = parseText "#33FF00";
	_colour70 		  = parseText "#33FF00";
	_colour60 		  = parseText "#66FF00";
	_colour50 		  = parseText "#CCFF00";
	_colour40 		  = parseText "#FFFF00";
	_colour30 		  = parseText "#FFFF00";
	_colour20 		  = parseText "#CC0000";
	_colour10 		  = parseText "#CC0000";
	_colour0 		  = parseText "#CC0000";
	_colourDead 	  = parseText "#000000";
	_colourUpTimeHUD  = parseText "#CCCCCC";
    
	while {true} do {
		sleep 10;
		
		if(isNull ((uiNamespace getVariable "statusBar")displayCtrl 55555)) then {
			diag_log "statusbar is null create";
			disableSerialization;
			_rscLayer = "statusBar" call BIS_fnc_rscLayer;
			_rscLayer cutRsc["statusBar","PLAIN"];
		};
    
        _CivplayHUD = civilian countSide playableUnits;
		switch(_CivplayHUD) do
		{
			case 9: {_CivplayHUD = "09"};
			case 8: {_CivplayHUD = "08"};
			case 7: {_CivplayHUD = "07"};
			case 6: {_CivplayHUD = "06"};
			case 5: {_CivplayHUD = "05"};
			case 4: {_CivplayHUD = "04"};
			case 3: {_CivplayHUD = "03"};
			case 2: {_CivplayHUD = "02"};
			case 1: {_CivplayHUD = "01"};
			case 0: {_CivplayHUD = "00"};
		};
		
        _WestplayHUD = west countSide playableUnits;
		switch(_WestplayHUD) do
		{
			case 9: {_WestplayHUD = "09"};
			case 8: {_WestplayHUD = "08"};
			case 7: {_WestplayHUD = "07"};
			case 6: {_WestplayHUD = "06"};
			case 5: {_WestplayHUD = "05"};
			case 4: {_WestplayHUD = "04"};
			case 3: {_WestplayHUD = "03"};
			case 2: {_WestplayHUD = "02"};
			case 1: {_WestplayHUD = "01"};
			case 0: {_WestplayHUD = "00"};
		};

        _IndepplayHUD = independent countSide playableUnits;
		switch(_IndepplayHUD) do
		{
			case 9: {_IndepplayHUD = "09"};
			case 8: {_IndepplayHUD = "08"};
			case 7: {_IndepplayHUD = "07"};
			case 6: {_IndepplayHUD = "06"};
			case 5: {_IndepplayHUD = "05"};
			case 4: {_IndepplayHUD = "04"};
			case 3: {_IndepplayHUD = "03"};
			case 2: {_IndepplayHUD = "02"};
			case 1: {_IndepplayHUD = "01"};
			case 0: {_IndepplayHUD = "00"};
		};
		
        _EastplayHUD = east countSide playableUnits;
		switch(_EastplayHUD) do
		{
			case 9: {_EastplayHUD = "09"};
			case 8: {_EastplayHUD = "08"};
			case 7: {_EastplayHUD = "07"};
			case 6: {_EastplayHUD = "06"};
			case 5: {_EastplayHUD = "05"};
			case 4: {_EastplayHUD = "04"};
			case 3: {_EastplayHUD = "03"};
			case 2: {_EastplayHUD = "02"};
			case 1: {_EastplayHUD = "01"};
			case 0: {_EastplayHUD = "00"};
		};
		
		_grid = mapGridPosition player;
		_xx = (format[_grid]) select  [0,3];
        _yy = (format[_grid]) select  [3,3];
		
        _hunger = round(life_hunger);
		
		_hunger_display = _hunger;
		
		if (_hunger_display > 99) then {
			_hunger_display = 99;
		};

		if (_hunger_display < 10) then {
			_hunger_display = 10;
		};
		
        _thirst = round(life_thirst);
		
		_thirst_display = _thirst;

		if (_thirst_display > 99) then {
			_thirst_display = 99;
		};
		
		if (_thirst_display < 10) then {
			_thirst_display = 10;
		};
		
		_damage = round ((1 - (damage player)) * 100);

		if (_damage > 99) then {
			_damage = 99;
		};

        _stamina = round(getFatigue player * 100) / 100;

		_FpsHud = round (diag_fps);
		
		if (_FpsHud > 99) then {
			_FpsHud = 99;
		};

		//
		// 6 hour server restart time window
		//
		_time = (round(358-(serverTime)/60));

		_hours = (floor(_time/60));
		_minutes = (_time - (_hours * 60));

		switch(_hours) do
		{
			case 6: {_hours = "06"};
			case 5: {_hours = "05"};
			case 4: {_hours = "04"};
			case 3: {_hours = "03"};
			case 2: {_hours = "02"};
			case 1: {_hours = "01"};
			case 0: {_hours = "00"};
		};
		
		switch(_minutes) do
		{
			case 9: {_minutes = "09"};
			case 8: {_minutes = "08"};
			case 7: {_minutes = "07"};
			case 6: {_minutes = "06"};
			case 5: {_minutes = "05"};
			case 4: {_minutes = "04"};
			case 3: {_minutes = "03"};
			case 2: {_minutes = "02"};
			case 1: {_minutes = "01"};
			case 0: {_minutes = "00"};
		};

		_colourHunger = _colourDefault;
		switch true do {
			case(_hunger >= 100)                     : {_colourHunger = _colour70;};
			case((_hunger >= 90) && (_hunger < 100)) : {_colourHunger =  _colour70;};
			case((_hunger >= 80) && (_hunger < 90))  : {_colourHunger =  _colour70;};
			case((_hunger >= 70) && (_hunger < 80))  : {_colourHunger =  _colour70;};
			case((_hunger >= 60) && (_hunger < 70))  : {_colourHunger =  _colour60;};
			case((_hunger >= 50) && (_hunger < 60))  : {_colourHunger =  _colour50;};
			case((_hunger >= 40) && (_hunger < 50))  : {_colourHunger =  _colour40;};
			case((_hunger >= 30) && (_hunger < 40))  : {_colourHunger =  _colour30;};
			case((_hunger >= 20) && (_hunger < 30))  : {_colourHunger =  _colour20;};
			case((_hunger >= 10) && (_hunger < 20))  : {_colourHunger =  _colour10;};
			case((_hunger >= 1)  && (_hunger < 10))  : {_colourHunger =  _colour0;};
			case(_hunger < 1)                        : {_colourHunger =  _colourDead;};
		};
		
		_colourThirst = _colourDefault;		
		switch true do{
			case(_thirst >= 100)                     : {_colourThirst = _colour70;};
			case((_thirst >= 90) && (_thirst < 100)) : {_colourThirst =  _colour70;};
			case((_thirst >= 80) && (_thirst < 90))  : {_colourThirst =  _colour70;};
			case((_thirst >= 70) && (_thirst < 80))  : {_colourThirst =  _colour70;};
			case((_thirst >= 60) && (_thirst < 70))  : {_colourThirst =  _colour60;};
			case((_thirst >= 50) && (_thirst < 60))  : {_colourThirst =  _colour50;};
			case((_thirst >= 40) && (_thirst < 50))  : {_colourThirst =  _colour40;};
			case((_thirst >= 30) && (_thirst < 40))  : {_colourThirst =  _colour30;};
			case((_thirst >= 20) && (_thirst < 30))  : {_colourThirst =  _colour20;};
			case((_thirst >= 10) && (_thirst < 20))  : {_colourThirst =  _colour10;};
			case((_thirst >= 1) && (_thirst < 10))   : {_colourThirst =  _colour0;};
			case(_thirst < 1)                        : {_colourThirst =  _colourDead;};
		};
        

		_colourDamage = _colourDefault;
		switch true do {
			case(_damage >= 100)                     : {_colourDamage = _colour70;};
			case((_damage >= 90) && (_damage < 100)) : {_colourDamage =  _colour70;};
			case((_damage >= 80) && (_damage < 90))  : {_colourDamage =  _colour70;};
			case((_damage >= 70) && (_damage < 80))  : {_colourDamage =  _colour70;};
			case((_damage >= 60) && (_damage < 70))  : {_colourDamage =  _colour60;};
			case((_damage >= 50) && (_damage < 60))  : {_colourDamage =  _colour50;};
			case((_damage >= 40) && (_damage < 50))  : {_colourDamage =  _colour40;};
			case((_damage >= 30) && (_damage < 40))  : {_colourDamage =  _colour30;};
			case((_damage >= 20) && (_damage < 30))  : {_colourDamage =  _colour20;};
			case((_damage >= 10) && (_damage < 20))  : {_colourDamage =  _colour10;};
			case((_damage >= 1) && (_damage < 10))   : {_colourDamage =  _colour0;};
			case(_damage < 1)                        : {_colourDamage =  _colourDead;};
		};
        

		_colourStamina = _colourDefault;
		switch true do{
			case(_Stamina < 0.01)                        : {_colourStamina = _colour70;};
			case((_Stamina >= 0.01) && (_Stamina < 0.5)) : {_colourStamina =  _colour70;};
			case((_Stamina >= 0.5) && (_Stamina < 0.8))  : {_colourStamina =  _colour30;};
			case(_Stamina >= 0.8)                        : {_colourStamina =  _colour0;};
		};
        

        _colourFps = _colourDefault;
        switch true do {
			case(_FpsHud >= 60)                     : {_colourFps = _colour70;};
			case((_FpsHud >= 30) && (_FpsHud < 60)) : {_colourFps =  _colour30;};
			case((_FpsHud >= 1) && (_FpsHud < 30))  : {_colourFps =  _colour0;};
			case(_FpsHud < 1)                       : {_colourFps =  _colourDead;};
		};

    ((uiNamespace getVariable "osefStatusBar")displayCtrl 555556)ctrlSetStructuredText parseText format["<t size='1' shadow='1' shadowColor='#000000'><img size='1.6' shadowColor='#000000' image='custom\icons\Statusbar\players.paa' color='#FFFFFF'/>%1 <img size='1.6' shadowColor='#000000' image='custom\icons\Statusbar\players.paa' color='#3399FF'/>%2 <img size='1.6' shadowColor='#000000' image='custom\icons\Statusbar\players.paa' color='#009933'/>%3 <img size='1.6' shadowColor='#000000' image='custom\icons\Statusbar\players.paa' color='#CC0000'/>%4 <img size='1.6' shadowColor='#000000' image='custom\icons\Statusbar\ico_map.paa'/>%5 <img size='1.6' shadowColor='#000000' image='custom\icons\Statusbar\hunger.paa' color='%7'/>%6 <img size='1.6' shadowColor='#000000' image='custom\icons\Statusbar\thirst.paa' color='%9'/>%8 <img size='1.6' shadowColor='#000000' image='custom\icons\Statusbar\damage.paa' color='%11'/>%10 <img size='1.6' shadowColor='#000000' image='custom\icons\Statusbar\monitor_fps.paa' color='%15'/>%14 <img size='1.6' shadowColor='#000000' image='custom\icons\Statusbar\restart.paa' color='%16'/>Restart in %17h %18 Minuten <img size='1.6' shadowColor='#000000' image='custom\icons\Statusbar\stamina.paa' color='%13'/>%12</t>",
					_CivplayHUD,
					_WestplayHUD,
					_IndepplayHUD,
					_EastplayHUD,
					format["%1%2",_xx,_yy],
					_hunger_display,
					_colourHunger,
					_thirst_display,
					_colourThirst,
					_damage,
					_colourDamage,
					_stamina,
					_colourStamina,
					_FpsHud,
					_colourFps,
					_colourUpTimeHUD,
					_hours,
					_minutes
			];
    }; 
};













