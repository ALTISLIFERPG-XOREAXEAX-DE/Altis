class CarShops {
    /*
    *    ARRAY FORMAT:
    *        0: STRING (Classname)
    *        1: ARRAY (This is for limiting items to certain things)
    *            0: Variable to read from
    *            1: Variable Value Type (SCALAR / BOOL /EQUAL)
    *            2: What to compare to (-1 = Check Disabled)
    *
    *   BLUFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_WEST
    *   OPFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST
    *   Independent Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER
    *   Civilian Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_CIV
    */
    class civ_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } },
            { "C_Hatchback_01_F", { "", "", -1 } },
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_SUV_01_F", { "", "", -1 } },
            { "C_Hatchback_01_sport_F", { "", "", -1 } },
            { "C_Van_01_transport_F", { "", "", -1 } },
			{ "SUV_01_base_black_F", { "life_adminlevel", "SCALAR", 1 } }
        };
    };

    class kart_shop {
        side = "civ";
        vehicles[] = {
            { "C_Kart_01_Blu_F", { "", "", -1 } },
            { "C_Kart_01_Fuel_F", { "", "", -1 } },
            { "C_Kart_01_Red_F", { "", "", -1 } },
            { "C_Kart_01_Vrana_F", { "", "", -1 } }
        };
    };

    class civ_truck {
        side = "civ";
        vehicles[] = {
            { "C_Van_01_box_F", { "", "", -1 } },
            { "I_Truck_02_transport_F", { "", "", -1 } },
            { "I_Truck_02_covered_F", { "", "", -1 } },
            { "B_Truck_01_transport_F", { "", "", -1 } },
            { "O_Truck_03_transport_F", { "", "", -1 } },
            { "O_Truck_03_covered_F", { "", "", -1 } },
            { "B_Truck_01_box_F", { "", "", -1 } },
            { "O_Truck_03_device_F", { "", "", -1 } },
            { "C_Van_01_fuel_F", { "", "", -1 } },
            { "I_Truck_02_fuel_F", { "", "", -1 } },
            { "B_Truck_01_fuel_F", { "", "", -1 } }
        };
    };

    class civ_air {
        side = "civ";
        vehicles[] = {
            { "C_Heli_Light_01_civil_F", { "", "", -1 } },
            { "B_Heli_Light_01_F", { "", "", -1 } },
            { "O_Heli_Light_02_unarmed_F", { "", "", -1 } },
			{ "I_Heli_Transport_02_F", { "", "", -1 } },
			{ "B_Heli_Transport_03_unarmed_F", { "", "", -1 } },
			{ "O_Heli_Transport_04_box_F", { "", "", -1 } }
        };
    };

     class civ_ship {
        side = "civ";
        vehicles[] = {
            { "C_Rubberboat", { "", "", -1 } },
            { "C_Boat_Civil_01_F", { "", "", -1 } },
            { "B_SDV_01_F", { "", "", -1 } }
        };
    };

    class reb_car {
        side = "civ";
        vehicles[] = {
            { "B_Quadbike_01_F", { "", "", -1 } },
            { "B_G_Offroad_01_F", { "", "", -1 } },
            { "O_MRAP_02_F", { "", "", -1 } },
            { "B_Heli_Light_01_stripped_F", { "", "", -1 } },
            { "B_G_Offroad_01_armed_F", { "", "", -1 } },
			{ "O_MRAP_02_hmg_F", { "", "", -1 } },
			{ "I_Heli_light_03_unarmed_F", { "", "", -1 } }
        };
    };

    class med_shop {
        side = "med";
        vehicles[] = {
            { "C_Offroad_01_F", { "", "", -1 } },
			{ "C_SUV_01_F", { "life_mediclevel", "SCALAR", 2 } },
			{ "C_Hatchback_01_sport_F", { "life_mediclevel", "SCALAR", 3 } },
			{ "B_MRAP_01_F", { "life_mediclevel", "SCALAR", 4 } },
			{ "B_Truck_01_mover_F", { "life_mediclevel", "SCALAR", 4 } }, // Abschleppfahrzeug Igiload
			{ "B_Truck_01_ammo_F", { "life_mediclevel", "SCALAR", 4 } },
			{ "O_Truck_03_ammo_F", { "life_mediclevel", "SCALAR", 4 } },
			{ "O_Truck_03_repair_F", { "life_mediclevel", "SCALAR", 4 } }
		};
    };

    class med_air_hs {
        side = "med";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "life_mediclevel", "SCALAR", 3 } },
            { "O_Heli_Light_02_unarmed_F", { "life_mediclevel", "SCALAR", 4 } },
			{ "I_Heli_Transport_02_F", { "life_mediclevel", "SCALAR", 4 } },
			{ "B_Heli_Transport_03_unarmed_F", { "life_mediclevel", "SCALAR", 4 } },
			{ "I_Heli_light_03_unarmed_F", { "life_mediclevel", "SCALAR", 4 } },
			{ "O_Heli_Transport_04_F", { "life_mediclevel", "SCALAR", 4 } }
			
        };
    };

    class cop_car {
        side = "cop";
        vehicles[] = {
            { "C_Offroad_01_F", { "", "", -1 } },
            { "C_SUV_01_F", { "life_coplevel", "SCALAR", 2 } },
            { "C_Hatchback_01_sport_F", { "life_coplevel", "SCALAR", 3 } },
            { "B_MRAP_01_F", { "life_coplevel", "SCALAR", 5 } },
            { "B_MRAP_01_hmg_F", { "life_coplevel", "SCALAR", 6 } }
        };
    };

    class cop_air {
        side = "cop";
        vehicles[] = {
            { "B_Heli_Light_01_F", { "life_coplevel", "SCALAR", 2 } },
            { "B_Heli_Transport_01_F", { "life_coplevel", "SCALAR", 4 } },
			{ "I_Heli_Transport_02_F", { "life_mediclevel", "SCALAR", 5 } },
			{ "B_Heli_Transport_03_unarmed_F", { "life_mediclevel", "SCALAR", 5 } }
        };
    };

    class cop_ship {
        side = "cop";
        vehicles[] = {
            { "B_Boat_Transport_01_F", { "", "", -1 } },
            { "C_Boat_Civil_01_police_F", { "", "", -1 } },
            { "B_Boat_Armed_01_minigun_F", { "life_coplevel", "SCALAR", 3 } },
            { "B_SDV_01_F", { "", "", -1 } }
        };
    };
};

class LifeCfgVehicles {
    /*
    *    Vehicle Configs (Contains textures and other stuff)
    *       1: ARRAY (Rental Price)
    *         Ex: { 200, 200 , 200 , 200 } //civilian, west, independent, east
    *       2: ARRAY (license required)
    *         Ex: { "driver", "" , "" , "" } //civilian, west, independent, east
    *         licenses[] = { {"CIV"}, {"COP"}, {"MEDIC"}, {"EAST"} };
    *    Textures config follows { Texture Name, side, {texture(s)path}}
    *    Texture(s)path follows this format:
    *    INDEX 0: Texture Layer 0
    *    INDEX 1: Texture Layer 1
    *    INDEX 2: Texture Layer 2
    *    etc etc etc
    *
    */

    class Default {
        vItemSpace = -1;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, -1, -1 };
        textures[] = {};
    };

    class I_Truck_02_medical_F {
        vItemSpace = 150;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, 25000, -1 };
        textures[] = {};
    };

    class O_Truck_03_medical_F {
        vItemSpace = 200;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, 45000, -1 };
        textures[] = {};
    };

    class B_Truck_01_medical_F {
        vItemSpace = 250;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, 60000, -1 };
        textures[] = {};
    };

    class B_Truck_01_mover_F {
        vItemSpace = 250;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, 60000, -1 };		
        textures[] = {
			{ "Standard", "med", {
				"\a3\soft_f_beta\truck_01\data\truck_01_ext_01_co.paa",
				"\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa",
				"\A3\Soft_F_Gamma\Truck_01\Data\truck_01_mprimer_CO.paa"
            } },
			{ "ADAC", "med", {
				"textures\vehicles\adac\hemtt\adac.jpg",
				"\a3\soft_f_beta\truck_01\data\truck_01_ext_02_co.paa",
				"\A3\Soft_F_Gamma\Truck_01\Data\truck_01_mprimer_CO.paa"
            } },
		};
    };

    class B_Truck_01_ammo_F {
        vItemSpace = 500;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, 60000, -1 };		
        textures[] = {};
    };

    class O_Truck_03_repair_F {
        vItemSpace = 400;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, 60000, -1 };		
        textures[] = {};
    };

    class O_Truck_03_ammo_F {
        vItemSpace = 400;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, 60000, -1 };		
        textures[] = {};
    };
	

    class C_Rubberboat {
        vItemSpace = 45;
        licenses[] = { {"boat"}, {""}, {""}, {""} };
        rentalprice[] = { 5000, -1, -1, -1 };
        textures[] = { };
    };

    class B_Heli_Transport_01_F {
        vItemSpace = 200;
        licenses[] = { {""}, {"cAir"}, {""}, {""} };
        rentalprice[] = { -1, 200000, -1, -1 };
        textures[] = {
			{ "SEK", "cop", {
                "textures\air\cop\ghosthawk\sek_front.paa",
                "textures\air\cop\ghosthawk\sek_hinten.paa"
			} }
		};
    };

    class B_MRAP_01_hmg_F {
        vItemSpace = 100;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, 750000, -1, -1 };
        textures[] = {
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

    class B_Boat_Armed_01_minigun_F {
        vItemSpace = 175;
        licenses[] = { {""}, {"cg"}, {""}, {""} };
        rentalprice[] = { -1, 75000, -1, -1 };
        textures[] = { };
    };

    class B_Boat_Transport_01_F {
        vItemSpace = 45;
        licenses[] = { {""}, {"cg"}, {""}, {""} };
        rentalprice[] = { -1, 3000, -1, -1 };
        textures[] = { };
    };

    class O_Truck_03_transport_F {
        vItemSpace = 300;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        rentalprice[] = { 200000, -1, -1, -1 };
        textures[] = { };
    };

    class O_Truck_03_device_F {
        vItemSpace = 350;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        rentalprice[] = { 450000, -1, -1, -1 };
        textures[] = { };
    };

    class Land_CargoBox_V1_F {
        vItemSpace = 5000;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, -1, -1 };
        textures[] = {};
    };

    class Box_IND_Grenades_F {
        vItemSpace = 350;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, -1, -1 };
        textures[] = {};
    };

    class B_supplyCrate_F {
        vItemSpace = 700;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { -1, -1, -1, -1 };
        textures[] = {};
    };

    class B_G_Offroad_01_F {
        vItemSpace = 65;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { 12500, -1, -1, -1 };
        textures[] = { };
    };

    class B_G_Offroad_01_armed_F {
        vItemSpace = 65;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };
        rentalprice[] = { 750000, -1, -1, -1 };
        textures[] = { };
    };

    class O_MRAP_02_hmg_F {
        vItemSpace = 130;
        licenses[] = { {"rebel"}, {""}, {""}, {""} };
        rentalprice[] = { 1750000, -1, -1, -1 };
        textures[] = { };
    };
	
    class C_Boat_Civil_01_F {
        vItemSpace = 85;
        licenses[] = { {"boat"}, {""}, {""}, {""} };
        rentalprice[] = { 22000, -1, -1, -1 };
        textures[] = { };
    };

    class C_Boat_Civil_01_police_F {
        vItemSpace = 85;
        licenses[] = { {""}, {"cg"}, {""}, {""} };
        rentalprice[] = { -1, 20000, -1, -1 };
        textures[] = { };
    };

    class B_Truck_01_box_F {
        vItemSpace = 450;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        rentalprice[] = { 350000, -1, -1, -1 };
        textures[] = { };
    };

    class B_Truck_01_transport_F {
        vItemSpace = 325;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        rentalprice[] = { 275000, -1, -1, -1 };
        textures[] = { };
    };

    class O_MRAP_02_F {
        vItemSpace = 60;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        rentalprice[] = { 150000, -1, -1, -1 };
        textures[] = { };
    };

    class C_Offroad_01_F {
        vItemSpace = 65;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        rentalprice[] = { 12500, 5000, 10000, -1 };
        textures[] = {
            { "Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            } },
            { "Yellow", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            } },
            { "White", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            } },
            { "Blue", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            } },
            { "Dark Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            } },
            { "Blue / White", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            } },
            { "Taxi", "civ", {
                "#(argb,8,8,3)color(0.6,0.3,0.01,1)"
            } },
            { "Police", "cop", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Polizei", "cop", {
                "textures\vehicles\cop\offroad\polizei.paa"
            } }
        };
    };

    class C_Kart_01_Blu_F {
        vItemSpace = 20;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        rentalprice[] = { 15000, -1, -1, -1 };
        textures[] = {};
    };
/*
To edit another information in this classes you can use this exemple.
class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{
    vItemSpace = 40;
    rentalprice[] = { 25000, -1, -1, -1 };
};

will modify the virtual space and the price of the vehicle, but other information such as license and textures will pick up the vehicle declare at : Vehicle {};
*/
    class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{}; // Get all information of C_Kart_01_Blu_F
    class C_Kart_01_Red_F  : C_Kart_01_Blu_F{};
    class C_Kart_01_Vrana_F : C_Kart_01_Blu_F{};

    class C_Hatchback_01_sport_F {
        vItemSpace = 45;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        rentalprice[] = { 40000, 30000, 3000, 3000 };
        textures[] = {
            { "Red", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            } },
            { "Dark Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            } },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            } },
            { "Black / White", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            } },
            { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            } },
            { "Green", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            } },
            { "Police", "cop", {
                "#(ai,64,64,1)Fresnel(1.3,7)"
            } },
            { "Polizei", "cop", {
                "textures\vehicles\cop\hatchback\polizei.jpg"
            } },
            { "Rettung", "med", {
                "textures\vehicles\med\hatchback\rettung.jpg"
            } }
        };
    };

    class B_Quadbike_01_F {
        vItemSpace = 25;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        rentalprice[] = { 2500, -1, -1, -1 };
        textures[] = {
            { "Brown", "cop", {
                "\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa"
            } },
            { "Digi Desert", "reb", {
                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
            } },
            { "Black", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
            } },
            { "Blue", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
            } },
            { "Red", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
            } },
            { "White", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
            } },
            { "Digi Green", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
            } },
            { "Hunter Camo", "civ", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            } },
            { "Rebel Camo", "reb", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            } }
        };
    };

    class I_Truck_02_covered_F {
        vItemSpace = 250;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        rentalprice[] = { 100000, -1, -1, -1 };
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

    class I_Truck_02_transport_F {
        vItemSpace = 200;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        rentalprice[] = { 75000, -1, -1, -1 };
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            } },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } }
        };
    };

    class O_Truck_03_covered_F {
        vItemSpace = 400;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        rentalprice[] = { 400000, -1, -1, -1 };
        textures[] = {};
    };

    class C_Hatchback_01_F {
        vItemSpace = 40;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        rentalprice[] = { 9500, -1, -1, -1 };
        textures[] = {
            { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
            } },
            { "Green", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            } },
            { "Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
            } },
            { "Dark Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
            } },
            { "Yellow", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            } },
            { "White", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
            } },
            { "Grey", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
            } },
            { "Black", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            } }
        };
    };

	class SUV_01_base_black_F {
        vItemSpace = 100;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        rentalprice[] = { 30000, 30000, 30000, 30000 };
        textures[] = {
            { "Admin", "civ", {
                "textures\vehicles\civ\suv\admin.jpg"
			} }
        };		
	};
	
    class C_SUV_01_F {
        vItemSpace = 50;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        rentalprice[] = { 30000, 20000, 10000, 5000 };
        textures[] = {
            { "Dark Red", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            } },
            { "Silver", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            } },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            } },
            { "Schwarz", "cop", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa"
            } },
            { "Polizei", "cop", {
                "textures\vehicles\cop\suv\polizei.jpg"
            } },
            { "Zoll", "cop", {
                "textures\vehicles\cop\suv\zoll.jpg"
            } },
            { "Gelbrot", "med", {
                "textures\vehicles\med\suv\notarzt_gelb_rot.jpg"
            } },
            { "Weissrot", "med", {
                "textures\vehicles\med\suv\notarzt_weiss_rot.paa"
            } },
            { "Fire", "civ", {
                "textures\vehicles\civ\suv\fire.jpg"
            } },
            { "Flowergirl", "civ", {
                "textures\vehicles\civ\suv\flowergirl.jpg"
            } },
            { "Hellokitty", "civ", {
                "textures\vehicles\civ\suv\hellokitty.jpg"
            } },
            { "Minions", "civ", {
                "textures\vehicles\civ\suv\minions.jpg"
            } },
            { "Nyancat", "civ", {
                "textures\vehicles\civ\suv\nyan.jpg"
            } },
            { "Rebelcamo", "civ", {
                "textures\vehicles\civ\suv\rebel.jpg"
            } },
            { "Rio", "civ", {
                "textures\vehicles\civ\suv\rio.jpg"
            } },
            { "Rust", "civ", {
                "textures\vehicles\civ\suv\rust.jpg"
            } },
            { "Stickers", "civ", {
                "textures\vehicles\civ\suv\stickers.jpg"
            } },
            { "Kimono", "civ", {
                "textures\vehicles\civ\suv\kimono.jpg"
            } },
            { "Warframe", "civ", {
                "textures\vehicles\civ\suv\warframe.jpg"
            } },
            { "ADAC", "med", {
                "textures\vehicles\adac\suv\adac1.jpg"
            } },
            { "ADAC schwarzgelb", "med", {
                "textures\vehicles\adac\suv\adac2.paa"
            } },
            { "ADAC gelbschwarz", "med", {
                "textures\vehicles\adac\suv\adac3.paa"
            } },
            { "Skull", "civ", {
                "textures\vehicles\civ\suv\skull.jpg"
            } },
            { "Hello Kitty Red", "civ", {
                "textures\vehicles\civ\suv\hellokitty2.jpg"
            } }
        };
    };

    class C_Van_01_transport_F {
        vItemSpace = 100;
        licenses[] = { {"driver"}, {""}, {""}, {""} };
        rentalprice[] = { 45000, -1, -1, -1 };
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };

    class C_Van_01_box_F {
        vItemSpace = 150;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        rentalprice[] = { 60000, -1, -1, -1 };
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            } },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            } }
        };
    };

    class B_MRAP_01_F {
        vItemSpace = 65;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { 30000, 30000, 30000, 30000 };
        textures[] = {
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            } },
            { "Notarzt", "med", {
                "textures\vehicles\med\hunter\notarzt_front.paa",
                "textures\vehicles\med\hunter\notarzt_hinten.paa"
            } },
            { "SEK", "cop", {
                "textures\vehicles\cop\hunter\sek_front.paa",
                "textures\vehicles\cop\hunter\sek_hinten.paa"
            } }
        };
    };

     class B_Heli_Light_01_stripped_F {
        vItemSpace = 90;
        licenses[] = { {""}, {""}, {""}, {""} };
        rentalprice[] = { 325000, -1, -1, -1 };
        textures[] = {
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } },
            { "Rebel Hex", "reb", {
                "textures\air\reb\m900\hex.jpg"
            } }
        };
    };

    class B_Heli_Light_01_F {
        vItemSpace = 90;
        licenses[] = { {"pilot"}, {"cAir"}, {"mAir"}, {""} };
        rentalprice[] = { 275000, 75000, 50000, -1 };
        textures[] = {
            { "Police", "cop", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"
            } },
            { "Sheriff", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"
            } },
            { "Civ Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            } },
            { "Civ Red", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            } },
            { "Blueline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
            } },
            { "Elliptical", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
            } },
            { "Furious", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
            } },
            { "Jeans Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            } },
            { "Speedy Redline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            } },
            { "Sunset", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            } },
            { "Vrana", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            } },
            { "Waves Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            } },
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            } },
            { "Digi Green", "reb", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            } },
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            } },
            { "Notarzt", "med", {
                "textures\air\med\m900\notarzt.paa"
            } },
            { "SEK", "cop", {
                "textures\air\cop\m900\sek.jpg"
            } },
            { "Hello Kitty", "civ", {
                "textures\air\civ\m900\kitty.jpg"
            } },			
            { "Red Bull", "civ", {
                "textures\air\civ\m900\redbull.jpg"
            } },
            { "Rettung", "med", {
                "textures\air\med\m900\rettung.jpg"
            } },
            { "ADAC", "med", {
                "textures\air\adac\m900\adac.paa"
            } },
        };
    };

    class C_Heli_Light_01_civil_F : B_Heli_Light_01_F {
        vItemSpace = 75;
        rentalprice[] = { 245000, 55000, 40000, -1 };
    };

	//
	// Orca
	//
    class O_Heli_Light_02_unarmed_F {
        vItemSpace = 210;
        licenses[] = { {"pilot" }, {"cAir"}, {"mAir"}, {""} };
        rentalprice[] = { 750000, 75000, 75000, -1 };
        textures[] = {
            { "Black", "cop", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            } },
            { "White / Blue", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
            } },
            { "Digi Green", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            } },
            { "Desert Digi", "reb", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
            } },
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            } },
			{ "ADAC", "med", {
                "textures\air\adac\orca\adac.jpg"
            } },
			{ "Notarzt", "med", {
                "textures\air\med\orca\medic.jpg"
            } }
        };
    };
	
    class I_Heli_Transport_02_F	{
        vItemSpace = 300;
        licenses[] = { {"pilot" }, {"cAir"}, {"mAir"}, {""} };
        rentalprice[] = { 1000000, 100000, 100000, -1 };
        textures[] = {
            { "Black", "cop", {
                "#(argb,8,8,3)color(0,0,0,0.8)",
				"#(argb,8,8,3)color(0,0,0,0.8)",
				"#(argb,8,8,3)color(0,0,0,0.8)"
            } },
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)",
				"#(argb,8,8,3)color(1,1,1,0.8)",
				"#(argb,8,8,3)color(1,1,1,0.8)"
            } },
            { "Standard", "civ", {
				 "A3\Air_F_Beta\Heli_Transport_02\Data\Heli_Transport_02_1_INDP_CO.paa",
				 "A3\Air_F_Beta\Heli_Transport_02\Data\Heli_Transport_02_2_INDP_CO.paa",
				 "A3\Air_F_Beta\Heli_Transport_02\Data\Heli_Transport_02_3_INDP_CO.paa"
			} }
        };
    };

    class O_Heli_Transport_04_box_F	{
        vItemSpace = 1210;
        licenses[] = { {"pilot" }, {"cAir"}, {"mAir"}, {""} };
        rentalprice[] = { 300000, 3000000, 3000000, -1 };
        textures[] = {};
    };

    class O_Heli_Transport_04_F	{
        vItemSpace = 120;
        licenses[] = { {"pilot" }, {"cAir"}, {"mAir"}, {""} };
        rentalprice[] = { 3000000, 30000, 30000, -1 };
        textures[] = {};
    };

    class B_Heli_Transport_03_unarmed_F	{
        vItemSpace = 500;
        licenses[] = { {"pilot" }, {"cAir"}, {"mAir"}, {""} };
        rentalprice[] = { 1500000, 150000, 150000, -1 };
        textures[] = {
            { "Black", "cop", {
                "#(argb,8,8,3)color(0,0,0,0.8)",
				"#(argb,8,8,3)color(0,0,0,0.8)",
				"#(argb,8,8,3)color(0,0,0,0.8)"
            } },
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)",
				"#(argb,8,8,3)color(1,1,1,0.8)",
				"#(argb,8,8,3)color(1,1,1,0.8)"
            } }
        };
    };

    class I_Heli_light_03_unarmed_F	{
        vItemSpace = 150;
        licenses[] = { {"pilot" }, {"cAir"}, {"mAir"}, {""} };
        rentalprice[] = { 1000000, 100000, 100000, -1 };
        textures[] = {
            { "Standard", "civ", {
                "\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_CO.paa"
            } },
            { "ADAC", "med", {
                "textures\air\adac\hellcat\adac.jpg"
            } },
            { "Bundespolizei", "cop", {
                "textures\air\cop\hellcat\polizei.jpg"
            } },
            { "SEK", "cop", {
                "textures\air\cop\hellcat\sek.jpg"
            } }
		};
    };
	
    class B_SDV_01_F {
        vItemSpace = 50;
        licenses[] = { {"boat"}, {"cg"}, {""}, {""} };
        rentalprice[] = { 150000, 100000, -1, -1 };
        textures[] = {};
    };

        class C_Van_01_fuel_F {
        vItemSpace = 20;
        vFuelSpace = 19500;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        rentalprice[] = { 120000, -1, -1, -1 };
        textures[] = {
            { "White", "civ", {
                "\A3\soft_f_gamma\Van_01\data\van_01_ext_co.paa",
                "\A3\soft_f_gamma\Van_01\data\van_01_tank_co.paa"
            } },
            { "Red", "civ", {
                "\A3\soft_f_gamma\Van_01\data\van_01_ext_red_co.paa",
                "\A3\soft_f_gamma\Van_01\data\van_01_tank_red_co.paa"
            } }
        };
    };

    class I_Truck_02_fuel_F {
        vItemSpace = 40;
        vFuelSpace = 42000;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        rentalprice[] = { 200000, -1, -1, -1 };
        textures[] = {
            { "White", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_co.paa"
            } }
        };
    };

    class B_Truck_01_fuel_F {
        vItemSpace = 50;
        vFuelSpace = 50000;
        licenses[] = { {"trucking"}, {""}, {""}, {""} };
        rentalprice[] = { 250000, -1, -1, -1 };
        textures[] = {};
    };
};
