enableSentences false;
//*******************************************************************

//[] call compile preprocessFileLineNumbers "Engima\Traffic\Init.sqf";      //Civilian AI traffic
//[] execVM "eos\OpenMe.sqf";                                               //EOS Enemy Occupation Script

objHVTRescue execvm "scripts\Hostage_setup.sqf";
objHVT execvm "scripts\Hvt_setup.sqf";

//Uncomment if you're using the HALO
//[]spawn{while{!isnull c130b} do{"marker_C130B"setMarkerPos getPos c130B; sleep 0.5;};};

//Turns off Guilt and Rememberance mission
GR_MISSION_CHANCE = 0;
//*******************************************************************

["CBA_loadingScreenDone", {
    execVM "scripts\Intro.sqf";
}] call CBA_fnc_addEventHandler;