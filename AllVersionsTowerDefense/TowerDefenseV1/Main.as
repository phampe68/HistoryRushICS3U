package 
{

	//Import code:
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.events.Event;

	public class Main extends MovieClip
	{

		var level:Array = new Array();//2D array for tiles on the map

		public function Main()
		{
			init();
		}

		//function that sets the tiles for the map
		function init():void
		{
			level = [
			[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],//1 represents tiles where enemies walk
			[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],//0 represents tiles where towers are built
			[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],
			[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],
			[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
			[0,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0],
			[0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0],
			[0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0],
			[0,1,0,0,0,0,1,0,0,1,1,1,1,1,1,1,0],
			[0,1,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0],
			[0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1]
			];
			BuildMap();
		}

		//function that uses the preset tiles in the array to actually create the map
		function BuildMap():void
		{
			for (var i:int =0; i < level.length; ++i)
			{//nested for loop to go through entire index of level array
				for (var j:int =0; j < level[i].length; ++j)
				{
					var tmpTile:Tile1 = new Tile1();
					tmpTile.x = j * 50;//set the x and y coordinates of the tiles
					tmpTile.y = i * 50;
					addChild(tmpTile);//add the tile to the stage
					tmpTile.gotoAndStop(level[i][j]+1);//set the frame of the tile according to the value in the 2D array
					// + 1 is because the frames values start as 1 whereas array values start at 0
				}
			}
		}
	}
}