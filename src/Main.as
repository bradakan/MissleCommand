package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.Vector2D;
	
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class Main extends Sprite 
	{
		
		private var _missle : Missle;
		private var _missleArray : Array;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			_missleArray = new Array();
			for (var i = 0; i < 10; i++)
			{
				_missle = new Missle();
				_missle.x = Math.random() * stage.stageWidth, _missle.y =  Math.random() * -50;
				_missle.rotation = 180;
				addChild(_missle);
				_missleArray.push(_missle);
				trace(i);
			}
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			trace(_missleArray.length,_missleArray[1].y);
			
			for (var i = 0; i < _missleArray.length; i++)
			{
				_missleArray[i].y += 5;
				if (_missleArray[i].y >700)
				{
					removeChild(_missleArray[i]);
					_missleArray.splice(i,1);
				}
			}
			if (_missleArray.length < 10)
			{
				spawnMissle();
			}
		}
		
		private function spawnMissle():void
		{
			_missle = new Missle();
			_missle.x = Math.random() * stage.stageWidth, _missle.y =  Math.random() * -50;
			_missle.rotation = 180;
			addChild(_missle);
			_missleArray.push(_missle);
		}
		
	}
	
}