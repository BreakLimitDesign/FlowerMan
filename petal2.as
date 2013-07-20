package 
	{
	import flash.display.MovieClip;	
	import flash.events.Event;
	import glclass.lt.uza.utils.*;	
		
	public class petal2 extends MovieClip
		{
		private var global:Global = Global.getInstance();
		private var thisPetal:petal2;
				
		public function petal2()
			{
			thisPetal = this;	
			addEventListener(Event.ENTER_FRAME, checkWrongNumber, false, 0, true );
			}
			
		private function checkWrongNumber(e:Event)
			{
			if (global.NumberWrong == "2")
				{
				thisPetal.visible = false;	
				removeEventListener(Event.ENTER_FRAME, checkWrongNumber);
				}
			}
		
		}	
	}
	