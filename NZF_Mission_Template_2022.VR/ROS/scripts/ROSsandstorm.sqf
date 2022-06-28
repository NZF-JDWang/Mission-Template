// ROS Sandstorm V3.0 by RickOShay 2017
// You may use this script as long as I am creditted and this header text is not removed.
// null = [duration in secs,sandstorm number] execvm "ROS\scripts\ROSsandstorm.sqf";
// null = [140,1] execvm "ROS\scripts\ROSsandstorm.sqf";
// Minimum 140 secs due to sound loop length.
// Sandstorm number is used if there are more than 1 sandstorm in mission for jip. I've allowed for 3 below.

// Debug change to false to disable debug hint
_test = false;

_dur = _this select 0;
_stormNum = _this select 1;
_endtime = time + _dur;
_looptime = 45;
inside = "";

if (isnil "storm1done") then {storm1done = false;};
if (isnil "storm2done") then {storm2done = false;};
if (isnil "storm3done") then {storm3done = false;};

// JIP - see end of script - allowance for 3 sandstorms in mission
if (_stormNum == 1 && storm1done) exitWith {};
if (_stormNum == 2 && storm2done) exitWith {};
if (_stormNum == 3 && storm3done) exitWith {};

// Reset time multiplier
_curtimemultiplier = timeMultiplier;
if (isServer) then {setTimeMultiplier 1};

// Remove ambient life
enableEnvironment [false, true];

// Save current wind
_initwind = wind;

if (_test) then {hint format ["Initial endtime %1", _endtime];};
if (_test) then {sleep 3};
if (_test) then {hint "SS start"};

// Warning length = 11 secs
playsound ["sswarning", true];

sleep 15;

// Start wind intro = 69 secs ///////////////////////////////////////////////////////////////////////////
if (_test) then {hint "Start Wind intro sound";};
playsound ["sswindintro",false];

// Increase wind
    for "_i" from 1 to 15 do {
        setWind [_i, _i/2, true];
        sleep 0.5;
    };
if (_test) then {hint "Wind speed increased 15/7.5";};

// Start leaves
    if (_test) then {hint "Start leaves";};
    _leaves_p  = "#particlesource" createVehicleLocal (getpos vehicle player);
    _leaves_p attachto [vehicle player];
    _leaves_p setParticleRandom [0, [10, 10, 7], [4, 4, 5], 2, 0.1, [0, 0, 0, 0.5], 1, 1];
    _leaves_p setParticleCircle [100, [0, 0, 0]];
    _leaves_p setParticleParams [
    ["\A3\data_f\ParticleEffects\Hit_Leaves\Sticks_Green", 1, 1, 1],
    "",
    "SpaceObject",
    1,
    27,
    [0,0,0],
    [50,50,10],
    2,
    0.000001,
    0.0,
    0.1,
    [0.5 + random 0.5],
    [[0.68,0.68,0.68,1]],
    [1.5,1],
    13,
    13,
    "",
    "",
    vehicle player,
    0,
    true
    ,1,
    [[0,0,0,0]]];
    _leaves_p setDropInterval 0.08;

// Start Wind loop
if (_test) then {hint "Start Wind loop"; sleep 0.5;};
[_dur, _endtime, _test] execvm "ROS\scripts\ROSwindloop.sqf";

// Start Film grain
    if (_test) then {hint "Start filmgrain";};
    _hndlFg = ppEffectCreate ["FilmGrain", 2050];
    _hndlFg ppEffectEnable true;
    _hndlFg ppEffectAdjust [0.08, 1.25, 2.05, 0.75, 1, false];
    _hndlFg ppEffectCommit 30;

// Adjust camshake and sound volume if player in building or vehicle
[_endtime] spawn {
    _endtime = _this select 0;
    sleep 4;
    While {time < _endtime} do {
            _building = nearestObject [player, "HouseBase"];
            _relPos = _building worldToModel (getPosATL player);
            _boundBox = boundingBoxReal _building;
            _min = _boundBox select 0;
            _max = _boundBox select 1;
            _playerX = _relPos select 0;
            _playerY = _relPos select 1;
            _playerZ = _relPos select 2;
            _minX = _min select 0;
            _minY = _min select 1;
            _minZ = _min select 2;
            _maxX = _max select 0;
            _maxY = _max select 1;
            _maxZ = _max select 2;
            _duration = 2 + random 2;
            if ((_playerX > _minX && _playerX < _maxX && _playerY > _minY && _playerY < _maxY && _playerZ > _minZ && _playerZ < _maxZ) or vehicle player != player)
              then {inside = true;}
              else {inside = false;
            };
    // Adjust camshake if player in vehicle or building and reduce sound volume accordingly
            if (inside) then {0.5 fadeSpeech 0.25; enableCamShake false;};
            if (!inside) then {0.5 fadeSpeech 1; enableCamShake true; addCamShake [(1 + random 1.5), _duration, (3 + random 1.5)]};
    //      hint format ["Inside %1", inside];
            sleep 1;
    };
    inside = "";
};

/* Testing
[endtime] spawn {
    endtime = _this select 0;
    while {time < endtime} do {
    hint format ["Time: %1 Endtime: %2",time, endtime];
    sleep 2;
    };
};
*/

// Start fog default global synch and make sure timemultiplier = 1 (see above) to avoid synch and timing issues
    if (_test) then {hint "Start fog"};
    70 setFog 0.25;

    sleep 10;
//kill radio range	
player setVariable ["TFAR_globalRadioRangeCoef", 0.01];

// Add Color correction
    if (_test) then {hint "Start color correction";};
    _hndl1 = ppEffectCreate ["colorCorrections", 1550];
    _hndl1 ppEffectEnable true;
    _hndl1 ppEffectAdjust [0.6, 1, 0, [0.8, 0.7, 0.4, 0.2], [0.8, 0.7, 0.4, 0.2], [0.8, 0.7, 0.4, 0.8]];
    _hndl1 ppEffectCommit 30;

    sleep 10;

// Add particle effect
    if (_test) then {hint "Start BIS SS _particles";};
    _particles = [vehicle player, 0.005, 1, true] call BIS_fnc_sandstorm;
    sleep 5;

// Modify Color correction and fog
    if (_test) then {hint "Start CC modify fog";};
    While {time < _endtime} do {
        _hndl1 ppEffectAdjust [0.6, 1, 0, [0.8, 0.7, 0.4, 0.2 + random 0.2], [0.6 + random 0.2, 0.7, 0.4, 0.2 + random 0.4], [0.6 + random 0.2, 0.7 , 0.4, 0.2 + random 0.8]];
        _hndl1 ppEffectCommit 2 + (floor random 2);
        if (isServer) then {3 setFog (random 0.7);};
        sleep 4.5;
    };

// FADE OUT EFFECTS ///////////////////////////////////////////////////////////////////////////////
    if (_test) then {hint "Fade out Sandstorm"; sleep 1;};

// Reset time multiplier to mission init settings
    if (_test) then {hint "Time multiplier reset"};
    if (isServer && _curtimemultiplier > 1) then {
        setTimeMultiplier _curtimemultiplier;
    };

// Fade color correction to normal
    if (_test) then {hint "Colour correction fade to normal"};
    _hndl1 ppEffectAdjust [1, 1, 0,[ 0, 0, 0, 0],[ 1, 1, 1, 1],[ 0, 0, 0, 0]];
    _hndl1 ppEffectCommit 25;

// Remove Fog
    if (_test) then {hint "Remove fog"};
    //force fog to 0
    setTimeMultiplier 2;
    if (isServer) then {40 setFog 0};

    sleep 10;

// Remove _particles
    if (_test) then {hint "Remove BIS ss _particles and fade wind"};
    {deleteVehicle _x; sleep 0.01;} forEach _particles;

    sleep 5;
// Reduce wind
    if (_test) then {hint "Reduce wind"};
    setWind [10, 5, true];
    sleep 5;
    setWind [7, 3.5, true];
    sleep 5;
    setWind [5, 2.5, true];
    sleep 5;
    setWind [3, 1.5, true];

// Remove Film grain
    if (_test) then {hint "Remove film grain"};
    _hndlFg ppEffectEnable false;
    ppEffectDestroy _hndlFg;

    sleep 10;

// Remove color correction
    if (_test) then {hint "Delete color correction"};
    _hndl1 ppEffectEnable false;
    ppEffectDestroy _hndl1;
	
//fix radio range
player setVariable ["TFAR_globalRadioRangeCoef", 1];

// Set wind to original wind setting
    setWind [_initwind select 0, _initwind select 1, true];

// Remove leaves
    if (_test) then {hint "Remove leaves"};
    deletevehicle _leaves_p;
    enableCamShake false;

// Switch on life
    if (_test) then {hint "Environment on"};
    enableEnvironment [true, true];

// SS END - FADE out length ///////////////////////////////////////////////////////////////////////

_endtime = "";

// JIP
if (_stormNum == 1) then {storm1done = true; publicVariable "storm1done"};
if (_stormNum == 2) then {storm2done = true; publicVariable "storm2done"};
if (_stormNum == 3) then {storm3done = true; publicVariable "storm3done"};

//sandstormdone = true;
//publicVariable "sandstormdone";

if (_test) then {hint "Sandstorm End"};
