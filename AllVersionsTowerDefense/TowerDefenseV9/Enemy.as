package{
	//import code
	import flash.display.MovieClip;
	
	public class Enemy extends MovieClip
	{
		//declare arrays (preset values of different properties of the enemy)
		var speedArr:Array = new Array(2,3,5);
		var goldArr:Array = new Array(5,10,15); //how much gold is rewarded for destroying the enemy]
		var maxHPArr:Array = new Array(30, 50, 70); // how much health an enemy has
		
		//declare variables
		var nextWayPoint:int = 0; //point where enemy turns
		var enemyType: int; 
				
		var percentHP:Number;
		var speed:int; 
		var gold:int;
		var hp:int;
		
		public function Enemy(randomType)
		{
				enemyType = randomType;
				speed = speedArr[enemyType];
				gold = goldArr[enemyType];
				hp = maxHPArr[enemyType];
				this.gotoAndStop(enemyType + 1);
		}
	}
	
}