package {
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	public class level3 extends MovieClip {
		var timer,points,no:uint;
		var words:String;
		var t1:Timer;
		var s:Stage;
		var spC:scorepageCompleted;
		var sp:scorepage;
		var chars:hero;
		var findobj:Array;
		var t:Timer;
		var s3:Mysound;
		var soundchannel:SoundChannel;

		public function level3(stage:Stage) {
			s=stage;
			
			t1=new Timer(2000);
			timer=10;
			t1.start();
			
			s3=new Mysound;
			soundchannel=new SoundChannel;
			soundchannel=s3.play();

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
			
			oyster.y=300+Math.random()*300;
			oyster.x=1100+Math.random()*200;
			
			shuttle.y=100+Math.random()*100;
			shuttle.x=Math.random()*1300;


			points=50;

			chars=new hero(stage);
			addChild(chars);
			stage.focus=chars;
			
			

			t1.addEventListener(TimerEvent.TIMER, countdown);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keydown);
			addEventListener(Event.ENTER_FRAME, enterframe);


			findobj=new Array ;
			addObjectToarray();


		}
		function addObjectToarray():void {

			findobj.push("Watch");
			findobj.push("Pirate Hat");
			findobj.push("Ship");
			findobj.push("Sword");
			findobj.push("Oyster");
			findobj.push("Space Shuttle");
			findobj.push("egyptian statue");
			findobj.push("Telescope");
			no=Math.random()*findobj.length;
			words=findobj[no];

		}
		
		
		function countdown(event:TimerEvent):void {
			timer--;
			if (timer==0) {
				timer=0;
				scorePage();
			}
		}
		public function scorePage() {
			soundchannel.stop();
			
			var star:int;
			f1.visible=false;
			f4.visible=false;
			f2.visible=false;
			f3.visible=false;
			f5.visible=false;
			f6.visible=false;
			l1.visible=false;
			l2.visible=false;
			l3.visible=false;
			if(star==100)
			{
				spC=new scorepageCompleted(s);
				spC.s1.visible=false;
				spC.s2.visible=false;
				spC.s3.visible=false;
				spC.s4.visible=false;
				spC.s5.visible=false;
				spC.s0.visible=false;
			star=(points/95)*100;
			if(star<=100 && star>=81)
			{
				spC.s1.visible=true;
				spC.s2.visible=true;
				spC.s3.visible=true;
				spC.s4.visible=true;
				spC.s5.visible=true;
			}else if(star>=61 && star<=80)
			{
				spC.s1.visible=true;
				spC.s2.visible=true;
				spC.s3.visible=true;
				spC.s4.visible=true;
			}else if(star>=41 && star<=60)
			{
				spC.s1.visible=true;
				spC.s2.visible=true;
				spC.s3.visible=true;
			}else if(star>=21 && star<=40)
			{
				spC.s1.visible=true;
				spC.s2.visible=true;
			}else if(star>=1 && star<=20)
			{
				spC.s1.visible=true;
			}else
			{
				spC.s0.visible=true;
			}
			addChild(spC);
			}else if(star!=100)
			{
				sp=new scorepage(s);
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
			t1.stop();
			t1.removeEventListener(TimerEvent.TIMER, countdown);
			removeChild(chars);			
			stage.removeEventListener(KeyboardEvent.KEY_DOWN,keydown);
			removeEventListener(Event.ENTER_FRAME, enterframe);
		}
		public function keydown(event:KeyboardEvent):void {

			if (event.keyCode==Keyboard.ENTER) {
				//pick obj nd remove from frame
				if (objectfind.text=="Watch"&&chars.body.hitTestObject(watch)) {
					t1.stop();
					points+=5;
					timer=10;
					t1.start();
					watch.visible=false;
					checks();
					findobj.splice(no,1);
					no=Math.random()*findobj.length;
					words=findobj[no];
				} else if (objectfind.text=="Telescope" && chars.body.hitTestObject(telescope)) {
					t1.stop();
					points+=5;
					timer=10;
					t1.start();
					telescope.visible=false;
					checks();
					findobj.splice(no,1);
					no=Math.random()*findobj.length;
					words=findobj[no];
				}else if (objectfind.text=="egyptian statue" && chars.body.hitTestObject(egyptian)) {
					t1.stop();
					points+=5;
					timer=10;
					t1.start();
					egyptian.visible=false;
					checks();
					findobj.splice(no,1);
					no=Math.random()*findobj.length;
					words=findobj[no];
				}else if (objectfind.text=="Space Shuttle" && chars.body.hitTestObject(shuttle)) {
					t1.stop();
					points+=5;
					timer=10;
					t1.start();
					shuttle.visible=false;
					checks();
					findobj.splice(no,1);
					no=Math.random()*findobj.length;
					words=findobj[no];
				}else if (objectfind.text=="Pirate Hat" && chars.body.hitTestObject(hat)) {
					t1.stop();
					points+=5;
					timer=10;
					t1.start();
					hat.visible=false;
					checks();
					findobj.splice(no,1);
					no=Math.random()*findobj.length;
					words=findobj[no];
				} else if (objectfind.text=="Oyster" && chars.body.hitTestObject(oyster)) {
					t1.stop();
					points+=5;
					timer=10;
					t1.start();
					oyster.visible=false;
					checks();
					findobj.splice(no,1);
					no=Math.random()*findobj.length;
					words=findobj[no];
				}else if (objectfind.text=="Ship" && chars.body.hitTestObject(ship)) {
					t1.stop();
					points+=5;
					timer=10;
					t1.start();
					ship.visible=false;
					checks();
					findobj.splice(no,1);
					no=Math.random()*findobj.length;
					words=findobj[no];
				} else if (objectfind.text=="Sword" && chars.body.hitTestObject(sword)) {
					t1.stop();
					points+=5;
					timer=10;
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
					scorePage();
				} else {
					hm.Meter.width-=10;
				}
			}
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
			
			if(chars.body.hitTestObject(l1))
			{
				l1.x=0;
				hm.Meter.width-=30;
			}else if (l1.hitTestObject(chars.weap)){
				l1.x=0;
			}
			if(chars.body.hitTestObject(l2))
			{
				l2.x=0;
				hm.Meter.width-=30;
			}else if (l2.hitTestObject(chars.weap)){
				l2.x=0;
			}
			if(chars.body.hitTestObject(l3))
			{
				l3.x=0;
				hm.Meter.width-=30;
			}else if (l3.hitTestObject(chars.weap)){
				l3.x=0;
			}
		}
	}
}