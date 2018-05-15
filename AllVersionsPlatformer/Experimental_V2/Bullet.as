//This is the basic skeleton that all classes must havepackage
{	import flash.display.MovieClip;	import flash.events.*;
		public class Bullet extends MovieClip
	{
		//vriables for bullet class		private var _root:Object;		private var speed:int = 10; //bullet speed		public function Bullet()
		{			//event listeners when object is added to stage			addEventListener(Event.ADDED, beginClass);			addEventListener(Event.ENTER_FRAME, eFrame);		}
				private function beginClass(event:Event):void
		{			_root = MovieClip(root);		}
				private function eFrame(event:Event):void
		{			//move bullet upwards			y -= speed;
			
			//var angle:Number = Math.atan2(dist_x)
						//remove bullet when off stage			if(this.y < -1 * this.height)
			{				removeEventListener(Event.ENTER_FRAME, eFrame);				_root.bulletContainer.removeChild(this);			}
						//check if game is over			if(_root.gameOver)
			{				removeEventListener(Event.ENTER_FRAME, eFrame);				this.parent.removeChild(this);			}		}
		
		//function to remove event listeners		public function removeListeners():void
		{			removeEventListener(Event.ENTER_FRAME, eFrame);		}	}}