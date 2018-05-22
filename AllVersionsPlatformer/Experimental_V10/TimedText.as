package {
	
	import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.utils.Timer;

	public class TimedText extends TextField 
	{
		private var timer:Timer;
		
		//first parameter is the text you want to show, second is how many milliseconds before it disappears, third is a different textFormat if you wanted.
		public function TimedText(startingText:String, time:Number = 5000, textFormat_:TextFormat = null):void {
			super();
			this.text = startingText;

			if (!textFormat_) { //if a text format isn't passed in, create one with the default settings
				textFormat_ = new TextFormat();
				textFormat_.size = 18;
				textFormat_.color = 0xff0000;
			}

			this.defaultTextFormat = textFormat_;

			timer = new Timer(time, 1); //create a timer that runs only one time
			timer.addEventListener(TimerEvent.TIMER, timerTick, false, 0, true); //listen for the timer event
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStage, false, 0, true);
		}

			//use add to stage so the timer doesn't start until the text field is actually visible
		private function addedToStage(e:Event):void {
			timer.start();
		}

		private function timerTick(e:TimerEvent):void {
			this.dispatchEvent(new Event(Event.COMPLETE)); //if you want something else to handle the removing

			//or animate / fade out first

			//or directly remove itself
			if (this.parent) {
				this.parent.removeChild(this);
			}
		}
	}
	
}
