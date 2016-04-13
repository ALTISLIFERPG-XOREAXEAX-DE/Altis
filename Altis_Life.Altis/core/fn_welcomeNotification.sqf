/*
	File: fn_welcomeNotification.sqf
	Author:

	Description:
	Called upon first spawn selection and welcomes our player.
*/
disableSerialization;
[
        "",
        0,
        0.2,
        10,
        0,
        0,
        8
] spawn BIS_fnc_dynamicText;

createDialog "RscDisplayWelcome";

_display = findDisplay 999999;
_text1 = _display displayCtrl 1100;
_buttonSpoiler = _display displayctrl 2400;
_textSpoiler = _display displayctrl 1101;
_text2 = _display displayCtrl 1102;

_message = "";
_message = _message + "Willkommen auf altisliferpg.xoreaxeax.de<br />";
_message = _message + "Wir suchen Spieler, engagierte Medics, faire, saubere Cops und arroganzlose Admins.<br />";
_message = _message + "Falls Du Interesse hast so melde Dich in unserem TS!<br />";
_message = _message + "<br />";
_message = _message + "OFFENE BUGS:<br />";
_message = _message + "Der Medic Request wenn man stirbt ist verbuggt, die Alarmierung der Medics funktioniert erst beim ZWEITEN Mal.<br />";
_message = _message + "Daher bitte nach dem Sterben entweder WARTEN mit dem Druecken oder nach 20 Sekunden erneut druecken!<br />";
_message = _message + "<br />";
_message = _message + "TS3 Addresse: 78.47.101.8:31337 <br />";

_text1 ctrlSetStructuredText (parseText _message);

_positionText1 = ctrlPosition _text1;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _text1;
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_text1 ctrlcommit 0;
//Hide second text, spoiler text and button
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_text2 ctrlSetFade 1;
_text2 ctrlCommit 0;
