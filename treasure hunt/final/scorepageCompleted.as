package {
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	public class scorepageCompleted extends MovieClip {
		var timer,points:uint;
		var  s:Stage ;
		var sp2:startpage2;
		var sound1:won;
		var soundchannel1:SoundChannel;
		public function scorepageCompleted(stage:Stage) {
			s=stage;
			sound1=new won;
			soundchannel1=new SoundChannel;
			soundchannel1=sound1.play();
			btnmenu.addEventListener(MouseEvent.CLICK,tryit);
		}
		public function tryit(event:MouseEvent):void {
			sp2=new startpage2;
			soundchannel1.stop();
			addChild(sp2);
		}
	}
}