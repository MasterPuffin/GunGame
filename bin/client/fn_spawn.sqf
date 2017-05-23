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

// Check if there is a player near the spawnpoint and if yes change it
_num = 9;

while {_num > 1} do {
_myspawnpoint = _spawnpoints call BIS_fnc_selectRandom;
_list = _myspawnpoint nearEntities ["Man", 10];
_num = count _list;
sleep 1;
};

// Set player pos
player setPosATL _myspawnpoint;

// Make player invincble
player allowDamage false;

// Give loadout
[] spawn gg_fnc_loadLevelLoadout;

[] spawn {
	_weapon = currentWeapon player;
	_ammo = player ammo _weapon;
	player setAmmo [_weapon, 0];
	player forceWeaponFire [_weapon, "FullAuto"];
	player setAmmo [_weapon, _ammo];
	sleep 2;
	player allowDamage true;
};
