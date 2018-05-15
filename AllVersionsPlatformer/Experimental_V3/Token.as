package 
{

	import flash.display.*;
	import flash.events.*;


	public class Token extends MovieClip 
	{

		//VARIABLES
		private var _root: Object;
		//how quickly the enemy will move
		private var speed: Number;
		var turnRight: Boolean = false;
		//this function will run every time the Bullet is added
		//to the stage

		public function Token() 
		{
			addEventListener(Event.ADDED, beginClass);
			//functions that will run on enter frame
			addEventListener(Event.ENTER_FRAME, eFrame);
		}

		private function beginClass(event: Event): void 
		{
			_root = MovieClip(root);
		}
		private function eFrame(event: Event): void 
		{
			//making the bullet be removed if it goes off stage
			if (this.y > stage.stageHeight) 
			{
				removeEventListener(Event.ENTER_FRAME, eFrame);
				this.parent.removeChild(this);
			}

			//hit testing with the user
			if (hitTestObject(_root.picCharacter)) 
			{
				var level1Questions:Level1Questions = new Level1Questions();
				var question:Question = level1Questions.getQuestion(1);
				
				trace("ywkeugihjevekhrwjsdfijsefbk");
				removeEventListener(Event.ENTER_FRAME, eFrame);
				this.parent.removeChild(this);
			}

			if (_root.gameOver) 
			{
				trace("Game Over");
				removeEventListener(Event.ENTER_FRAME, eFrame);
				this.parent.removeChild(this);
			}
		}
		public function removeListeners(): void 
		{
			this.removeEventListener(Event.ENTER_FRAME, eFrame);
		}
	}
}