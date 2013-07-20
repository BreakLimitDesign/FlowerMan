package 
	{
	import flash.display.MovieClip;	
	import flash.events.Event;
	import glclass.lt.uza.utils.*;	
		
	public class petal4 extends MovieClip
		{
		private var global:Global = Global.getInstance();
		private var thisPetal:petal4;
				
		public function petal4()
			{
			thisPetal = this;	
			addEventListener(Event.ENTER_FRAME, checkWrongNumber, false, 0, true );
			}
			
		private function checkWrongNumber(e:Event)
			{
			if (global.NumberWrong == "4")
				{
				thisPetal.visible = false;	
				removeEventListener(Event.ENTER_FRAME, checkWrongNumber);
				}
			}
		
		}	
	}
	