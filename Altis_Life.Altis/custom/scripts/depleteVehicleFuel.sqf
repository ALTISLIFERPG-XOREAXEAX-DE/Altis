#include "..\..\script_macros.hpp"
/*
      Created by Mokomoko
      Date: 04.08.2014
      Related Forum Post: http://www.altisliferpg.com/topic/4812-tutorial-how-to-increase-the-fuel-usage/
*/

private["_vehicleToFuel","_velocityOfVehicle","_fuelConsumption","_speed"];

if (isNil "_fuelConsumption")then {
_fuelConsumption = 0;
};

while{true} do {
	_vehicleToFuel = vehicle player;
	_speed = speed _vehicleToFuel;
	
	if(isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player) && !(_vehicleToFuel isKindOf "Air") && (_vehicleToFuel != player) ) then {
		_velocityOfVehicle = sqrt(((velocity _vehicleToFuel select 0)^2)+((velocity _vehicleToFuel select 1)^2))*3.6;

		switch(true) do {
				case (_speed >= 0 and _speed < 5): 		{_fuelConsumption = _velocityOfVehicle/100000 + 0.0001};
				case (_speed >= 5 and _speed < 15): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0002};
				case (_speed >= 15 and _speed < 30): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0003};
				case (_speed >= 30 and _speed < 55): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0004};
				case (_speed >= 55 and _speed < 70): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0004};
				case (_speed >= 70 and _speed < 85): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0005};
				case (_speed >= 85 and _speed < 100): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0005};
				case (_speed >= 100 and _speed < 115): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0006};
				case (_speed >= 115 and _speed < 130): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0006};
				case (_speed >= 130 and _speed < 145): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0007};
				case (_speed >= 145 and _speed < 160): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0007};
				case (_speed >= 160 and _speed < 270): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0006};
				case (_speed >= 270 and _speed < 500): 	{_fuelConsumption = _velocityOfVehicle/100000 + 0.0005};
		};
		
		_vehicleToFuel setFuel ((fuel _vehicleToFuel)-_fuelConsumption);

		if(fuel _vehicleToFuel < 0.2 && fuel _vehicleToFuel > 0.10) then {
			hint "Dein Tank ist fast leer, du musst jetzt eine Tankstelle aufsuchen!";
		} else {
			if(fuel _vehicleToFuel < 0.03) then {
				hint "Ich hoffe du bist gut zu Fuss - gleich ist der Tank leer!";
			};
		};
	};

	if (typeOf _vehicleToFuel == "B_MRAP_01_hmg_F") then {
		sleep 1;
	} else {
		sleep 3;
	};
	
};