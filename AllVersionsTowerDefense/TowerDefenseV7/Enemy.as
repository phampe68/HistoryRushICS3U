package{
	//import code
	import flash.display.MovieClip;
	
	public class Enemy extends MovieClip{
		
		var nextWayPoint:int = 0; //point where enemy turns
		var gold: int = 5; //how much gold is rewarded for destroying the enemy
		var hp: int = maxHP; // how much health the enemy has
		var maxHP:int = 30;
		var percentHP:Number;
		public function Enemy(){
			
		}
	}
	
}