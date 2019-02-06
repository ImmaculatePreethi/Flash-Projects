package {
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	public class level2 extends MovieClip {
		var timer,points,no:uint;
		var words:String;
		var t1:Timer;
		var s:Stage;
		var sh1:shark1;
		var sp:scorepage;
		var l3i:level3intro;
		var l3:level3;
		var chars:hero;
		var findobj:Array;
		var sharkobj:Array;
		var t:Timer;
		var s2:Mysound;
		var sound1:relax;
		var soundchannel,soundchannel1:SoundChannel;

		public function level2(stage:Stage) {
			s=stage;
			
			s2=new Mysound;
			soundchannel=new SoundChannel;
			soundchannel=s2.play();

			t1=new Timer(2000);
			timer=6;
			t1.start();

			//map
			map.y=250+Math.random()*450;
			map.x=300+Math.random()*1100;
			//watch
			watch.y=250+Math.random()*480;
			watch.x=200+Math.random()*800;
			//sword
			sword.y=250+Math.random()*475;
			sword.x=450+Math.random()*550;
			//hat
			hat.y=50+Math.random()*675;
			hat.x=50+Math.random()*150;
			//ship
			ship.y=Math.random()*300;
			ship.x=Math.random()*1400;


			points=25;

			chars=new hero(stage);
			addChild(chars);
			stage.focus=chars;

			t1.addEventListener(TimerEvent.TIMER, countdown);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keydown);
			addEventListener(Event.ENTER_FRAME, enterframe);

			sharkobj=new Array  ;
			addObjectToStage();

			findobj=new Array  ;
			addObjectToarray();


		}
		function addObjectToarray():void {

			findobj.push("Watch");
			findobj.push("Pirate Hat");
			findobj.push("Ship");
			findobj.push("Sword");
			no=Math.random()*findobj.length;
			words=findobj[no];

		}
		function addObjectToStage():void {
			t=new Timer(3000,1);
			t.addEventListener(TimerEvent.TIMER_COMPLETE,createYourObject);
			t.start();
		}
		function createYourObject(event:Event):void {
			var sh1:shark1;
			sh1=new shark1  ;
			sh1.y=50+Math.random()*650;
			addChild(sh1);
			sharkobj.push(sh1);
			addObjectToStage();
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
			t.stop();
			soundchannel.stop();
			t1.removeEventListener(TimerEvent.TIMER, countdown);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,keydown);
			removeEventListener(Event.ENTER_FRAME, enterframe);
			t.removeEventListener(TimerEvent.TIMER_COMPLETE,createYourObject);
			removeChild(chars);
			sp=new scorepage(s);
			var star:int;
			sp.s1.visible=false;
				sp.s2.visible=false;
				sp.s3.visible=false;
				sp.s4.visible=false;
				sp.s5.visible=false;
			sp.s0.visible=false;
			star=(points/95)*100;
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
			addChild(sp);
		}
		public function keydown(event:KeyboardEvent):void {

			if (event.keyCode==Keyboard.ENTER) {
				//pick obj nd remove from frame
				if (objectfind.text=="Watch"&&chars.body.hitTestObject(watch)) {
					t1.stop();
					points+=5;
					timer=6;
					t1.start();
					watch.visible=false;
					checks();
					findobj.splice(no,1);
					no=Math.random()*findobj.length;
					words=findobj[no];
				} else if (objectfind.text=="Pirate Hat" && chars.body.hitTestObject(hat)) {
					t1.stop();
					points+=5;
					timer=6;
					t1.start();
					hat.visible=false;
					checks();
					findobj.splice(no,1);
					no=Math.random()*findobj.length;
					words=findobj[no];
				} else if (objectfind.text=="Ship" && chars.body.hitTestObject(ship)) {
					t1.stop();
					points+=5;
					timer=6;
					t1.start();
					ship.visible=false;
					checks();
					findobj.splice(no,1);
					no=Math.random()*findobj.length;
					words=findobj[no];
				} else if (objectfind.text=="Sword" && chars.body.hitTestObject(sword)) {
					t1.stop();
					points+=5;
					timer=6;
					t1.start();
					sword.visible=false;
					checks();
					findobj.splice(no,1);
					no=Math.random()*findobj.length;
					words=findobj[no];
				} else if (objectfind.text=="Map" && chars.body.hitTestObject(map)) {
					t1.stop();
					points+=5;
					map.visible=false;
					help();
					
				} else {
					hm.Meter.width-=10;
				}
			}
		}
		public function help():void{
			t.stop();
			soundchannel.stop();
			sound1=new relax;
			soundchannel1=new SoundChannel;
			soundchannel1=sound1.play();
			t1.removeEventListener(TimerEvent.TIMER, countdown);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,keydown);
			removeEventListener(Event.ENTER_FRAME, enterframe);
			t.removeEventListener(TimerEvent.TIMER_COMPLETE,createYourObject);
			removeChild(chars);
		l3i=new level3intro;
		addChild(l3i);
		l3i.btnstart.addEventListener(MouseEvent.CLICK,nextlvl);
		}
		public function nextlvl(event:MouseEvent):void {
			l3=new level3(s);
			soundchannel1.stop();
			removeChild(l3i);
			addChild(l3);
			l3.time.text=""+timer;
			l3.score.text=""+points;
			l3.hm.Meter.width=hm.Meter.width;
		}
		public function checks():void {
			if (hm.Meter.width==0) {
				scorePage();
			}
			if (findobj.length==0) {
				words="Map";
			}
		}
		public function enterframe(event:Event):void {
			checks();
			objectfind.text=words;
			time.text=""+timer;
			score.text=""+points;



			for (var i:int = sharkobj.length - 1; i >= 0; i--) {
				sharkobj[i].x+=5;
				if (sharkobj[i].x==1700) {
					removeChild(sharkobj[i]);
					sharkobj.splice(i,1);
				} else if (sharkobj[i].hitTestObject(chars.body)) {
					removeChild(sharkobj[i]);
					sharkobj.splice(i,1);
					hm.Meter.width-=30;
				} else if (sharkobj[i].hitTestObject(chars.weap)) {
					removeChild(sharkobj[i]);
					sharkobj.splice(i,1);
				}

			}


		}
	}
}