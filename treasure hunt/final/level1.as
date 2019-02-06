package {
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	public class level1 extends MovieClip {
		var timer,points:uint;
		var findobj:String;
		var t1:Timer;
		var s:Stage;
		var sp:scorepage;
		var h2:helppage2;
		var l2:level2;
		var chars:hero;
		var star:uint;
		var sound:Mysound;
		var sound1:relax;
		var soundchannel,soundchannel1:SoundChannel;
		
		public function level1(stage:Stage) {
			s=stage;

			t1=new Timer(2000);
			timer=10;
			t1.start();

			points=0;
			findobj="Ship";

			chars=new hero(stage);
			addChild(chars);
			stage.focus=chars;
			
			sound=new Mysound;
			soundchannel=new SoundChannel;
			soundchannel=sound.play();

			t1.addEventListener(TimerEvent.TIMER, countdown);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keydown);
			addEventListener(Event.ENTER_FRAME, enterframe);
						
		}
		function countdown(event:TimerEvent):void {
			timer--;
			if (timer==0) {
				t1.stop();
				timer=0;
				scorePage();
			}
		}
		public function scorePage():void {
			sp=new scorepage(s);
			soundchannel.stop();
			f1.visible=false;
			f2.visible=false;
			f3.visible=false;
			f4.visible=false;
			f5.visible=false;
			t1.removeEventListener(TimerEvent.TIMER, countdown);
			s.removeEventListener(KeyboardEvent.KEY_DOWN,keydown);
			removeEventListener(Event.ENTER_FRAME, enterframe);
				sp.s1.visible=false;
				sp.s2.visible=false;
				sp.s3.visible=false;
				sp.s4.visible=false;
				sp.s5.visible=false;
				sp.s0.visible=false;
			star=(points/95)*100;
			trace(star)
			if(star<=100 && star>=81)
			{
				sp.s1.visible=true;
				sp.s2.visible=true;
				sp.s3.visible=true;
				sp.s4.visible=true;
				sp.s5.visible=true;
			}else if(star>=61 && star<=80)
			{
				sp.s1.visible=true;
				sp.s2.visible=true;
				sp.s3.visible=true;
				sp.s4.visible=true;
			}else if(star>=41 && star<=60)
			{
				sp.s1.visible=true;
				sp.s2.visible=true;
				sp.s3.visible=true;
			}else if(star>=21 && star<=40)
			{
				sp.s1.visible=true;
				sp.s2.visible=true;
			}else if(star>=1 && star<=20)
			{
				sp.s1.visible=true;
			}else
			{
				sp.s0.visible=true;
			}
			
			removeChild(chars);
			
			addChild(sp);
		}
		public function keydown(event:KeyboardEvent):void {
			if (event.keyCode==Keyboard.ENTER) {
				//pick obj nd remove from frame
				if (findobj=="Ship"&&chars.hitTestObject(ship)) {
					t1.stop();
					points+=5;
					timer=10;
					t1.start();
					ship.visible=false;
					findobj="Map";
				} else if (findobj=="Map" && chars.body.hitTestObject(maps)) {
					t1.stop();
					points+=5;
					timer=10;
					t1.start();
					maps.visible=false;
					findobj="Pirate Hat";
				} else if (findobj=="Pirate Hat" && chars.body.hitTestObject(hat)) {
					t1.stop();
					points+=5;
					timer=10;
					t1.start();
					hat.visible=false;
					findobj="Sword";
				} else if (findobj=="Sword" && chars.body.hitTestObject(sword)) {
					t1.stop();
					points+=5;
					timer=10;
					t1.start();
					sword.visible=false;
					findobj="Watch";
				} else if (findobj=="Watch" && chars.body.hitTestObject(watchs)) {
					t1.stop();
					points+=5;
					watchs.visible=false;
					removeChild(chars);
					help();
				} else {
					hm.Meter.width-=10;
					if (hm.Meter.width==0) {
						t1.removeEventListener(TimerEvent.TIMER, countdown);
						scorePage();
					}

				}
			}
		}
		public function help():void {
			soundchannel.stop();
			sound1=new relax;
			soundchannel1=new SoundChannel;
			soundchannel1=sound1.play();
			t1.stop();
			timer=0;
			f1.visible=false;
			f2.visible=false;
			f3.visible=false;
			f4.visible=false;
			f5.visible=false;
			t1.removeEventListener(TimerEvent.TIMER, countdown);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,keydown);
			removeEventListener(Event.ENTER_FRAME, enterframe);
			h2=new helppage2  ;
			addChild(h2);
			h2.btnstart.addEventListener(MouseEvent.CLICK,nextlvl);
		}
		public function nextlvl(event:MouseEvent):void {
			removeChild(h2);
			soundchannel1.stop();
			l2=new level2(s);
			addChild(l2);
			l2.objectfind.text=findobj;
			l2.time.text=""+timer;
			l2.score.text=""+points;
			l2.hm.Meter.width=hm.Meter.width;		}
		public function enterframe(event:Event):void {

			objectfind.text=findobj;
			time.text=""+timer;
			score.text=""+points;
		}
	}
}