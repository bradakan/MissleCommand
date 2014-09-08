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
		private var _background : background;
		private var _missle : Missle;
		private var _missleArray : Array;
		private var _missleVectorArray : Array;
		private var _missleTargetArray : Array;
		private var _MissleTargetLocationArray : Array;
		private var _playerSilo1 : PlayerShootPoint;
		private var _playerSilo2 : PlayerShootPoint;
		private var _playerSilo3 : PlayerShootPoint;
		private var _city : CityTarget;
		private var _tempArrayLength : int;
		private var _playerVector : Vector2D;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			_background = new background();
			addChild(_background);
			
			_playerSilo1 = new PlayerShootPoint();
			_playerSilo1.x = 50;
			_playerSilo1.y = stage.stageHeight - 100;
			_playerVector = new Vector2D(_playerSilo1.x, _playerSilo1 .y);
			
			trace(_playerVector);
			
			_playerSilo2 = new PlayerShootPoint();
			_playerSilo2.x = stage.stageWidth / 2;
			_playerSilo2.y = _playerSilo1.y;
			
			_playerSilo3 = new PlayerShootPoint();
			_playerSilo3.x = stage.stageWidth - 50;
			_playerSilo3.y = _playerSilo1.y;
			
			addChild(_playerSilo1);
			addChild(_playerSilo2);
			addChild(_playerSilo3);
			
			_missleArray = new Array();
			for (var i : int = 0; i < 10; i++)
			{
				spawnMissle();
			}
			
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void
		{
			_tempArrayLength = _missleArray.length;
			for (var i : int = _tempArrayLength -1; i >= 0; i--)
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