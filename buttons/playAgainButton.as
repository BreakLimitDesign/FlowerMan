package buttons
	{
	import flash.display.MovieClip;	
	import flash.events.*;
	import glclass.lt.uza.utils.*;
			
		
	public class playAgainButton extends MovieClip
		{
		private var global:Global = Global.getInstance();

		
		public function playAgainButton()
			{
			addEventListener(MouseEvent.CLICK, clickMe, false, 0, true );
			addEventListener(MouseEvent.ROLL_OVER,rollOverPlay, false, 0, true);
			addEventListener(MouseEvent.ROLL_OUT,rollOutPlay, false, 0, true );
			}
		
		private function clickMe(e:MouseEvent):void 
			{
			global.restartGame();
			playAgainButtonRemove();
			}
			
		private function rollOverPlay(e:MouseEvent):void
			{
			this.gotoAndStop("playAOver");
			}	
		
		private function rollOutPlay(e:MouseEvent):void 
			{
			this.gotoAndStop("playAOut");
			}
			
		private function playAgainButtonRemove()
			{
			removeEventListener(MouseEvent.CLICK, clickMe);	
			}
		}
		
	}	
		