//	Usage - place game logics at locations and name name loc_1, loc_2 etc etc 
//	Name the HVT then in their init put 
//	[hvtName] execVM scripts\randomHVTLocation.sqf";

params["_hvt"];
//***************************************************************************************************
//add or game logic names from the array below to change the number of possible starting locations
_locations = [loc_1, loc_2, loc_3];
//***************************************************************************************************


_locationArray = selectRandom _locations;
_hvt setposASL [getPosASL _locationArray select 0, getPosASL _locationArray select 1, getPosASL _locationArray select 2];
