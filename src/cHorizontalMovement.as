package 
{
	/**
	 * ...
	 * @author adam
	 */
	public class cHorizontalMovement 
	{
		
		private var speed: int;
		
		public function cHorizontalMovement(movementSpeed)
		{
				speed = movementSpeed; //the speed of the movement
		}
		
		public function update(enemy, min, max): void
		{
			if (enemy != null) //make sure enemy exists first
			{				
				if (enemy.x + enemy.width >= max ) //if the enemy has reached its maximum x
				{
					speed *= -1; //swap directions
					
				}
				else if (enemy.x <= min) //if the enemy has reached the minimum x
				{
					speed *= -1;
				}
				enemy.x += speed; //add the speed to the enemy
			}
		}
		
	}

}