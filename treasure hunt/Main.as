package {
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.MovieClip;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	public class Main extends MovieClip {
		var sp1:startpage1;
		var sp2:startpage2;
		var timer:uint;
		var t,t1:Timer;
		var s:Mysound;
		var soundchannel:SoundChannel;
		public function Main() {
			init();	
		}
		public function init():void {
			s=new Mysound;
			soundchannel=new SoundChannel;
			soundchannel=s.play();
			t=new Timer(1000);
			timer=8;
			sp1=new startpage1  ;
			addChild(sp1);
			t.start();
			t.addEventListener(TimerEvent.TIMER, scene_change);
		}
		function scene_change(event:TimerEvent):void {
			timer--;
			if (timer==0) {
				t.stop();
				timer=0;
				t.removeEventListener(TimerEvent.TIMER, scene_change);
				menu();
			}
		}
		public function menu ():void{
			sp2=new startpage2  ;
				removeChild(sp1);
				soundchannel.stop();
				addChild(sp2);
				stage.focus=sp2;
		}
	}
}