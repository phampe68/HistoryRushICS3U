package  
{	public class Question 
	{		private var question:String;		private var answer:String;		private var wrongAnswers:Array;				public function Question(question:String, answer:String, wrongAnswers:Array) 
		{			// constructor code			this.question = question;			this.answer = answer;			this.wrongAnswers = wrongAnswers.concat();		}		public function getQuestion() 
		{			return question;		}				public function getAnswer() 
		{			return answer;		}				public function getNumberOfWrongAnswers() 
		{			return wrongAnswers.length;		}				public function getWrongAnswer(number:int) 
		{			return wrongAnswers[number-1];		}				public function removeWrongAnswer(number:int) 
		{			wrongAnswers.splice(number-1, 1);		}				public function clone():Question 
		{			return new Question(this.question, this.answer, this.wrongAnswers);		}	}	}