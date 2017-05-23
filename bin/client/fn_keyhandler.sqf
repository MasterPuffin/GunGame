/*
The main keyhandler for the mission

by Master Puffin
*/

waitUntil {
    !isNull(findDisplay 46)
};
(findDisplay 46) displaySetEventHandler["KeyDown", "_this call keyspressed"];

keyspressed = {
    _keyDik = _this select 1;
    _shift = _this select 2;
    _ctrl = _this select 3;
    _alt = _this select 4;
    _handled = false;
    switch (_this select 1) do {
        case 57: // SPACE KEY
            {
                if (_shift) then {
                    if (vehicle player == player) then {
                        execVM "bin\client\fn_jump.sqf";
                    };
                };
            };
        case 35:{ //H key
          if (_shift) then {
            if (currentWeapon player == "" or {primaryWeapon player == "" && handgunWeapon player == ""}) then {
              player action ["SWITCHWEAPON",player,player,1];
            }
            else {
              player action ["SWITCHWEAPON",player,player,-1];
            };
              };
          };
        };
    };
    _handled;
};
