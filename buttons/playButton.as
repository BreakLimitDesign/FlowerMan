package buttons
	{
	import flash.display.MovieClip;	
	import flash.events.*;
	import glclass.lt.uza.utils.*;
			
		
	public class playButton extends MovieClip
		{
		private var global:Global = Global.getInstance();

		
		public function playButton()
			{
			addEventListener(MouseEvent.CLICK, clickMe, false, 0, true );
			addEventListener(MouseEvent.ROLL_OVER,rollOverPlay, false, 0, true);
			addEventListener(MouseEvent.ROLL_OUT,rollOutPlay, false, 0, true );
			}
		
		private function clickMe(e:MouseEvent):void 
			{
			global.activateMaingame();
			playButtonRemove();
			}
			
		private function rollOverPlay(e:MouseEvent):void
			{
			this.gotoAndStop("playOver");
			}	
		
		private function rollOutPlay(e:MouseEvent):void 
			{
			this.gotoAndStop("playOut");
			}
			
		private function playButtonRemove()
			{
			removeEventListener(MouseEvent.CLICK, clickMe);	
			}
		}
		
	}	
		