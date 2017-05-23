scriptName "fn_loadLevelLoadout";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_loadLevelLoadout.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_loadLevelLoadout.sqf"

// Clear loadout
removeAllItems player;
removeBackpackGlobal player;

// Backpack
player addBackpack "B_AssaultPack_rgr";

// Get current weapon info to be spawned with
if (isNil {(gg_weaponList select gg_level) select 0}) exitWith {};
_weapon = (gg_weaponList select gg_level) select 0;
_magazineType = (gg_weaponList select gg_level) select 2;
_magazineCount = (gg_weaponList select gg_level) select 3;

if (_magazineType == "<auto>") then {
	_magazineType = (getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines") select 0);
};

// Add weapon
player addMagazines [_magazineType, _magazineCount];
player addWeapon _weapon;

// Check if double weapons
if ((count weapons player) > 1) then {
	removeAllWeapons player;
	removeAllItems player;
	player addMagazines [_magazineType, _magazineCount];
	player addWeapon _weapon;
};

player enableStamina false;
player setCustomAimCoef 0;