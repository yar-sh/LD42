
/// argument0 - range
/// argument1 - platform x/i
/// argument2 - platform y/j
/// argument3 - bot strategy type
var value = 0;

var cell = objGameController.gameGrid[# argument1, argument2];
if (cell.platform == 0 || !cell.validForLanding) {
    value -= 2000;
}

//safe
if (argument3 == 0)
{
    value += ds_list_size(scrGetCrossCells(argument0)) * 3;
    
    if (cell.player != 0 || cell.enemy != 0)
    {
        value -= 8;
    }
    
    if (cell.powerup != 0)
    {
        value += 5;
    }
}
else if(argument3 == 1)
{
    value += ds_list_size(scrGetCrossCells(argument0)) * 2;
    
    if (cell.player != 0 || cell.enemy != 0)
    {
        value += 20;
        value += 10 - point_distance(argument1,argument2,cell.i,cell.j);
    }
    
    if (cell.powerup != 0)
    {
        value += 10;
        value += 5 - point_distance(argument1,argument2,cell.i,cell.j);
    }
}
/*
else
{
value += ds_list_size(scrGetCrossCells(argument0));
}
*/
return value;


