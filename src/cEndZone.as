package 
{
	/**
	 * ...
	 * @author adam
	 */
	public class cEndZone 
	{
		public function update(x,y,width,height): Boolean 
		{
			//if the player intersects the end zone
			if (cGame.mPlayer != null && cGame.mPlayer.x >= x && cGame.mPlayer.y >= y && cGame.mPlayer.x + cGame.mPlayer.width <= x + (width - x) && cGame.mPlayer.y + cGame.mPlayer.height <= y + (height - y) )
			{
				return true;				
			}
			else {
				return false;
			}
		}
		
	}

}