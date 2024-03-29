package {
	/**
	 * @author berendweij
	 */
	public class EnemyShipFactory {
		
		public static const UFO_ENEMY_SHIP : String		=	"ufoEnemyShip";
		public static const ROCKET_ENEMY_SHIP : String	=	"rocketEnemyShip";
		public static const BIGBOSS_ENEMY_SHIP : String	=	"bigBossEnemyShip";
		public static const SPEED_ENEMY_SHIP : String = "speedEnemyShip"
		
		public function makeEnemyShip( type : String ) : EnemyShip
		{
			// lokale variabele waar de het nieuwe ruimteschip in opslaan
			var enemy : EnemyShip;
			
			if(type == UFO_ENEMY_SHIP)
			{
				enemy = new UFOEnemyShip();
			}
			else if(type == ROCKET_ENEMY_SHIP)
			{
				enemy = new RocketEnemyShip();
			}
			else if (type == SPEED_ENEMY_SHIP)
			{
				enemy = new SpeedEnemy();
			}
			else
			{
				enemy = new BigBossEnemyShip();
			}
			
			// we kunnen het ruimteschip nog wat basisinstellingen meegeven
			// het voordeel dat we het hier doen is dat je het niet door je hele applicatie hebt staan
			enemy.rotation = 10;
			
			return enemy;
		}
		
	}
}
