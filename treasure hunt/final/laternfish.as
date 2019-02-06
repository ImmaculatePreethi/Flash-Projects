package {
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Stage;
	public class laternfish extends MovieClip {
		var s:Stage;
		var vx,vy:int;
		public function laternfish(/*stage:Stage*/) {
			s=stage;
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
			vy *=0.95;
			
			x += vx;
			y += vy;

			if (x>stage.stageWidth) {
				x=0;
			} else if (x  < 0) {
				x=stage.stageWidth;
			}
			if (y<0) {
				y=stage.stageHeight;
			} else if (y > stage.stageHeight) {
				y=0;
			}
		}
	}
}