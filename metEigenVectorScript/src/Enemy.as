package  
{
	
	import utils.MathVector;
	import flash.events.Event;
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class Enemy extends Missle
	{
		var _target : MathVector;
		var _path : MathVector;
		var _location : MathVector;
		var _speed : Number = 5;
		
		public function Enemy(targetX : Number,targetY : Number) 
		{
			_target = new MathVector(targetX, targetY);
			trace(_target.dx,_target.dy);
			addEventListener(Event.ADDED_TO_STAGE, init);		
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_path = new MathVector(0,0);
			_location = new MathVector(0,0);
			this.x = Math.random() * stage.stageWidth;
			this.y = - this.height;
		}
		
		public function update()
		{
			_path.dx = _target.dx - this.x;
			_path.dy = _target.dy - this.y;
			this.x += _path.nx * _speed;
			this.y += _path.ny * _speed;
			_location.dx = this.x;
			_location.dy = this.y;
		}
		
	}

}