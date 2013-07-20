package 
	{
	import flash.display.MovieClip;	
	import flash.events.Event;
	import glclass.lt.uza.utils.*;	
		
	public class petal7 extends MovieClip
		{
		private var global:Global = Global.getInstance();
		private var thisPetal:petal7;
				
		public function petal7()
			{
			thisPetal = this;	
			addEventListener(Event.ENTER_FRAME, checkWrongNumber, false, 0, true );
			}
			
		private function checkWrongNumber(e:Event)
			{
			if (global.NumberWrong == "7")
				{
				thisPetal.visible = false;	
				removeEventListener(Event.ENTER_FRAME, checkWrongNumber);
				}
			}
		
		}	
	}
	