package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.display.Stage;
	public class hero extends MovieClip {
		private var _vx,_vy,_ax,_ay,_SL:int;
		private var _playerHalfWidth,_playerHalfHeight:int;
		private var _direction:Boolean;
		var s:Stage;
		public function hero(stage:Stage ) {
			s=stage;
			addEventListener(Event.ADDED_TO_STAGE, onstart);
		}
		private function onstart(event:Event):void {
			_vx=0;
			_vy=0;

			_ax=0;
			_ay=0;
			_SL=5;

			x=0;
			y=500;
			

			_playerHalfWidth=width/2;
			_playerHalfHeight=height/2;

			gotoAndStop("charRight");

			stage.addEventListener(KeyboardEvent.KEY_DOWN,keydown);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyup);
			addEventListener(Event.ENTER_FRAME, enterframe);
			addEventListener(Event.REMOVED_FROM_STAGE, overstage);
		}
		private function overstage(event:Event):void {
			removeEventListener(Event.ENTER_FRAME, enterframe);
			removeEventListener(Event.ADDED_TO_STAGE, onstart);
			removeEventListener(Event.REMOVED_FROM_STAGE, overstage);
		}
		private function keydown(event:KeyboardEvent):void {
			if (event.keyCode==Keyboard.LEFT) {
				_ax=-1;
				_direction=true;
				gotoAndStop("charLeft");
			} else if (event.keyCode == Keyboard.RIGHT) {
				_ax=1;
				_direction=false;
				gotoAndStop("charRight");
			}

			if (event.keyCode==Keyboard.UP) {
				_ay=-1;
			} else if (event.keyCode == Keyboard.DOWN) {
				_ay=1;
			}
			if (event.keyCode==Keyboard.SPACE) {
				if (_direction==true) {
					gotoAndStop("charLeftW");
				} else {
					gotoAndStop("charRightW");
				}
			}

		}
		private function keyup(event:KeyboardEvent):void {
			if (event.keyCode==Keyboard.LEFT||event.keyCode==Keyboard.RIGHT) {
				_ax=0;
				_vx=0;
			}
			if (event.keyCode==Keyboard.DOWN||event.keyCode==Keyboard.UP) {
				_ay=0;
				_vy=0;
			}
		}
		public function enterframe(event:Event):void {
			_vx+=_ax;
			_vy+=_ay;


			x+=_vx;
			y+=_vy;

			if (x+_playerHalfWidth>stage.stageWidth) {
				x=stage.stageWidth-_playerHalfWidth;
			} else if (x - _playerHalfWidth < 0) {
				x=0+_playerHalfWidth;
			}
			if (y-_playerHalfHeight<0) {
				y=0+_playerHalfHeight;
			} else if (y + _playerHalfHeight > stage.stageHeight) {
				y=stage.stageHeight-_playerHalfHeight;
			}
		}
	}
}