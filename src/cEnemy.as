package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author adam
	 */
	public class cEnemy extends Sprite
	{
		[Embed(source = "../Assets/enemy.png")] 
		private static const Enemy:Class;
		
		public function cEnemy() 
		{
			var enemyImage:Bitmap = new Enemy();
			addChild(enemyImage); //create an enemy
		}
		
	}

}