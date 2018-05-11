package 
{


	//Import code:
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;


	public class Main extends MovieClip
	{
		//declare constants
		const enemyStartX:int = 78;
		const enemyStartY:int = 23;

		//declare variables
		var numberEnemies:int = 30;//number of enemies in level
		var moveSpeed:int = 5; //NOTE 5 IS THE MAX SPEED
		// how fast the enemies go
		var currentGold:int = 100;//how much gold you have

		//declare arrays
		var level:Array = new Array();//2D array for tiles on the map
		var enemies:Array = new Array();//1D array for enemies 
		var wayPointsX:Array = new Array();//points on the path where the enemies turn
		var wayPointsY:Array = new Array();//points on the path where the enemies turn
		
		
		
		
		public function Main()
		{
			//intiialize function is called in the level's keyframe
		}

		//INITIALIZE FUNCTION: starts the game
		function init():void
		{
			//NOTE: The size of the level background has been changed to 850 by 600 to make room for shop
			//1 represents tiles where enemies walk, 0 represents tiles where towers are built
			level = [
		   //0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17
			[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],//0
			[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],//1
			[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],//2
			[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0],//3
			[0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0],//4
			[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],//5
			[0,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0],//6
			[0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0],//7
			[0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0],//8
			[0,1,0,0,0,0,1,0,0,1,1,1,1,1,1,1,0],//9
			[0,1,1,1,1,1,1,0,0,1,0,0,0,0,0,0,0],//10
			[0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1] //11
			];

			//set waypoints
			wayPointsX = [1,15,15,1,1,6,6,15,15,9,9,16];
			wayPointsY = [2,2,4,4,10,10,6,6,9,9,11,11];

			//set all waypoints to actual coordinates on the stage
			for (var i: int = 0; i < wayPointsX.length; i ++)
			{
				wayPointsX[i] = wayPointsX[i] * 50 + 25;
				wayPointsY[i] = wayPointsY[i] * 50 + 25;
			}
			//Create the tile structure of the map
			BuildMap();

			//Spawn enemies for however many there are in the level
			
			
			for (var i:int = 0; i < numberEnemies; i++)
			{
				//send the coordiantes of starting position to the function
				//the y coordinate that is sent spawns each enemy slightly furthre back
				SpawnEnemy(enemyStartX, enemyStartY * i- 1000); 
				
			}
			
			
			
			//add the event listener for onEnterFrame
			stage.addEventListener(Event.ENTER_FRAME,onEnterFrameHandler);
			
			
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

					addChild(tmpTile);//add the tile to the stage  //REMOVE THIS LATER AS IT INTERFERES WITH THE ACTUAL BACKGROUND
					tmpTile.gotoAndStop(level[i][j]+1);
					//set the frame of the tile according to the value in the 2D array;
					// + 1 is because the frames values start as 1 whereas array values start at 0
				}
			}
		}

		//function that creates enemies
		function SpawnEnemy(xpos:int, ypos:int)
		{
			var tmpEnemy:Enemy = new Enemy();
			tmpEnemy.x = xpos;//set coordiantes of enemy spawn
			tmpEnemy.y = ypos;
			addChild(tmpEnemy);//add enemy to stage
			enemies.push(tmpEnemy); //add newly created enemy to array of enemies;
		}
		

		//function that moves ONE enemy
		function moveEnemy(tmpEnemy:Enemy,i:int):void
		{
			var dist_x:Number = wayPointsX[tmpEnemy.nextWayPoint] - tmpEnemy.x;//distance between the monster
			var dist_y:Number = wayPointsY[tmpEnemy.nextWayPoint] - tmpEnemy.y;//and the nextWayPoint
			//when monster collides with a waypoint, increase next way point
			if (Math.abs(dist_y) + Math.abs(dist_x) < 3)
			{
				tmpEnemy.nextWayPoint += 1;
			}
			var angle:Number = Math.atan2(dist_y,dist_x);//compute the angle of the monster
			tmpEnemy.x +=  moveSpeed * Math.cos(angle);//update the x position
			tmpEnemy.y +=  moveSpeed * Math.sin(angle);//update the y position
			tmpEnemy.rotation = angle / Math.PI * 180;//rotate the monster
			
			//remove the enemy if it touches the last wayPoint
			if (tmpEnemy.x >= 850)
			{
				removeChild(tmpEnemy);
				enemies.splice(i,1);
			}
			
			//remove the enemy if its hp becomes 0
			if (tmpEnemy.hp <= 0)
			{
				currentGold +=  tmpEnemy.gold; //add to current gold for howmuch the enemy is worth
				removeChild(tmpEnemy); //remove the enemy from the stage
				enemies.splice(i,1); //remove the enemy from the array
			}
		}

		//ON ENTER FRAME (refreshes each frame
		function onEnterFrameHandler(event:Event)
		{
			for (var i:int =0; i< enemies.length; ++i)
			{
				//move each enemy every frame 
				moveEnemy(enemies[i],i);
			}

		}

	}




}