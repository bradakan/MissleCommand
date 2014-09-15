package  
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class MissleFactory 
	{
		
		public static const ENEMY_1 : String = "enemy1";
		public static const PLAYER_MISSLE : String = "playerMissle";
		public function makeMissle(targetX:Number, targetY:Number, type:String, startX:Number, startY:Number, stageWidth : Number):MissleClass 
		{
			
			var missle : MissleClass;
			if (type == ENEMY_1)
			{
				missle = new MissleClass(targetX, targetY, Missle, Math.random() * stageWidth, -50);
			}
			else
			{
				missle = new MissleClass(targetX, targetY, PlayerMissle, startX, startY);
			}
			
			return missle;
		}
		
	}

}