package 
	{
	import flash.display.MovieClip;	
	import glclass.lt.uza.utils.*;	
	import flash.text.*;
		
	public class letterAppears extends MovieClip
		{
		private var global:Global = Global.getInstance();
		private var index:Number;
		private var xPosition:Number;
		private var letterHolder:TextField;
		private var letterHolderFormat:TextFormat = new TextFormat();
		private var myFont:Font = new Shonen();
		private var charArray:Array = new Array(); 
				
		public function letterAppears()
			{
			global.CreateLetter = createLetter;
			global.charArray = charArray;
			}
			
		private function createLetter(xPosition, index)
			{
			letterHolder = new TextField;	
			letterHolder.embedFonts = true;
			letterHolder.type = TextFieldType.DYNAMIC;
			letterHolder.antiAliasType = AntiAliasType.ADVANCED;	
			letterHolder.width=30;
			letterHolder.height= 50;
			letterHolder.x=xPosition;
			letterHolder.y = 400;
			letterHolder.selectable = false;
			this.addChild(letterHolder);
			letterHolder.text = global.StringHolder.charAt(index);	
			letterHolderFormat.font=myFont.fontName;
			letterHolderFormat.color="0xFFFFFF";
			letterHolderFormat.size=30;
			letterHolderFormat.bold=true;
			letterHolderFormat.align=TextFormatAlign.LEFT;
			letterHolder.setTextFormat(letterHolderFormat);	
			}
		}			
		
	}
	