///phantom platform spawner
///argument0 - i
/// argument1 - j
var iVals;
var jVals;

iVals[0] = -2
jVals[0] =  -1

iVals[1] = -2
jVals[1] = 0

iVals[2] = -2
jVals[2] = 1

iVals[3] = -1
jVals[3] = -2

iVals[4] = -1
jVals[4] = -1

iVals[5] = -1
jVals[5] = 0

iVals[6] = -1
jVals[6] = 1

iVals[7] = -1
jVals[7] = 2

iVals[8] =0
jVals[8] = -2

iVals[9] =0
jVals[9] = -1

iVals[10] =0
jVals[10] = 0

iVals[11] =0
jVals[11] = 1

iVals[12] =0
jVals[12] = 2

iVals[13] =1
jVals[13] = -2

iVals[14] =1
jVals[14] = -1

iVals[15] =1
jVals[15] = 0

iVals[16] =1
jVals[16] = 1

iVals[17] =1
jVals[17] = 2

iVals[18] =2
jVals[18] = -1

iVals[19] =2
jVals[19] = 0

iVals[20] =2
jVals[20] = 1

for(var i = 0; i < 21; i++)
{
    var putI = max(0,jVals[i]+argument0);
    putI = min(objGameController.size-1,putI);
    
    var putJ = max(0,iVals[i]+argument1);
    putJ = min(objGameController.size-1,putJ);
    
    var cell = objGameController.gameGrid[# putI, putJ];
    
    if (cell.platform == 0)
    {
        cell.platform = instance_create(cell.x,cell.y,objPlatformPhantom);
    }
}
