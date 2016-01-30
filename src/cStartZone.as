package 
{
	/**
	 * ...
	 * @author adam
	 */
	public class cStartZone 
	{
		public function update(x,y,width,height): void 
		{
			if (cGame.mPlayer != null && cGame.mPlayer.x >= x && cGame.mPlayer.y >= y && cGame.mPlayer.x + cGame.mPlayer.width <= x + (width - x) && cGame.mPlayer.y + cGame.mPlayer.height <= y + (height - y) )
			{
				trace("in da end zone");
				
			}
		}
		
	}

}