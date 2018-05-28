package{
	import flash.display.MovieClip;	
	import flash.utils.Timer;
	
	public class Bullet extends MovieClip
	{
		//declare bullet properties
		
		var bulleType:int; //type of bullet 
		
		
		var damage: int = 10; //how much hp the enemy loses when it is hit
		var speed: int = 20 //speed of the bullet
		var angle: Number; //angle of bullet 
		var target:Enemy; //target takes a variable from the enemy class
		var remove:Boolean //if true, remove the bullet 
		var tmpTowerA:Tower; 
		
		public function Bullet(rotate:Number, tmpEnemy:Enemy, tmpTower:Tower)
		{
			angle = rotate; //set angle variable to the angle sent from main
			target = tmpEnemy; //set the target of the bullet
			this.rotation =  angle / Math.PI * 180; //rotate the bullet according to the direction it's headed
			tmpTowerA = tmpTower;
		}
		
		public function update() 
		{
			this.x += this.speed * Math.cos(angle); //move the bullet
			this.y += this.speed * Math.sin(angle);
			
			//if the bullet hits the target, take away from the target's hp and set that the bullet needs to be removed
			if (this.hitTestObject(target))
			{
				
				switch(tmpTowerA.towerType)
				{
					case 0:
					target.hp -= this.damage;
					remove = true;
					break;
					
					case 1: 
					this.damage = 20;
					var tmpExplosion = new Explosion;
					addChild(tmpExplosion);
					target.hp -= this.damage;
					remove = true;
				}
			}
		
			if (this.x > 850 || this. x < 0 || this. y < 0 || this. y > 600)
			{
				remove = true;
			}
		
		
		}
	}
	
	
}