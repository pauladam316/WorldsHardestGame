package 
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.ui.Keyboard;
	import flash.ui.KeyboardType;
	import flash.net.*;

	/**
	 * ...
	 * @author adam
	 */
	public class cGame extends Sprite
	{	
		//Movement regeristration 
		private var mForward: Boolean = false;
		private var mBackward: Boolean = false;
		private var mLeft: Boolean = false;
		private var mRight: Boolean = false;
		
		private var playerDead: Boolean = false;
		
		private var playerTransparency: Number = 1;
		
		//declare objects
		public static var mPlayer: cPlayer;
		private var mBackground: cBackground;
		
		//enemys. Max of 4
		public static var mEnemy1: cEnemy = new cEnemy();
		public static var mEnemy2: cEnemy = new cEnemy();
		public static var mEnemy3: cEnemy = new cEnemy();
		public static var mEnemy4: cEnemy = new cEnemy();
			
		public static var myFormat:TextFormat = new TextFormat(); //formatting for level counter and death counter
		
		//score keepers
		public static var levelNumber:TextField = new TextField(); 
		public static var deathCount:TextField = new TextField();
		
		private var deathCountInt: int = 0;
		
		//Add levels here
		public static var mLevel1: cLevel1;
		public static var mLevel2: cLevel2;
		public static var mLevel3: cLevel3;
		public static var mLevel4: cLevel4;
		
		public static var level1Done = false;
		public static var level2Done = false;
		public static var level3Done = false;
		public static var level4Done = false;
		
		private var endGameCount: int = 0;
		
		public function cGame(stage:Stage) 
		{
			//initialize objects
			mBackground = new cBackground();
			mPlayer = new cPlayer();
			
			//add objects to scene
			addChild(mBackground);
			addChild(mPlayer);
			addChild(mEnemy1);
			addChild(mEnemy2);
			addChild(mEnemy3);
			addChild(mEnemy4);
			
			//default the enemies off of the screen. Move in if they are needed
			mEnemy1.x = 850;
			mEnemy2.x = 850;
			mEnemy3.x = 850;
			mEnemy4.x = 850;
			
			var bar:Sprite = new Sprite(); //black bar at top for score and such
			bar.graphics.beginFill(0x000000); //black
			bar.graphics.drawRect(0, 0, 800, 25);
			bar.graphics.endFill();
			addChild(bar);
			
			//set up text formatting
			myFormat.font = "Arial Black"; 
			myFormat.size = 15;
			myFormat.color = 0xFFFFFF //white
			
			//set up positions of counters
			levelNumber.x = 10; 
			deathCount.x = 700;
			
			levelNumber.text = "Level: 1";
			deathCount.text = "Deaths: 0";
			
			levelNumber.setTextFormat(myFormat);
			deathCount.setTextFormat(myFormat);
			
			addChild(levelNumber); //add to scene
			addChild(deathCount);
			
			//Initialize levels here
			mLevel1 = new cLevel1();
			mLevel2 = new cLevel2();
			mLevel3 = new cLevel3();
			mLevel4 = new cLevel4();
			
			addChild(mLevel2);//to display game over text
										
			mPlayer.startPos(160, 300);
						
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyUpCallBack);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDownCallBack);
		}
		
		public function update(): void
		{
			mPlayer.mForward = mForward; //send key data to the player
			mPlayer.mBackward = mBackward;
			mPlayer.mLeft = mLeft;
			mPlayer.mRight = mRight;
			
			mPlayer.update(); //update the player
			
			//what level to run update on
			if (level1Done == false)  
			{
				mLevel1.update(); 
				
			}
			else if (level2Done == false) 
			{
				mBackground.swapBackground(2); //swap backgrounds
				mLevel2.update(); 
			}
			
			
			else if (level3Done == false) 
			{
				endGameCount++;
				if (endGameCount == 50) {
					var url:String = stage.loaderInfo.url;
					var request:URLRequest = new URLRequest(url);
					navigateToURL(request,"_level0");
				}
			}
			/*
			else if (level4Done == false) 
			{
				mBackground.swapBackground(4); //swap backgrounds
				mLevel4.update(); 
			}
			*/
			
			death(); //check for death
		}
		
		public function KeyDownCallBack(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.W)
			{
				mForward = true;
			}
			if (event.keyCode == Keyboard.S)
			{
				mBackward = true;
			}
			if (event.keyCode == Keyboard.A)
			{
				mLeft = true;
			}
			if (event.keyCode == Keyboard.D)
			{
				mRight = true;
			}
		}
		
		public function KeyUpCallBack(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.W)
			{
				mForward = false;
			}
			if (event.keyCode == Keyboard.S)
			{
				mBackward = false;
			}
			if (event.keyCode == Keyboard.A)
			{
				mLeft = false;
			}
			if (event.keyCode == Keyboard.D)
			{
				mRight = false;
			}
		}
		
		public function death(): void {
			//if the player intersects the bounds of any of the 4 enemies
			if (mPlayer.x < mEnemy1.x + mEnemy1.width && mPlayer.y < mEnemy1.y + mEnemy1.height && mPlayer.x + mPlayer.width > mEnemy1.x && mPlayer.y + mPlayer.height > mEnemy1.y)
			{
				playerDead = true;
			}
			if (mPlayer.x < mEnemy2.x + mEnemy2.width && mPlayer.y < mEnemy2.y + mEnemy2.height && mPlayer.x + mPlayer.width > mEnemy2.x && mPlayer.y + mPlayer.height > mEnemy2.y)
			{
				playerDead = true;
			}
			if (mPlayer.x < mEnemy3.x + mEnemy3.width && mPlayer.y < mEnemy3.y + mEnemy3.height && mPlayer.x + mPlayer.width > mEnemy3.x && mPlayer.y + mPlayer.height > mEnemy3.y)
			{
				playerDead = true;
			}
			if (mPlayer.x < mEnemy4.x + mEnemy4.width && mPlayer.y < mEnemy4.y + mEnemy4.height && mPlayer.x + mPlayer.width > mEnemy4.x && mPlayer.y + mPlayer.height > mEnemy4.y)
			{
				playerDead = true;
			}
			
			if (playerDead == true) 
			{
				mPlayer.alpha -= 0.1; //fade away
				
				//disable movement
				mForward = false;
				mBackward = false;
				mLeft = false;
				mRight = false;
				
				if (mPlayer.alpha < 0) 
				{
					if (level1Done == false)
					{
						mPlayer.startPos(160, 300); //reset to origin
					}
					else if (level2Done == false)
					{
						mPlayer.startPos(406, 532);
					}
					else if (level3Done == false)
					{
						mPlayer.startPos(721, 295);
					}
					else if (level4Done == false)
					{
						mPlayer.startPos(740, 287);
					}
					playerDead = false; //revive
					mPlayer.alpha = 1;
					
					deathCountInt ++; //increase your deaths
					deathCount.text = "Deaths: " + deathCountInt; //update the counter
					deathCount.setTextFormat(myFormat);
				}
				
			}
			
		}
		
		
	}

}