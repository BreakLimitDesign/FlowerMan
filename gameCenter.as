//Joynisha Sumpter Game Center Class for HangMan Game

package 
{
	import com.adobe.ane.gameCenter.GameCenterAchievement;
	import com.adobe.ane.gameCenter.GameCenterAchievementEvent;
	import com.adobe.ane.gameCenter.GameCenterAuthenticationEvent;
	import com.adobe.ane.gameCenter.GameCenterController;
	import com.adobe.ane.gameCenter.GameCenterError;
	import com.adobe.ane.gameCenter.GameCenterEvent;
	import com.adobe.ane.gameCenter.GameCenterPlayer;
	
	import flash.display.MovieClip;
	import glclass.lt.uza.utils.*; // A Singleton written by Paulius Uza that lets you store dynamic variables in a globally accessible location within your AS3 application.
	import flash.events.*;

	
	public class gameCenter extends MovieClip 
	{
		private var gcController : GameCenterController = new GameCenterController(this.stage);
	
								
		public function gameCenter() 
		{
		gcController.authenticate();
		
		gcController.addEventListener(GameCenterAuthenticationEvent.PLAYER_AUTHENTICATED,authTrue);
		gcController.addEventListener(GameCenterAuthenticationEvent.PLAYER_NOT_AUTHENTICATED,authFailed);
		gcController.addEventListener(GameCenterAuthenticationEvent.PLAYER_AUTHENTICATION_CHANGED,authChanged);
		gcController.addEventListener(GameCenterAchievementEvent.ACHIEVEMENTS_VIEW_FINISHED,achFinished);
		gcController.addEventListener(GameCenterAchievementEvent.ACHIEVEMENTS_LOADED,achLoaded);
		gcController.addEventListener(GameCenterAchievementEvent.ACHIEVEMENTS_FAILED,achFailed);
		gcController.addEventListener(GameCenterAchievementEvent.SUBMIT_ACHIEVEMENT_SUCCEEDED,achSubmitted);
		gcController.addEventListener(GameCenterAchievementEvent.RESET_ACHIEVEMENTS_SUCCEEDED,resetSuccess);
		gcController.addEventListener(GameCenterAchievementEvent.RESET_ACHIEVEMENTS_FAILED,resetUnsuccess);
		gcController.addEventListener(GameCenterAchievementEvent.ACHIEVEMENTS_VIEW_FINISHED,achViewFinished);
		gcController.addEventListener(GameCenterAchievementEvent.SUBMIT_ACHIEVEMENT_FAILED, achSubmitFailed);
		
		gcController.authenticate();
		
		// support autoOrients
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		}				
		
		public function achViewFinished(ev : GameCenterAchievementEvent):void
		{
			trace("Achievement View finished");
			gcController.resetAchievements();
		}
		
		public function resetUnsuccess( ev : GameCenterAchievementEvent):void
		{
			
			trace("reset failed");
		}
		
		public function resetSuccess( ev : GameCenterAchievementEvent):void
		{
			trace ( "reset suceess");
			//   gcController.showAchievementsView();
		}
		
		public function achSubmitted ( ev : GameCenterAchievementEvent):void
		{
			trace("achievemnt submited");
			//   gcController.requestAchievements();
		}
		
		public function achSubmitFailed(ev :GameCenterAchievementEvent):void
		{
			trace("achievement submit failed ");
		}
		
		public function achLoaded(ev:GameCenterAchievementEvent):void
		{
			trace("ach loaded succedded");
			for each ( var x:GameCenterAchievement in ev.achievements)
			{
				x.addEventListener(GameCenterAchievementEvent.ACHIEVEMENT_IMAGE_LOADED,imageLoaded);
				x.addEventListener(GameCenterAchievementEvent.ACHIEVEMENT_IMAGE_FAILED,function imageFailed(ev:GameCenterAchievementEvent):void{ trace(" image load failed");});
				x.requestImage();
				trace ( x.achievedDescription + "  " + x.hidden + "  " + x.identifier + "  " + 
					x.maximumPoints + "  " + x.title + "  " + x.unachievedDescription );
			}
			
			gcController.showAchievementsView();
		}
		
		public function achFailed(ev : GameCenterAchievementEvent):void
		{
			trace(" Achiev loadedcfailed");   
		}
		
		public function achFinished(ev:GameCenterAchievementEvent):void
		{
			trace("achievemnt finished");
			trace(ev.achievements);
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
			gcController.submitAchievement("airachievement01",100);
			
			gcController.requestAchievements();
			
		}
		
		public function auth(ev:GameCenterAuthenticationEvent):void
		{
			trace( ev.type);
			trace("from event" + gcController.authenticated);
			if(gcController.localPlayer!=null)
				trace("  " + gcController.localPlayer.alias + " \n" + gcController.localPlayer.id 
					+ " \n" + gcController.localPlayer.isFriend + " \n" );
			else trace("null");
		}
	}
}	
