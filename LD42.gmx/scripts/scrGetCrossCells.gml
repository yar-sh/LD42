///return list of paltforms in a cross with range
///argument0 - range
var platformList = ds_list_create();
var lIndex = 0;

for (var  i = 1; i <= argument0; i++)
{
    var checkI = max(0, innerCell.i - i);
    checkI = min(objGameController.size-1, checkI);
    
    platformList[| lIndex] = objGameController.gameGrid[# checkI, innerCell.j];
    lIndex++;
}

for (var  i = 1; i <= argument0; i++)
{
    var checkI = max(0, innerCell.i + i);
    checkI = min(objGameController.size-1, checkI);
    
    
    platformList[| lIndex] = objGameController.gameGrid[# checkI, innerCell.j];
    lIndex++;
}

for (var j = 1; j <= argument0; j++)
{
    var checkJ = max(0, innerCell.j - j);
    checkJ = min(objGameController.size-1, checkJ);
    
    platformList[| lIndex] = objGameController.gameGrid[# innerCell.i, checkJ];
    lIndex++;
}

for (var j = 1; j <= argument0; j++)
{
    var checkJ = max(0, innerCell.j + j);
    checkJ = min(objGameController.size-1, checkJ);
    
    platformList[| lIndex] = objGameController.gameGrid[# innerCell.i, checkJ];
    lIndex++;
}

platformList[| lIndex] = objGameController.gameGrid[# innerCell.i, innerCell.j];

return platformList;
