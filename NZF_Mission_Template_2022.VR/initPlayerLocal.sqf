//Set up the U menu for groups
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups; 

//Add Fuel Consuption script to increase fuel usage
player addEventHandler ["GetInMan", {[ _this select 2] execVM "scripts\kp_fuel_consumption.sqf";}]; 

//Add Blood patches 
player execVM "scripts\bloodPatch.sqf";

//Enable player markers on map 
[] execVM "scripts\QS_icons.sqf";

//Removes facewear and adds Beret to player - If they're in the unit they get a NZF beret if not then a plain black
private "_beret";
removeGoggles player;
removeHeadgear player;
if (squadParams player select 0 select 0 == "NZF") then {_beret = "nzf_beret_black_silver"} else {_beret = "SP_Beret2_Black"};
player addHeadgear _beret;

//*************************************************************************************
//Respawn with gear you died with - doing it this way stops the issue when using onPlayerRespawn
//which something respawns you with no weapon.
params ["_unit"];

_unit addEventHandler ["Killed", {
    params ["_unit"];
    Mission_loadout = getUnitLoadout _unit;
}];

_unit addEventHandler ["Respawn", {
    params ["_unit"];

    if (!isNil "Mission_loadout") then {
        _unit setUnitLoadout Mission_loadout;
	
		[_unit, ""] remoteExec ["bis_fnc_setUnitInsignia", 0];
		_type = _unit getvariable "kat_circulation_bloodtype";

			switch (_type) do 
			{
				case "O+" : {[player, "USP_PATCH_BLOOD_OPOS_BLK_ALT"] call BIS_fnc_setUnitInsignia;};
				case "O-" : {[player, "USP_PATCH_BLOOD_ONEG_BLK"] call BIS_fnc_setUnitInsignia;};

				case "A+" : {[player, "USP_PATCH_BLOOD_APOS_BLK_ALT02"] call BIS_fnc_setUnitInsignia;};
				case "A-" : {[player, "USP_PATCH_BLOOD_ANEG_BLK"] call BIS_fnc_setUnitInsignia;};

				case "B+" : {[player, "USP_PATCH_BLOOD_BPOS_BLK"] call BIS_fnc_setUnitInsignia;};
				case "B-" : {[player, "USP_PATCH_BLOOD_BNEG_BLK"] call BIS_fnc_setUnitInsignia;};

				case "AB+" : {[player, "USP_PATCH_BLOOD_ABPOS_BLK_ALT"] call BIS_fnc_setUnitInsignia;};
				case "AB-" : {[player, "USP_PATCH_BLOOD_ABNEG_BLK"] call BIS_fnc_setUnitInsignia;};

			};
    };
}];

//*************************************************************************************
//Add arsenal - If you want more just name them arsenal_2 arsenal _3 etc and then below copy the command and change [arsenal_1] to [arsenal_2] etc etc 
[arsenal_1] execVM "scripts\arsenal.sqf";
