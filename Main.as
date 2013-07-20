package 
	{
	import flash.display.MovieClip;	
	import wordsHolder;
	import lineCreator;
	import glclass.lt.uza.utils.*;
			
	public class Main extends MovieClip
		{
		private var global:Global = Global.getInstance();	
		private var WordsHolder:wordsHolder = new wordsHolder();	
		private var LineCreator:lineCreator = new lineCreator();
		private var LetterChecks:letterChecks = new letterChecks();
		private var LetterAppears:letterAppears = new letterAppears();
				
				
		public function Main()
			{
			this.init();
			}
		
		private function init()
			{
			this.addChild(WordsHolder);	
			this.addChild(LineCreator);
			this.addChild(LetterChecks);
			this.addChild(LetterAppears);
			}	
			
		private	function mainClear():void
			{
			
			}
		}
	}