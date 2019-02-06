package {
	import flash.events.Event;
	import flash.display.MovieClip;
	public class fish2 extends MovieClip {		
		var vx,vy:int;
		public function fish2() {
			addEventListener(Event.ADDED_TO_STAGE, onstart);
		}
		public function onstart(event:Event):void {
			vx=0;
			vy=0;

			addEventListener(Event.ENTER_FRAME, enterframe);
			addEventListener(Event.REMOVED_FROM_STAGE, overstage);
		}
		public function overstage(event:Event):void {
			removeEventListener(Event.ENTER_FRAME, enterframe);
			removeEventListener(Event.ADDED_TO_STAGE, onstart);
			removeEventListener(Event.REMOVED_FROM_STAGE, overstage);
		}
		public function enterframe(event:Event):void {
			
			vy += (Math.random ()* -0.15)*15;
			vx += (Math.random ()* -0.15)*15;
			
			
			vx *=0.55;
			vy *=0.75;
			
			x += vx;
			y += vy;
			if (x>stage.stageWidth+150) {
				x=0;
			} else if (x  < 0) {
				x=stage.stageWidth;
			}
			if (y<0) {
				y=stage.stageHeight-75;
			} else if (y > stage.stageHeight+150) {
				y=0;
			}
		}
	}
}