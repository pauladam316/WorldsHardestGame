package 
{
	/**
	 * ...
	 * @author adam
	 */
	public class cVerticalMovement 
	{
		private var speed: int;
		
		public function cVerticalMovement(movementSpeed)
		{
				speed = movementSpeed;
		}
		
		public function update(enemy, min, max): void
		{
			if (enemy != null)
			{				
				if (enemy.y + enemy.height >= max )
				{
					speed *= -1;
					
				}
				else if (enemy.y <= min)
				{
					speed *= -1;
				}
				enemy.y += speed;
			}
		}
		
	}

}