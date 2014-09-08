package  
{
	
	import utils.MathVector;
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class Turret extends PlayerShootPoint
	{
		var _location : MathVector;
		
		public function Turret(x:Number,y:Number) 
		{
			this.x = x;
			this.y = y;
			_location = new MathVector(this.x, this.y);
		}
		
	}

}