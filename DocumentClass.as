//Joynisha Sumpter DocumentClass for HangMan Game

package 
{
	import flash.display.MovieClip;
	import glclass.lt.uza.utils.*; // A Singleton written by Paulius Uza that lets you store dynamic variables in a globally accessible location within your AS3 application.
	import flash.events.*;
	
	import com.adobe.ane.gameCenter.GameCenterAchievement;
	import com.adobe.ane.gameCenter.GameCenterAchievementEvent;
	import com.adobe.ane.gameCenter.GameCenterAuthenticationEvent;
	import com.adobe.ane.gameCenter.GameCenterController;
	import com.adobe.ane.gameCenter.GameCenterError;
	import com.adobe.ane.gameCenter.GameCenterPlayer;
	
	import flash.display.StageAlign;
    import flash.display.StageScaleMode;

	
	public class DocumentClass extends MovieClip 
	{
		private var global:Global = Global.getInstance(); // initialize the global object
		private var gcController : GameCenterController = new GameCenterController();
		private var mainArray:Array = new Array(mainGame0, mainGame1, mainGame2, mainGame3, mainGame4, mainGame5, mainGame6, mainGame7,
		mainGame8, mainGame9, mainGame10, mainGame11, mainGame12, mainGame13, mainGame14, mainGame15, mainGame16, mainGame17, mainGame18, mainGame19);
		private var titlePage:titleScreen;
		private var GameOverScreen:gameOver;
		private var winnerPage:youWinM;
		private var arrayIndex:Number;
		private var numberH:Number = 0;
		private var mainHolder:Main;
						
								
		public function DocumentClass() 
		{
		global.activateMaingame = activateMaingame; // setting a global variable	
		global.gameOverActivate = gameOverActivate;
		global.restartGame = restartGame; 
		global.winScreen = winScreen; 
		global.newLevel = newLevel; 
		titlePage = new titleScreen();
		titlePage.x = 0; // Setting the Title Screen location
		titlePage.y = 0;
		addChild(titlePage);
		arrayIndex = numberH;	
		gcController.authenticate();
		gcController.addEventListener(GameCenterAuthenticationEvent.PLAYER_AUTHENTICATED,authTrue);
		gcController.addEventListener(GameCenterAuthenticationEvent.PLAYER_NOT_AUTHENTICATED, authFailed);
		gcController.addEventListener(GameCenterAuthenticationEvent.PLAYER_AUTHENTICATION_CHANGED,authChanged);
		gcController.authenticate();
		
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.EXACT_FIT;
		trace(gcController);
		trace( gcController.authenticated);
		}				
		///////////////////////////////Game Control///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
		
		private function wordChooser()
			{
			if (numberH >=0 && numberH != 19)
				{
				numberH = numberH + 1;	
				}
			else if(numberH == 19)
				{
				numberH = 0;	
				}
			return numberH;	
			}
		
		public function authFailed(ev : GameCenterAuthenticationEvent):void
		{
			trace("authentication failed fired");
			
		}	
		
		public function authChanged(ev : GameCenterAuthenticationEvent):void
		{
			trace("authentication changed fired");
			trace( gcController.authenticated);
			
		}
				
		public function authTrue(ev: GameCenterAuthenticationEvent):void
		{
			trace("Player authenticated fired");
		}
		

		private function activateMaingame():void //Function to load the Main Class holding all the game objects.
			{
			mainHolder = new mainArray[arrayIndex];
			mainHolder.x = 0;
			mainHolder.y = 0;
			addChild(mainHolder);
			removeChild(titlePage); //Removes the Title Page Screen from the display list.
			titlePage = null; // Setting the object to null to make sure it is sent to garbage collection.
			}
		
		private function gameOverActivate():void 
			{
			GameOverScreen = new gameOver();
			GameOverScreen.x = 0;
			GameOverScreen.y = 0;
			addChild(GameOverScreen);
			if (mainHolder.parent) 
				{
				mainHolder.parent.removeChild(mainHolder);
				}
			}	
		
		private function restartGame():void 
			{
			arrayIndex = wordChooser();	
			mainHolder = new mainArray[arrayIndex];
			mainHolder.x = 0;
			mainHolder.y = 0;
			addChild(mainHolder);
			removeChild(GameOverScreen); 
			GameOverScreen = null; 
			}
		
		private function newLevel():void 
			{
			arrayIndex =wordChooser();	
			mainHolder = new mainArray[arrayIndex];
			mainHolder.x = 0;
			mainHolder.y = 0;
			addChild(mainHolder);
			removeChild(winnerPage); 
			winnerPage = null; 
			}	
		
		private function winScreen():void 
			{
			winnerPage = new youWinM();
			winnerPage.x = 0;
			winnerPage.y = 0;
			addChild(winnerPage);
			if (mainHolder.parent) 
				{
				mainHolder.parent.removeChild(mainHolder);
				}
			}		
		}
}	
