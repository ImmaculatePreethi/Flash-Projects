package {
	import flash.events.Event;
	import flash.display.MovieClip;
	public class fish2group extends MovieClip {		
		var vx,vy:int;
		public function fish2group() {
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
			
			this.x += vx;
			y += vy;
			if (this.x>stage.stageWidth+500) {
				x=0;
			} else if (this.x  < 0) {
				this.x=stage.stageWidth;
			}
			if (this.y<0) {
				this.y=stage.stageHeight-400;
			} else if (this.y > stage.stageHeight+400) {
				y=0;
			}
		}
	}
}