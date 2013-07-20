package 
	{
	import flash.display.MovieClip;	
	import flash.events.Event;
	import glclass.lt.uza.utils.*;	
	
	public class wordsHolder extends MovieClip
		{
		private var global:Global = Global.getInstance();	
		private var wordArray:Array = new Array("ANEMONE", "AMARYLLIS", "DAISY", "ASTROEMERIA", "CARIBEA", "LILY", "DAFFODIL", 
		"ORCHID", "GARDENIA", "IRIS", "LISIANTHIS", "STEPHANOTIS", "SUNFLOWER", "TULIP", "WATSONIA", "TIGERLILY", "FREESIA", 
		"WATERLILY", "CLEMATIS", "SWEETPEA");
		private var stringHolder:String;
		private var arrayIndex:Number;
		private var minNum:Number;
		private var maxNum:Number;
		private var lastNum:Number;
				
		public function wordsHolder()
			{
			global.StringHolder = stringHolder;
			global.arrayIndex = arrayIndex;	
			global.arrayIndex = wordChooser(0, 19);
			if (global.arrayIndex!= lastNum)
				{
				stringChosen(global.arrayIndex);
				}
			else if (global.arrayIndex == lastNum)
				{
				addEventListener(Event.ENTER_FRAME, checkNumber, false, 0, true );
				}
			}
			
		private function wordChooser(minNum, maxNum)
			{
			return Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum;
			}
			
		private	function checkNumber(e:Event)
			{
			if (global.arrayIndex!= lastNum)
				{
				lastNum = global.arrayIndex;	
				stringChosen(global.arrayIndex);
				removeEventListener(Event.ENTER_FRAME, checkNumber);
				}
			else if (global.arrayIndex == lastNum)
				{
				global.arrayIndex = wordChooser(0, 19);	
				}	
			}
			
		private function stringChosen(arrayIndex)
			{
			global.StringHolder = wordArray[arrayIndex];
			}	
		}
	}