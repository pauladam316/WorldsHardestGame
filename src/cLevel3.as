package 
{
	import flash.display.Sprite;
		
	/**
	 * ...
	 * @author adam
	 */
	public class cLevel3 extends Sprite
	{
		private var mStartZone: cStartZone;
		private var mEndZone: cEndZone;
		private var mHorizontalMovement1: cHorizontalMovement;
		private var mHorizontalMovement2: cHorizontalMovement;
		private var mHorizontalMovement3: cHorizontalMovement;
		
		public function cLevel3() 
		{
			
			
		}
		public function level3Start()
		{
			mStartZone = new cStartZone();
			mEndZone = new cEndZone();
			mHorizontalMovement1 = new cHorizontalMovement(5);
			
			if (cGame.mEnemy1 != null) {
				cGame.mEnemy1.x = 900; //600
				cGame.mEnemy1.y = 300;
			}
			if (cGame.mEnemy2 != null) {
				cGame.mEnemy2.x = 900;
				cGame.mEnemy2.y = 0;
			}
			if (cGame.mEnemy3 != null) {
				cGame.mEnemy3.x = 900;
				cGame.mEnemy3.y = 0;
			}
		}
		
		public function update(): void
		{
			mStartZone.update(116, 168, 215, 458);
			mEndZone.update(600, 168, 699, 458);
			//mHorizontalMovement1.update(cGame.mEnemy1, 114, 660);
			if (mEndZone.update == true) {
				cGame.level2Done = true;
			}
		}
		
	}

}