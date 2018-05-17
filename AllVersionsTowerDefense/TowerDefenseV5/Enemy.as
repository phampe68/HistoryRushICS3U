package{
	//import code
	import flash.display.MovieClip;
	
	public class Enemy extends MovieClip{
		var nextWayPoint:int = 0; //point where enemy turns
		var gold: int = 5; //how much gold is rewarded for destroying the enemy
		var hp: int = 30 // how much health the enemy has
		
		public function Enemy(){
			
		}
	}
	
}