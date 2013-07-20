package buttons
	{
	import flash.display.MovieClip;	
	import flash.events.*;
	import glclass.lt.uza.utils.*;
			
		
	public class tryAgainButton extends MovieClip
		{
		private var global:Global = Global.getInstance();

		
		public function tryAgainButton()
			{
			addEventListener(MouseEvent.CLICK, clickMe, false, 0, true );
			addEventListener(MouseEvent.ROLL_OVER,rollOverPlay, false, 0, true);
			addEventListener(MouseEvent.ROLL_OUT,rollOutPlay, false, 0, true );
			}
		
		private function clickMe(e:MouseEvent):void 
			{
			global.newLevel();
			tryAgainButtonRemove();
			}
			
		private function rollOverPlay(e:MouseEvent):void
			{
			this.gotoAndStop("tryOver");
			}	
		
		private function rollOutPlay(e:MouseEvent):void 
			{
			this.gotoAndStop("tryOut");
			}
			
		private function tryAgainButtonRemove()
			{
			removeEventListener(MouseEvent.CLICK, clickMe);	
			}
		}
		
	}	