package letters
	{
	import flash.display.MovieClip;	
	import flash.events.*;
	import glclass.lt.uza.utils.*;
			
		
	public class letterP extends MovieClip
		{
		private var global:Global = Global.getInstance();
		private var letterIs:String = "P";
		
		
		public function letterP()
			{
			addEventListener(MouseEvent.CLICK, clickMe, false, 0, true );
			addEventListener(MouseEvent.ROLL_OVER,rollOverPlay, false, 0, true);
			addEventListener(MouseEvent.ROLL_OUT,rollOutPlay, false, 0, true );
			}
		
		private function clickMe(e:MouseEvent):void 
			{
			global.whatLetter = letterIs;
			global.checkMe(global.whatLetter);
			letterButtonRemove();			
			}
			
		private function rollOverPlay(e:MouseEvent):void
			{
			this.gotoAndStop("playOver");
			}	
		
		private function rollOutPlay(e:MouseEvent):void 
			{
			this.gotoAndStop("playOut");
			}
			
		private function letterButtonRemove()
			{
			if (global.inString == false)
				{
				this.gotoAndStop("letterBad");
				removeEventListener(MouseEvent.CLICK, clickMe);	
				removeEventListener(MouseEvent.ROLL_OVER, rollOverPlay);	
				removeEventListener(MouseEvent.ROLL_OUT, rollOutPlay);
				}
			if (global.inString == true)
				{
				this.gotoAndStop("letterGood");	
				removeEventListener(MouseEvent.CLICK, clickMe);	
				removeEventListener(MouseEvent.ROLL_OVER, rollOverPlay);	
				removeEventListener(MouseEvent.ROLL_OUT, rollOutPlay);
				}	
			}
		}
		
	}	