package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author adam
	 */
	public class Main extends Sprite 
	{
		private var mGame: cGame;
		public static const STAGE_WIDTH: Number = 800;
		public static const STAGE_HEIGHT: Number = 600;
		
		public function Main():void 
		{
			mGame = new cGame(stage);
			addEventListener(Event.ENTER_FRAME, EnterFrameCallBack);
			stage.addChild(mGame);
		}
		
		private function EnterFrameCallBack(event:Event):void
		{
			mGame.update();
			
		}
		
	}
	
}