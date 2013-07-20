package 
	{
	import flash.display.MovieClip;	
	import glclass.lt.uza.utils.*;	
	import flash.events.*;
		
	public class letterChecks extends MovieClip
		{
		private var global:Global = Global.getInstance();	
		private var keyNum:String;
		private var indexHolder:Number;
		private var PetalOne:petal1;
		private var PetalTwo:petal2;
		private var PetalThree:petal3;
		private var PetalFour:petal4;
		private var PetalFive:petal5;
		private var PetalSix: petal6;
		private var PetalSeven:petal7;
		private var numberWrong:Number=0;
		private var inString:Boolean = false;
		private var whatLetter:String;
	
				
		public function letterChecks()
			{
			addEventListener(Event.ENTER_FRAME, gameOver, false, 0, true );
			addEventListener(Event.ENTER_FRAME, nextFlower, false, 0, true );
			global.NumberWrong = numberWrong;
			global.whatLetter = whatLetter;
			global.checkMe = checkMe;
			global.inString = inString;
			}
				
		private function checkMe(letterPress)
			{
			if (global.StringHolder.indexOf(letterPress)!=-1)
				{
				for (var i = 0; i < global.StringHolder.length; i++)
					{
					if (global.StringHolder.charAt(i) == letterPress)
						{
						global.CreateLetter(global.LineArray[i] + global.letterxPos, i);
						global.charArray.push(1);
						}
					}
				global.inString = true;	
				}
			 if(global.StringHolder.indexOf(letterPress)==-1)
				{
				global.NumberWrong = global.NumberWrong +1;	
				global.inString = false;	
				}
			}
		
		private function gameOver(e:Event)
			{
			if (global.NumberWrong == 7)
				{
				global.gameOverActivate();	
				removeEventListener(Event.ENTER_FRAME, gameOver);
				}
			}
		
		private function nextFlower(e:Event)
			{
			if (global.charArray.length == global.StringHolder.length)
				{
				global.winScreen();	
				trace(global.charArray.length);	
				removeEventListener(Event.ENTER_FRAME, nextFlower);
				}
			}	
		}	
	}
	