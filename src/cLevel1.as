package 
{
	import flash.display.Sprite;
		
	/**
	 * ...
	 * @author adam
	 */
	public class cLevel1 extends Sprite
	{
		private var mStartZone: cStartZone; //create a starting zone
		private var mEndZone: cEndZone;
		private var mVerticalMovement: cVerticalMovement; //vertical movement for the area
		private var mVerticalMovement2: cVerticalMovement; //vertical movement for the area
		private var mVerticalMovement3: cVerticalMovement; //vertical movement for the area
		
		public function cLevel1() 
		{
			mStartZone = new cStartZone();
			mEndZone = new cEndZone();
			mVerticalMovement = new cVerticalMovement(25); //set the speed of the movement
			mVerticalMovement2 = new cVerticalMovement(-25); //set the speed of the movement
			mVerticalMovement3 = new cVerticalMovement(25); //set the speed of the movement
			
			if (cGame.mEnemy1 != null) {
				cGame.mEnemy1.x = 268; //set the location of the enemy
				cGame.mEnemy1.y = 186;
			}
			if (cGame.mEnemy2 != null) {
				cGame.mEnemy2.x = 403; //set the location of the enemy
				cGame.mEnemy2.y = 400;
			}
			if (cGame.mEnemy3 != null) {
				cGame.mEnemy3.x = 537; //set the location of the enemy
				cGame.mEnemy3.y = 186;
			}
			
		}
		
		public function update(): void
		{
			mStartZone.update(116, 168, 215, 458); //size of start zone
			mVerticalMovement.update(cGame.mEnemy1, 175, 450); //move the enemy
			mVerticalMovement2.update(cGame.mEnemy2, 175, 450); //move the enemy
			mVerticalMovement3.update(cGame.mEnemy3, 175, 450); //move the enemy
			if (mEndZone.update(600, 168, 699, 458) == true) { //entering the end zone
				cGame.level1Done = true; //level done
				cGame.mPlayer.startPos(406, 532); //set start position of level 2
				cGame.mLevel2.level2Start(); //start level 2
				cGame.levelNumber.text = "Level: 2"; //set level text
				cGame.levelNumber.setTextFormat(cGame.myFormat);
			}
		}
		
	}

}