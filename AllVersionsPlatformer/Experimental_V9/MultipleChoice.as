package  {import flash.events.Event;import flash.net.URLLoader;import flash.net.URLRequest;import flash.utils.ByteArray;		public class MultipleChoice extends ByteArray 
	{		private var questions:Array = new Array();		public function MultipleChoice() 
		{			// constructor code			var textData:String = this.toString();			var lines:Array = textData.split("\n");
						for each (var line:String in lines) 
			{				var fields:Array = line.split(",");
								if (fields.length > 2)
				{					var question = fields[0];					var answer = fields[1];					trace(question + ": " + answer);					// now remove the first two elements from the array, and the rest is wrongAnswers					fields.splice(0, 2);					questions.push(new Question(question, answer, fields));				}			}			trace("loaded " + questions.length + " questions");		}						public function getNumberOfQuestions():int		{			return questions.length;		}				public function getQuestion(number:int):Question		{			// return a clone of the question so that the caller can modify whatever they want (including removing wrong answers)			return questions[number-1].clone();		}					}	}