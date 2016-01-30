package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;

	/**
	 * ...
	 * @author adam
	 */
	public class cBackground extends Sprite
	{
		//initialize backkground images
		[Embed(source = "../assets/testLevel.png")]
		private static const BackGround:Class;
		
		[Embed(source = "../assets/level2.png")]
		private static const Level2:Class;
		
		[Embed(source = "../assets/level3.png")]
		private static const Level3:Class;
		
		[Embed(source = "../assets/level4.png")]
		private static const Level4:Class;
		
		private var backGround: Bitmap; //background
		
		public function cBackground() 
		{
			backGround= new BackGround();
			
			addChild(backGround);
		}
		
		public function swapBackground(level): void //swap it out
		{
			removeChild(backGround);
			if (level == 2) //swap according to level
			{
				backGround = new Level2();
				addChild(backGround);
			}
			if (level == 3) //swap according to level
			{
				backGround = new Level3();
				addChild(backGround);
			}
			if (level == 4) //swap according to level
			{
				backGround = new Level4();
				addChild(backGround);
			}
		}
		
	}

}