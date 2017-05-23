scriptName "fn_win";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_win.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_win.sqf"

_winner = _this select 0;

if (!isNil "gg_winner") exitWith {};

// Set winner
gg_winner = _winner;

// Update game status
gg_gamestatus = 2;
publicVariable "gg_gamestatus";

// Stop all players and display ending screen
[] remoteExec ["gg_fnc_endRound"];