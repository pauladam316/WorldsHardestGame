package 
{
	import flash.display.Sprite;
		
	/**
	 * ...
	 * @author adam
	 */
	public class cLevel4 extends Sprite
	{
		private var mStartZone: cStartZone;
		private var mEndZone: cEndZone;
		private var mHorizontalMovement1: cHorizontalMovement;
		private var mHorizontalMovement2: cHorizontalMovement;
		private var mHorizontalMovement3: cHorizontalMovement;
		
		public function cLevel4() 
		{
			
			
		}
		public function level2Start()
		{
			mStartZone = new cStartZone();
			mEndZone = new cEndZone();
			mHorizontalMovement1 = new cHorizontalMovement(5);
			mHorizontalMovement2 = new cHorizontalMovement(5);
			mHorizontalMovement3 = new cHorizontalMovement(5);
			
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
			mEndZone.update(600, 168, 699, 458);
			mHorizontalMovement1.update(cGame.mEnemy1, 294, 528);
			mHorizontalMovement2.update(cGame.mEnemy2, 294, 528);
			mHorizontalMovement3.update(cGame.mEnemy3, 294, 528);
			if (mEndZone.update == true) {
				cGame.level2Done = true;
			}
		}
		
	}

}