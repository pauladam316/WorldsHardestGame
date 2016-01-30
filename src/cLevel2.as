package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.sampler.NewObjectSample;
		
	/**
	 * ...
	 * @author adam
	 */
	public class cLevel2 extends Sprite
	{
		private var mStartZone: cStartZone;
		private var mEndZone: cEndZone;
		private var mHorizontalMovement1: cHorizontalMovement;
		private var mHorizontalMovement2: cHorizontalMovement;
		private var mHorizontalMovement3: cHorizontalMovement;
		
		[Embed(source = "../assets/game_over.png")]
		private static const game_over:Class;
		
		public function cLevel2() 
		{
			
			
		}
		public function level2Start()
		{
			mStartZone = new cStartZone();
			mEndZone = new cEndZone();
			mHorizontalMovement1 = new cHorizontalMovement(20);
			mHorizontalMovement2 = new cHorizontalMovement(20);
			mHorizontalMovement3 = new cHorizontalMovement(20);
			
			
			
			if (cGame.mEnemy1 != null) {
				cGame.mEnemy1.x = 295;
				cGame.mEnemy1.y = 358;
			}
			if (cGame.mEnemy2 != null) {
				cGame.mEnemy2.x = 510;
				cGame.mEnemy2.y = 296;
			}
			if (cGame.mEnemy3 != null) {
				cGame.mEnemy3.x = 295;
				cGame.mEnemy3.y = 213;
			}
		}
		
		public function update(): void
		{
			mStartZone.update(116, 168, 215, 458);
			mHorizontalMovement1.update(cGame.mEnemy1, 294, 528);
			mHorizontalMovement2.update(cGame.mEnemy2, 294, 528);
			mHorizontalMovement3.update(cGame.mEnemy3, 294, 528);
			if (mEndZone.update(390, 11, 426, 73) == true) {
				cGame.level2Done = true;
				cGame.mPlayer.startPos(721, 295); //set start position of level 3
				var gameOverImage: Bitmap = new game_over();
				addChild(gameOverImage);
				
			}
		}
		
	}

}