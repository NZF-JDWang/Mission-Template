/*
O - USP_PATCH_BLOOD_OPOS_BLK_ALT
A - USP_PATCH_BLOOD_APOS_BLK_ALT02
B - USP_PATCH_BLOOD_BPOS_BLK
AB - USP_PATCH_BLOOD_APOS_BLK_ALT02
*/ 
params ["_unit"];

sleep 1;
[_unit, ""] call BIS_fnc_setUnitInsignia;

while {true} do {
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
sleep 1;
};