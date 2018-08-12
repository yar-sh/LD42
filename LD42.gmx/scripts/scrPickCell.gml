
ds_list_clear(platformList);
ds_list_clear(platformValuesList);

ds_list_clear(optionsList);
ds_list_clear(optionsValuesList);

platformList = scrGetCrossCells(maxJumpStrength);
platformValuesList = ds_list_create();
var lSize = ds_list_size(platformList);

// get values for platforms and do strats
for(var i = 0; i < lSize; i++)
{
    var cell = platformList[| i];
    platformValuesList[| i] = 1.5*scrGetPlatformValue(maxJumpStrength, cell.i, cell.j, botStrat);
    
    if (innerCell.validForLanding && platformList[| i].i == innerCell.i && platformList[|i].j == innerCell.j)
    {
        if (botStrat == 0)
        {
            platformValuesList[| i] += 20;
        }
        else
        {
            platformValuesList[| i] -= 20;
        }
    }
    else if (!innerCell.validForLanding && platformList[| i].i == innerCell.i && platformList[|i].j == innerCell.j)
    {
       platformValuesList[| i] -= 50; 
    }
    
    //prioritize based on where looking
    var eeee = 1;
    switch(faceDir)
    {
        case 0:
            if (cell.x> innerCell.x) platformValuesList[| i]+=eeee;
            if (cell.x< innerCell.x) platformValuesList[| i]-=eeee*4;
            break;
        case 1:
            if (cell.y< innerCell.y) platformValuesList[| i]+=eeee;
            if (cell.y> innerCell.y) platformValuesList[| i]-=eeee*4;
            break;
        case 2: 
            if (cell.x< innerCell.x) platformValuesList[| i]+=eeee;
            if (cell.x> innerCell.x) platformValuesList[| i]-=eeee*4;
            break;
        case 3:
            if (cell.y> innerCell.y) platformValuesList[| i]+=eeee;
            if (cell.y< innerCell.y) platformValuesList[| i]-=eeee*4;
            break;
    }
    
    //value based on distance from target landing
    if (botStrat == 0)
    {
        platformValuesList[| i] +=  6 - 2*point_distance(platformList[| i].i, platformList[| i].j, hookCell.i,hookCell.j);
    }
    else
    {
        platformValuesList[| i] +=  10 - 2*point_distance(platformList[| i].i, platformList[| i].j, hookCell.i,hookCell.j);
    }
    
}

//get highest value
var val = -9999999;
for(var i = 0; i < lSize; i++)
{
    if (platformValuesList[| i] > val)
        val = platformValuesList[| i];
}


//actually make several options
for(var i = 0, k = 0; i < lSize; i++)
{
    if (botStrat == 0)
    {
        if (platformValuesList[| i] > val -4) {
            optionsList[| k] = platformList[| i];
            optionsValuesList[| k] = platformValuesList[| i];
            k++;
        }
    }
    else if (botStrat == 1)
    {
        if (platformValuesList[| i] > val -8) {
            optionsList[| k] = platformList[| i];
            optionsValuesList[| k] = platformValuesList[| i];
            k++;
        }
    }
}
if (ds_list_size(optionsList) > 1)
{
ugh = irandom(ds_list_size(optionsList)-1);
pickedCell = optionsList[| ugh];
}
else
    pickedCell = 0;

inAction = true;
