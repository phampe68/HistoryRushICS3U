package{
	//import code
	import flash.display.MovieClip;
	public class Bullet extends MovieClip	{
		//declare bullet properties
		var damage: int = 10; //how much hp the enemy loses when it is hit
		var speed: int = 10 //speed of the bullet
		var reloadTime: int = 30;
		var angle:Number;
		var target:Enemy; //target takes a variable from the enemy class
		var remove:Boolean = false; //boolean if bullet needs to be removed
		
		public function Bullet(rotate:Number, tmpEnemy:Enemy)
		{
			trace("a");
			angle = rotate;
			target = tmpEnemy;
			this.rotation = angle/Math.PI * 180;
		}
		
		public function update() 
		{
			trace("I'm being called");
			this.x += Math.cos(angle) * this.speed;
			this.y += Math.sin(angle)* this.speed;
			
			if (this.hitTestObject(target))
				{
					target.hp -= this.damage;
					remove = true;
				}
		}
		
		
	}

	
}