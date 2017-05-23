scriptName "fn_spawn";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_spawn.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_spawn.sqf"

_arena = (getArray(missionConfigFile >> "CfgGungame" >> "Arenas" >> "data")) select gg_mapindex;
_spawnpoints = _arena select 3;
_myspawnpoint = _spawnpoints call BIS_fnc_selectRandom;

// Set player pos
player setPosATL _myspawnpoint;

// Make player invincble
player allowDamage false;

// Give loadout
[] spawn gg_fnc_loadLevelLoadout;

[] spawn {
	sleep 2;
	player allowDamage true;
};