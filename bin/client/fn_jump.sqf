/*
Lets the player jump while sprinting

by Master Puffin
*/

if (isNil "jump") then {
    jump = false
};
if (isNull player) exitwith {};
_key_delay = 0.3; // MAX TIME BETWEEN KEY PRESSES
_max_height = 4.0; // SET MAX JUMP HEIGHT

_weight = (load player);
if (_weight < 0.25) then {
    _weight = 0.25
};
_height = 8 - (_weight * 10);

_vel = velocity player;
_dir = direction player;
_speed = 0.4;

if (jump isEqualTo true) exitWith {};
if ((player == vehicle player) && (isTouchingGround player) && (speed player > 8)) then {
    jump = true;
    if (_height > _max_height) then {
        _height = _max_height
    };
    player setVelocity[(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2) + _height];
    [
        [player, "AovrPercMrunSrasWrflDf"], "fn_Animation", nil, false
    ] spawn BIS_fnc_MP;
    sleep 2;
    jump = false;
};
