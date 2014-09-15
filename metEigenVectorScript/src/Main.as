package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.MathVector;
	
	/**
	 * ...
	 * @author Rocky Tempelaars
	 */
	public class Main extends Sprite 
	{
		var playerArray : Array;
		var missleArray : Array;
		var targetArray : Array;
		var missle : Enemy;
		var turret : Turret;
		var city : Target;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			missleArray = new Array;
			targetArray = new Array;
			
			playerArray = [turret = new Turret(50, stage.stageHeight -100),turret = new Turret(stage.stageWidth / 2, stage.stageHeight - 100),turret = new Turret(stage.stageWidth - 50, stage.stageHeight - 100)];
			for (var i : uint = 0; i < playerArray.length; i++ )
			{
				addChild(playerArray[i]);
				targetArray.push(playerArray[i]);
			}
			
			for (var i : uint = 0; i < 10; i++ )
			{
				var targetNumber : Number = Math.floor(Math.random() * targetArray.length);
				missle = new Enemy(targetArray[targetNumber].x, targetArray[targetNumber].y, Missle, Math.random() * stage.stageWidth, -50);
				missleArray.push(missle);
				addChild(missle);
			}
			
			
			
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		
		private function loop(e:Event):void
		{
			//trace("loop works");
			for (var i = 0; i < missleArray.length; i++ )
			{
				missleArray[i].update();
				
			}
			
		}
	}
	
}