package{
	//import code
	import flash.display.MovieClip;
	public class Bullet extends MovieClip	{
		//declare bullet properties
		var bulletDamage: int = 10; //how much hp the enemy loses when it is hit
		var buleltSpeed: int = 10 //speed of the bullet
		var angle: Number; //angle of bullet 
		var target:Enemy; //target takes a variable from the enemy class
		
		public function Bullet(rotate:Number, tmpEnemy:Enemy)
		{
			
		}
		
		public function rotateBullet() 
		{
			
		}
		
		
	}

	
}