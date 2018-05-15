//This is the basic skeleton that all classes must have
package
{
	//we have to import certain display objects and events
	import flash.display.MovieClip;
	import flash.events.*;
	//this just means that Enemy will act like a MovieClip
	public class Enemy extends MovieClip
	{
		//VARIABLES
		//this will act as the root of the document
		//so we can easily reference it within the class
		private var _root:Object;
		//how quickly the enemy will move
		private var speed:Number;
		//this function will run every time the Bullet is added
		//to the stage
		public function Enemy()
		{
			//adding events to this class
			//functions that will run only when the MC is added
			addEventListener(Event.ADDED, beginClass);
			//functions that will run on enter frame
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		private function beginClass(event:Event):void
		{
			_root = MovieClip(root);
		}
		private function eFrame(event:Event):void
		{
			//moving the bullet up screen
			speed = Math.floor(Math.random()*30) + 10;
			y += speed;

			//making the bullet be removed if it goes off stage
			if(this.y > stage.stageHeight)
			{
				removeEventListener(Event.ENTER_FRAME, eFrame);
				this.parent.removeChild(this);
			}
			//checking if it is touching any bullets
			//we will have to run a for loop because there will be multiple bullets
			for(var i:int = 0;i<_root.bulletContainer.numChildren;i++)
			{
				//numChildren is just the amount of movieclips within 
				//the bulletContainer.
				
				//we define a variable that will be the bullet that we are currently
				//hit testing.
				var bulletTarget:MovieClip = _root.bulletContainer.getChildAt(i);
				
				//now we hit test
				if(hitTestObject(bulletTarget))
				{
					trace("t");
					//remove this from the stage if it touches a bullet
					removeEventListener(Event.ENTER_FRAME, eFrame);
					this.parent.removeChild(this);
					
					//also remove the bullet and its listeners
					_root.bulletContainer.removeChild(bulletTarget);
					bulletTarget.removeListeners();
					//up the score
					_root.mainScore += 1;
					_root.scoreTick();
					_root.amountUntilBoost += 1;

				}
			}
			
			//hit testing with the user
			if(hitTestObject(_root.picCharacter))
			{
				_root.currentHP -= 1;
				//_root.gotoAndStop('lose');
				if(_root.currentHP <= 0)
				{
					//losing the game
					_root.gameOver = true;
				}
			}
			
			if(_root.gameOver)
			{
				trace("Game Over");
				removeEventListener(Event.ENTER_FRAME, eFrame);
				this.parent.removeChild(this);
			}
		}
		public function removeListeners():void
		{
			this.removeEventListener(Event.ENTER_FRAME, eFrame);
		}
	}
}