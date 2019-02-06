package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	public class startpage2 extends MovieClip {
		var h1:helppage1;
		var h12:helppage12;
		var l1:level1;
		var s:Mysound;
		var sound:relax;
		var soundchannel,soundchannel1:SoundChannel;
		public function startpage2() {
			s=new Mysound;
			soundchannel=new SoundChannel;
			sound=new relax;
			soundchannel1=new SoundChannel;
			soundchannel=s.play();
			btnplay.addEventListener(MouseEvent.CLICK,onplay);
		}
		public function onplay(event:MouseEvent):void {
			soundchannel.stop();
			soundchannel1=sound.play();
			h1=new helppage1;
			addChild(h1);
			h1.btnnext.addEventListener(MouseEvent.CLICK,onnext);
		}
		public function onnext(event:MouseEvent):void {
			removeChild(h1);
			soundchannel1.stop();
			soundchannel1=sound.play();
			h12=new helppage12;
			addChild(h12);
			h12.btnstart.addEventListener(MouseEvent.CLICK,onstart);
		}
		public function onstart(event:MouseEvent):void {
			soundchannel1.stop();
			removeChild(h12);
			l1=new level1(stage);
			addChild(l1);
		}
	}
}
	