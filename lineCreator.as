package 
	{
	import flash.display.MovieClip;	
	import flash.events.Event;
	import glclass.lt.uza.utils.*;	
	import lineMovie;
		
	public class lineCreator extends MovieClip
		{
		private var global:Global = Global.getInstance();	
		private var lines:lineMovie = new lineMovie;	
		private var lineArray:Array = new Array(); 
		private var num:Number = 0;
		private var holder:lineCreator;
		private var letterxPos:Number = 0;
		private var stageSize:Number = 1136;
				
		public function lineCreator()
			{
			holder = this;	
			global.LineArray = lineArray;	
			global.letterxPos = letterxPos;
			this.createLines(lines);
			addEventListener(Event.ENTER_FRAME, spaceWords, false, 0, true );
			}
			
		private function createLines(container:lineMovie)
			{
				
			for(var i=0; i<global.StringHolder.length; i++)
				{
				container = new lineMovie;	
				num = num + 40;	
				container.x=container.x+num;
				container.y = 450;
				addChild(container);
				global.LineArray.push(container.x);
				}
			}
			
		private function spaceWords(e:Event)
			{
			if (global.StringHolder.length == 4)
				{
				holder.x = (stageSize-160)/2;	
				global.letterxPos = (stageSize-160)/2;
				}
			else if (global.StringHolder.length == 5 )
				{
				holder.x = (stageSize-200)/2;	
				global.letterxPos = (stageSize-200)/2;
				}
			else if (global.StringHolder.length == 6 )
				{
				holder.x = (stageSize-240)/2;	
				global.letterxPos = (stageSize-240)/2;
				}	
			else if (global.StringHolder.length == 7 )
				{
				holder.x = (stageSize-280)/2;	
				global.letterxPos = (stageSize-280)/2;
				}
			else if (global.StringHolder.length == 8 )
				{
				holder.x = (stageSize-320)/2;	
				global.letterxPos = (stageSize-320)/2;
				}
			else if (global.StringHolder.length == 9 )
				{
				holder.x = (stageSize-360)/2;	
				global.letterxPos = (stageSize-360)/2;
				}	
			else if (global.StringHolder.length == 10 )
				{
				holder.x = (stageSize-400)/2;	
				global.letterxPos = (stageSize-400)/2;
				}	
			else if (global.StringHolder.length == 11 )
				{
				holder.x = (stageSize-440)/2;	
				global.letterxPos = (stageSize-440)/2;
				}		
			}	
		}	
	}
	