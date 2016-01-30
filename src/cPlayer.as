package 
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	/**
	 * ...
	 * @author adam
	 */
	public class cPlayer extends Sprite
	{
		[Embed(source = "../Assets/player.png")]
		private static const PlayerImage:Class;
		
		private var mBitMapWidth:Number;
		
		public var mForward: Boolean = false;
		public var mBackward: Boolean = false;
		public var mLeft: Boolean = false;
		public var mRight: Boolean = false;
		
		public static var xSpeed: int;
		public static var ySpeed: int;
		
		public function cPlayer() 
		{
			var playerImage:Bitmap = new PlayerImage();
			
			addChild(playerImage);
			x = 1;
			y = 1;
		}
		
		public function update(): void
		{
			xSpeed = 0; //Default to zero and change if a button is pressed
			ySpeed = 0;
			
			if (mForward)
			{
				ySpeed = -5;
			}
			if (mBackward)
			{
				ySpeed = 5;
			}
			if (mLeft)
			{
				xSpeed = -5;
			}
			if (mRight)
			{
				xSpeed = 5;
			}
			
			//Collision Detection for outer walls
			if (x < 0)
			{
				xSpeed = 0;
				x = 0;
			}
			else if (x == 0 && xSpeed == -5) //intercepts player when he tries to leave game if he is already on the edge
			{
				xSpeed = 0;
			}
			
			else if (x + width > Main.STAGE_WIDTH ) 
			{
				x = Main.STAGE_WIDTH - width;
				xSpeed = 0;
			}
			else if (x + width == Main.STAGE_WIDTH && xSpeed == 5 ) 
			{
				xSpeed = 0;
			}
			
			
			if (y < 0 )
			{
				ySpeed = 0;
				y = 0;
			}
			else if (y == 0 && ySpeed == -5)
			{
				ySpeed = 0;
			}
			else if (y + height > Main.STAGE_HEIGHT) 
			{
				y = Main.STAGE_HEIGHT - height;
				ySpeed = 0;
			}
			else if (y + height == Main.STAGE_HEIGHT && ySpeed == 5) 
			{

				ySpeed = 0;
			}
			//collision for level walls
			if (cGame.level1Done == false) 
			{
				xCollisionMin(116, 0, 800);
				xCollisionMax(699, 0, 800);
				yCollisionMin(167, 0, 800);
				yCollisionMax(457, 0, 800);
			}
			else if (cGame.level2Done == false) 
			{
				xCollisionMin(390, 11, 202);
				xCollisionMin(285, 0, 800);
				xCollisionMin(390, 384, 563);
				
				xCollisionMax(426, 11, 202);
				xCollisionMax(536, 0, 800);
				xCollisionMax(426, 384, 563);
				
				yCollisionMin(12, 0, 800);
				yCollisionMin(203, 284, 389);
				yCollisionMin(203, 427, 536);
				
				yCollisionMax(562, 0, 800);
				yCollisionMax(383, 284, 389);
				yCollisionMax(383, 427, 536);
			}
			
			else if (cGame.level3Done == false) 
			{
				
				//xCollisionMin(27, 0, 800);
				//xCollisionMin(153, 173, 294);
				//xCollisionMin(153, 316, 418);
				//xCollisionMin(334, 173, 294);
				//xCollisionMin(334, 316, 418);
				//xCollisionMin(516, 173, 294);
				//xCollisionMin(516, 316, 418);
				
				xCollisionMax(757, 0, 800);
				
				//xCollisionMax(193, 175, 292);
				//xCollisionMax(193, 318, 416);
				//xCollisionMax(374, 175, 292);
				//xCollisionMax(374, 318, 416);
				//xCollisionMax(556, 175, 281);
				//xCollisionMax(556, 319, 416);
				
				//yCollisionMin(175, 0, 800);
				//yCollisionMin(282, 25, 152);
				//yCollisionMin(282, 194, 332);
				//yCollisionMin(282, 375, 515);
				yCollisionMin(282, 557, 757);
				
				//yCollisionMax(416, 0, 800);
				//yCollisionMax(318, 25, 152);
				//yCollisionMax(318, 194, 332);
				//yCollisionMax(318, 375, 515);
				yCollisionMax(318, 557, 757);
				
			}
			
			x += xSpeed;
			y += ySpeed;
		}
		public function startPos(xPos, yPos):void
		{
			x = xPos;
			y = yPos;
		}
		
		public function yCollisionMin(min, minCon, maxCon):void
		{
			if (y == min && x + width == minCon && x == maxCon)
			{
				y = min;
				ySpeed = 0;
				trace("yMin");
			}
			else if (y == min && x + width > minCon && x < maxCon && ySpeed == -5) //intercepts player when he tries to leave game if he is already on the edge
			{
				ySpeed = 0;
			}
		}
		
		
		public function yCollisionMax(max, minCon, maxCon):void
		{
			if (y + height > max && x + width > minCon && x < maxCon)
			{
				y = max - height;
				ySpeed = 0;
				trace("yMax");
			}
			else if (y + height == max && x + width > minCon && x < maxCon && ySpeed == 5) //intercepts player when he tries to leave game if he is already on the edge
			{
				ySpeed = 0;
			}
		}
		
		
		public function xCollisionMin(min, minCon, maxCon):void
		{
			if (x < min && y + height > minCon && y < maxCon)
			{
				x = min;
				xSpeed = 0;
				trace("xMin");
			}
			else if (x == min && y + height > minCon && y < maxCon && xSpeed == -5) //intercepts player when he tries to leave game if he is already on the edge
			{
				xSpeed = 0;
			}
		}
		
		
		public function xCollisionMax(max, minCon, maxCon):void
		{
			if (x + width > max && y + height > minCon && y < maxCon)
			{
				x = max - width;
				xSpeed = 0;
				trace("xMax");
			}
			else if (x + width == max && y + height > minCon && y < maxCon && xSpeed == 5) //intercepts player when he tries to leave game if he is already on the edge
			{
				xSpeed = 0;
			}
		}
		
	}

}