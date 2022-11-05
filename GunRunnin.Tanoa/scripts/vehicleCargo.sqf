//This script controls the transfer of weapon components from various Containers
//Written by Andrew Spicher
//Variables
_arg = (_this select 3);
_distCarToHouse = car_0 distance housePos;

//Switch to handle the 2 setObjectArguments
switch (_arg) do
{
  //This case will move all items in the compBox to the carStorage
  case 0:
  {
    //If the car is too far from the house
    if(20 < _distCarToHouse) then
    {
      ["taskFailed",["","Cannot transfer cargo, vehicle is too far away"]] call BIS_fnc_showNotification;
    } else
    {
      //Check to see if the house storage container is empty
      _numWeapons = weaponCargo compBox;
      if(_numWeapons isEqualTo []) then
      {
        ["taskFailed",["","Storage box is empty"]] call BIS_fnc_showNotification;
      } else
      {
        //Check to see if the vehicle's cargo container is full
        if(crate_0 canAdd "Weapon_hgun_Pistol_01_F") then
        {
          {
              crate_0 addWeaponCargo[_x, 1];
          } forEach weaponCargo compBox;
          clearWeaponCargo compBox;
          ["taskSucceeded",["","Weapons loaded"]] call BIS_fnc_showNotification;
        } else
          {
            ["taskFailed",["","Cannot transfer cargo, vehicle cargo is full"]] call BIS_fnc_showNotification;
          }
        };
      };//End if
  };//End case 0

  //This is the case responsible for moving components from the car to the house
  case 1:
  {
    //Check to see if car storage is empty (no components)
    if (carHGBody == 0 && carHGBarrel == 0 && carARCBody == 0 && carARCBarrel == 0 && carADDBody == 0 && carADDBarrel == 0) then
    {
        ["taskFailed",["","No components to transfer"]] call BIS_fnc_showNotification;
    } else
    {
      //If the vehicle is too far from the house
      if (20 < _distCarToHouse) then
      {
        ["taskFailed",["","Cannot transfer components, vehicle is too far away"]] call BIS_fnc_showNotification;
      } else
      {
        //If nothing is wrong, transfer the components
        storedHGBody = storedHGBody + carHGBody;
        storedHGBarrel = storedHGBarrel + carHGBarrel;
        storedARCBody = storedARCBody + carARCBody;
        storedARCBarrel = storedARCBarrel + carARCBarrel;
        storedADDBody = storedADDBody + carADDBody;
        storedADDBarrel = storedADDBarrel + carADDBarrel;

        //Remove the components from the car container
        carHGBody = carHGBody - carHGBody;
        carHGBarrel = carHGBarrel - carHGBarrel;
        carARCBody = carARCBody - carARCBody;
        carARCBarrel = carARCBarrel - carARCBarrel;
        carADDBody = carADDBody - carADDBody;
        carADDBarrel = carADDBarrel - carADDBarrel;
        ["taskSucceeded",["","Components transfered"]] call BIS_fnc_showNotification;
      }
    };//End if
  };//End case 1

  // This case checks the inventory of the car component storage
  case 2:
  {
    hint format[" Car Components Inventory:\nHandgun bodies: %1\nHandgun barrels: %2\nOld rifle bodies: %3\nOld rifle barrels: %4\nAdvanced rifle bodies: %5\nAdvanced rifle barrels: %6", carHGBody, carHGBarrel, carARCBody, carARCBarrel, carADDBody, carADDBarrel];
  };//End case 2

};//End switch
