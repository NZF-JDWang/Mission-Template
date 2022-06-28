// Requires ROSsandstorm.sqf by RickOShay

_dur = _this select 0;
_endtime = _this select 1;
_test = _this select 2;

5 fadeSpeech 1;

if (_test) then {hint "Start Wind loop";};

    While {time < _endtime} do {
        playsound ["sswindloop", true];
		//My test stuff
		_currentGlasses = goggles player;
	
		_retval = if (_currentGlasses == "") then 
		[{[player, 0.25] call ace_medical_fnc_adjustPainLevel;hint"Oww my eyes, where's my goggles?";}, {player call ace_goggles_fnc_applyDustEffect} ];
	//end 
        sleep 60;
    };

5 fadeSpeech 0.3;
playsound ["sswindloop", true];
30 fadeSpeech 0;

sleep 60;

10 fadeSpeech 1;
