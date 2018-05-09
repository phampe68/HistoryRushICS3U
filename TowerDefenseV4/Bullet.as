package{
	import flash.display.MovieClip;	
	
	public class Bullet extends MovieClip
	{
		
		//declare bullet properties
		var damage: int = 10; //how much hp the enemy loses when it is hit
		var speed: int = 20 //speed of the bullet
		var angle: Number; //angle of bullet 
		var target:Enemy; //target takes a variable from the enemy class
		var remove:Boolean //if true, remove the bullet 
		
		public function Bullet(rotate:Number, tmpEnemy:Enemy)
		{
			angle = rotate;
			target = tmpEnemy;
			this.rotation =  angle / Math.PI * 180;
		}
		
		public function update() 
		{
			this.x += this.speed * Math.cos(angle);
			this.y += this.speed * Math.sin(angle);
			
			if (this.hitTestObject(target))
			{
				target.hp -= this.damage;
				remove = true;
			}
		}
	}
	
	
}