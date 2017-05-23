scriptName "fn_addKillfeed";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_addKillfeed.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_addKillfeed.sqf"

disableSerialization;

if (isNil "gg_killfeed") exitWith {};

_killer = _this select 0;
_weapon = _this select 1;
_killed = _this select 2;

if (count gg_killfeed >= 5) then {
	gg_killfeed deleteAt 0;
};
gg_killfeed pushBack [_killer, _weapon, _killed];

[] spawn gg_fnc_renderKillfeed;
sleep 7;
gg_killfeed deleteAt 0;
[] spawn gg_fnc_renderKillfeed;