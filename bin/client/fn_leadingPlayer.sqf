scriptName "fn_leadingPlayer";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_leadingPlayer.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_leadingPlayer.sqf"

disableSerialization;

_leading = param[0,objNull,[objNull]];

gg_leadingplayer = _leading;

// Wat
if (isNull _leading) exitWith {};

// Display on layer 50
50 cutRsc ["gg_leadingplayer", "PLAIN"];

// Get display
_display = uiNamespace getVariable ["gg_leadingplayer", displayNull];

// Display text
(_display displayCtrl 0) ctrlSetStructuredText parseText format ["<t size='2' font='PuristaMedium' align='center' shadow='2'>%1 IS NOW LEADING</t>", name _leading];