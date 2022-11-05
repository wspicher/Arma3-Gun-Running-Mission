//This script is responsible for allowing players to create weapons at the
//weapon building table
//Written by Andrew Spicher

//Variables
_arg = (_this select 3);
_builder = nearestObject[getPos buildingTable, "Man"];

//Switch statement to determine what type of action to be done
//Handgun case
switch (_arg) do
{
  case 0:
  {
    //If the necessary components don't exist
    if(storedHGBody == 0 && storedHGBarrel == 0) then
    {
      ["taskFailed",["","You have no handgun components"]] call BIS_fnc_showNotification;
    } else
    {
      //If there are no handgun bodies
      if (storedHGBody == 0) then
      {
        ["taskFailed",["","You have no handgun bodies"]] call BIS_fnc_showNotification;
      } else
      {
        //If there are no handgun barrels
        if (storedHGBarrel == 0) then
        {
            ["taskFailed",["","You have no handgun barrels"]] call BIS_fnc_showNotification;
        };
      }
    };//End if

    //If the player does have the components
    if (0 < storedHGBody && 0 < storedHGBarrel) then
    {
      //If the player has one of each component
      _builder switchmove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
      sleep 0.833;
      ["taskSucceeded",["","Handgun created"]] call BIS_fnc_showNotification;
      _handgun = "Weapon_hgun_Pistol_01_F" createVehicle (getPos tablePos);
      _handGun setPos getPos tablePos;
      _handgun setDir 190;
      //Reduce the components inventory
      storedHGBody = storedHGBody - 1;
      storedHGBarrel = storedHGBarrel -1;
    };//End if
};//End case 0

//This is the old rile case
case 1:
{
  //If the necessary components don't exist
  if(storedARCBody == 0 && storedARCBarrel == 0) then
  {
    ["taskFailed",["","You have no old rifle components"]] call BIS_fnc_showNotification;
  } else
  {
    //If there are no old gun bodies
    if (storedARCBody == 0) then
    {
      ["taskFailed",["","You have no old rifle bodies"]] call BIS_fnc_showNotification;
    } else
    {
      //If there are no old gun barrels
      if (storedARCBarrel == 0) then
      {
          ["taskFailed",["","You have no old rifle barrels"]] call BIS_fnc_showNotification;
      };
    }
  };//End if

  //If the player does have the components
  if (0 < storedARCBody && 0 < storedARCBarrel) then
  {
    //If the player has one of each component
    _builder switchmove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    sleep 0.833;
    ["taskSucceeded",["","Old rifle created"]] call BIS_fnc_showNotification;
    _oldGun = "Weapon_arifle_AKM_F" createVehicle (getPos tablePos);
    _oldGun setPos getPos tablePos;
    _oldGun setDir 190;
    //Reduce the components inventory
    storedARCBody = storedARCBody - 1;
    storedARCBarrel = storedARCBarrel -1;
  };//End if
};//End case 1

//This is the advanced rile case
case 2:
{
  //If the necessary components don't exist
  if(storedADDBody == 0 && storedADDBarrel == 0) then
  {
    ["taskFailed",["","You have no advanced rifle components"]] call BIS_fnc_showNotification;
  } else
  {
    //If there are no new gun bodies
    if (storedADDBody == 0) then
    {
      ["taskFailed",["","You have no advanced rifle bodies"]] call BIS_fnc_showNotification;
    } else
    {
      //If there are no new gun barrels
      if (storedADDBarrel == 0) then
      {
          ["taskFailed",["","You have no advanced rifle barrels"]] call BIS_fnc_showNotification;
      };
    }
  };//End if

  //If the player does have the components
  if (0 < storedADDBody && 0 < storedADDBarrel) then
  {
    //If the player has one of each component
    _builder switchmove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
    sleep 0.833;
    ["taskSucceeded",["","Advanced rifle created"]] call BIS_fnc_showNotification;
    _newGun = "Weapon_arifle_MX_Black_F" createVehicle (getPos tablePos);
    _newGun setPos getPos tablePos;
    _newGun setDir 190;
    //Reduce the components inventory
    storedADDBody = storedADDBody - 1;
    storedADDBarrel = storedADDBarrel -1;
  };//End if
};//End case 2

//This is the check inventory case
//This will hint out the amount of each component stored in the crate below
//the weapon building table
case 3:
{
  hint format["Components Inventory:\nHandgun bodies: %1\nHandgun barrels: %2\nOld rifle bodies: %3\nOld rifle barrels: %4\nAdvanced rifle bodies: %5\nAdvanced rifle barrels: %6", storedHGBody, storedHGBarrel, storedARCBody, storedARCBarrel, storedADDBody, storedADDBarrel];
}//End case 3



};//End switch
