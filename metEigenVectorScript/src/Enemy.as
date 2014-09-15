package  
{
	
	import flash.display.MovieClip;
	import utils.MathVector;
	import flash.events.Event;
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class Enemy extends MovieClip
	{
		var _target : MathVector;
		var _path : MathVector;
		var _location : MathVector;
		var _speed : Number = 5;
		var _asset : MovieClip;
		var _startX :Number;
		var _startY :Number;
		//moet er nog iets in maken om de startpositie aan te geven
		
		public function Enemy(targetX : Number, targetY : Number, AssetClass : Class, startX :Number, startY :Number) 
		{
			_asset = new AssetClass();
			_target = new MathVector(targetX, targetY);
			_startX = startX; _startY = startY;
			trace(_target.dx,_target.dy);
			addEventListener(Event.ADDED_TO_STAGE, init);		
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(_asset);
			_path = new MathVector(0,0);
			_location = new MathVector(0,0);
			this.x = _startX;
			this.y = _startY;
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