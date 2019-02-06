package {
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	public class scorepage extends MovieClip {
		var timer,points:uint;
		var  s:Stage ;
		var l1:level1;
		var sound:losing;
		var soundchannel1:SoundChannel;
		public function scorepage(stage:Stage) {
			s=stage;
			sound=new losing;
			soundchannel1=new SoundChannel;
			soundchannel1=sound.play();
			btnplayagain.addEventListener(MouseEvent.CLICK,tryit);
		}
		public function tryit(event:MouseEvent):void {
			soundchannel1.stop();
			l1=new level1(s);
			addChild(l1);
		}
	}
}