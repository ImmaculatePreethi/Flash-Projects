package {
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	public class code extends MovieClip {
		var sp:startpage;
		var hp:helppage;
		var gp:gamepage;
		var scp:scorepage;
		var gpls2:gamepagelvl2s;
		var gpl2:gamepage1;
		var hero:player;
		var ene:boss;
		var j1:jf1;
		var j2:jf2;
		var j3:jf3;
		var j4:jf4;
		var h1:hf1;
		var h2:hf2;
		var h3:hf3;
		var h4:hf4;
		var vx:int;
		var herowidth,heroheight:int;
		var health,score,time,time2,cd:uint;
		var o:Boolean;
		var oc:uint;
		var t,t1,tls2:Timer;
		public function code() {
			sp=new startpage  ;
			hp=new helppage  ;
			gp=new gamepage  ;
			scp=new scorepage  ;
			gpls2=new gamepagelvl2s  ;
			gpl2=new gamepage1  ;
			hero=new player  ;
			ene=new boss  ;
			j1=new jf1  ;
			j2=new jf2  ;
			j3=new jf3  ;
			j4=new jf4  ;
			h1=new hf1  ;
			h2=new hf2  ;
			h3=new hf3  ;
			h4=new hf4  ;

			t=new Timer(1000);
			tls2=new Timer(500);
			init();

		}
		public function init() {
			vx=0;
			time=0;
			oc=50;
			starts();
		}
		public function starts():void {
			addChild(sp);
			sp.btnhelp.addEventListener(MouseEvent.CLICK,onclickhelp);
			sp.btnplay.addEventListener(MouseEvent.CLICK,onclickplay);
		}
		function fn(event:TimerEvent):void {
			time--;
			if (time==0) {
				t.stop();
				oc=50;
				cd=8;
				tls2.addEventListener(TimerEvent.TIMER, fn2);
				tls2.start();
				removeChild(gp);
				addChild(gpls2);
				addEventListener(Event.ENTER_FRAME,onentercountdown);
			}
		}
		public function onentercountdown(event:Event):void {
			gpls2.cdbox.text=cd.toString();
		}
		function fn2(event:TimerEvent):void {
			cd--;
			if (cd==0) {
				removeEventListener(Event.ENTER_FRAME,onentercountdown);
				level2();
			}
		}
		public function level2():void {
			o=true;
			time2=60;
			t1=new Timer(1000);
			removeChild(gpls2);
			addChild(gpl2);
			stage.focus=gpl2;
			t1.addEventListener(TimerEvent.TIMER, lvl2);
			t1.start();
			addChild(hero);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keydown);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyup);
			object();
			addEventListener(Event.ENTER_FRAME,onenter);
		}
		
		public function displayed2():void {
			gpl2.healthpt.text=String(health);
			gpl2.scorept.text=String(score);
			gpl2.timmer.text=String(time2);
		}
		public function gamecheck2():void {
			if (health<1) {
				oc=12;
				scp.msg.text="Game Over";
				scores2();
			}
		}
		function lvl2(event:TimerEvent):void {
			time2--;
			if (time2 == 0) {
				t1.stop();
				scp.msg.text="Time Over";
				scores2();
			}
		}
		public function onclickplay(event:MouseEvent):void {

			health=100;
			score=0;
			time=30;
			o=false;

			removeChild(sp);
			addChild(gp);
			stage.focus=gp;
			t.addEventListener(TimerEvent.TIMER, fn);
			t.start();

			addChild(hero);
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keydown);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyup);

			object();
			addEventListener(Event.ENTER_FRAME,onenter);
		}


		public function object():void {
			if(o==false){
				oc=Math.random()*10;
			if (oc==1||oc==0) {
				j1.y=0;
				j1.x=Math.random()*700;
			} else if (oc==2) {
				j2.y=0;
				j2.x=Math.random()*700;
			} else if (oc==3) {
				j3.y=0;
				j3.x=Math.random()*700;
			} else if (oc==4) {
				j4.y=0;
				j4.x=Math.random()*700;
			} else if (oc==9) {
				h1.y=0;
				h1.x=Math.random()*700;
			} else if (oc==6) {
				h2.y=0;
				h2.x=Math.random()*700;
			} else if (oc==7) {
				h3.y=0;
				h3.x=Math.random()*700;
			} else if (oc==8) {
				h4.y=0;
				h4.x=Math.random()*700;
			} else if (oc==5 || oc==10) {
				ene.y=0;
				ene.x=Math.random()*700;
			}
			}
			if(o==true){
				oc=Math.random()*13;
			if (oc==1||oc==0||oc==2) {
				j1.y=0;
				j1.x=Math.random()*700;
				j2.y=0;
				j2.x=Math.random()*700;
			} else if (oc==3 || oc==4) {
				j3.y=0;
				j3.x=Math.random()*700;
				j4.y=0;
				j4.x=Math.random()*700;
			} else if (oc==6 || oc==7) {
				h3.y=0;
				h3.x=Math.random()*700;
				h4.y=0;
				h4.x=Math.random()*700;
			} else if (oc==5 || oc==9) {
				ene.y=0;
				ene.x=Math.random()*700;
			} else if (oc==10 || oc==8) {
				h1.y=0;
				h1.x=Math.random()*700;
				h2.y=0;
				h2.x=Math.random()*700;

			}else if (oc==11 || oc == 12 || oc ==13) {
				j2.y=0;
				j2.x=Math.random()*700;
				h1.y=0;
				h1.x=Math.random()*700;
				h2.y=0;
				h2.x=Math.random()*700;
			}
			}
		}
		public function objectcall():void {
if(o==false){
			if (oc==1||oc==0) {
				addChild(j1);
				if (j1.y>stage.stageHeight-j1.height) {
					removeChild(j1);
					object();
				} else if (hero.hitTestObject(j1)) {
					removeChild(j1);
					object();
					health-=5;
				} else if (health<1) {
					removeChild(j1);
				} else {
					j1.y+=10;
				}
			} else if (oc==2) {
				addChild(j2);
				if (j2.y>stage.stageHeight-j2.height) {
					removeChild(j2);
					object();
				} else if (hero.hitTestObject(j2)) {
					removeChild(j2);
					object();
					health-=5;
				} else if (health<1) {
					removeChild(j2);
				} else {
					j2.y+=10;
				}
			} else if (oc==3) {
				addChild(j3);
				if (j3.y>stage.stageHeight-j3.height) {
					removeChild(j3);
					object();
				} else if (hero.hitTestObject(j3)) {
					removeChild(j3);
					object();
					health-=5;
				} else if (health<1) {
					removeChild(j3);
				} else {
					j3.y+=10;
				}
			} else if (oc==4) {
				addChild(j4);
				if (j4.y>stage.stageHeight-j4.height) {
					removeChild(j4);
					object();
				} else if (hero.hitTestObject(j4)) {
					removeChild(j4);
					object();
					health-=5;
				} else if (health<1) {
					removeChild(j4);
				} else {
					j4.y+=10;
				}
			} else if (oc==9) {
				addChild(h1);
				if (h1.y>stage.stageHeight-h1.height) {
					removeChild(h1);
					object();
				} else if (hero.hitTestObject(h1)) {
					removeChild(h1);
					object();
					score+=5;
				} else if (health<1) {
					removeChild(h1);
				} else {
					h1.y+=10;
				}
			} else if (oc==6) {
				addChild(h2);
				if (h2.y>stage.stageHeight-h2.height) {
					removeChild(h2);
					object();
				} else if (hero.hitTestObject(h2)) {
					removeChild(h2);
					object();
					score+=5;
				} else if (health<1) {
					removeChild(h2);
				} else {
					h2.y+=10;

				}
			} else if (oc==7) {
				addChild(h3);
				if (h3.y>stage.stageHeight-h3.height) {
					removeChild(h3);
					object();
				} else if (hero.hitTestObject(h3)) {
					removeChild(h3);
					object();
					score+=5;
				} else if (health<1) {
					removeChild(h3);
				} else {
					h3.y+=10;
				}
			} else if (oc==8) {
				addChild(h4);
				if (h4.y>stage.stageHeight-h4.height) {
					removeChild(h4);
					object();
				} else if (hero.hitTestObject(h4)) {
					removeChild(h4);
					object();
					score+=5;
				} else if (health<1) {
					removeChild(h4);
				} else {
					h4.y+=10;
				}
			} else if (oc==5 || oc==10) {
				addChild(ene);
				if (ene.y>stage.stageHeight-ene.height) {
					removeChild(ene);
					object();
				} else if (hero.hitTestObject(ene)) {
					removeChild(ene);
					t.stop();
					oc=12;
					scp.msg.text="Germ Monster killed you";
					scores();
				} else {
					ene.y+=10;
				}
			}
}
if(o==true)
{
	if (oc==1||oc==0||oc==2) {
				addChild(j1);
				addChild(j2);
				if (j1.y>stage.stageHeight-j1.height) {
					removeChild(j1);
					removeChild(j2);
					object();
				} else if (hero.hitTestObject(j1) || hero.hitTestObject(j2)) {
					removeChild(j1);
					removeChild(j2);
					object();
					health-=5;
				} else if (health<1) {
					removeChild(j1);
					removeChild(j2);
				} else {
					j1.y+=15;
					j2.y+=15;

				}
			} else if (oc==3 || oc==4) {
				addChild(j3);
				addChild(j4);
				if (j3.y>stage.stageHeight-j3.height) {
					removeChild(j3);
					removeChild(j4);
					object();
				} else if (hero.hitTestObject(j3) || hero.hitTestObject(j4)) {
					removeChild(j3);
					removeChild(j4);
					object();
					health-=5;
				} else if (health<1) {
					removeChild(j3);
					removeChild(j4);
				} else {
					j3.y+=15;
					j4.y+=15;
				}
			} else if (oc==7 || oc==6) {
				addChild(h3);
				addChild(h4);
				if (h3.y>stage.stageHeight-h3.height) {
					removeChild(h3);
					removeChild(h4);
					object();
				} else if (hero.hitTestObject(h3) || hero.hitTestObject(h4) ) {
					removeChild(h3);
					removeChild(h4);
					object();
					score+=5;
				} else if (health<1) {
					removeChild(h3);
					removeChild(h4);
				} else {
					h3.y+=15;
					h4.y+=15;
				}
			}  else if (oc==5 || oc==9) {
				addChild(ene);
				if (ene.y>stage.stageHeight-ene.height) {
					removeChild(ene);
					object();
				} else if (hero.hitTestObject(ene)) {
					removeChild(ene);
					t1.stop();
					oc=50;
					scp.msg.text="Germ Monster killed you";
					scores2();
				} else {
					ene.y+=17;
				}
			} else if (oc==10 || oc==8) {
				addChild(h2);
				addChild(h1);
				if (h2.y>stage.stageHeight-h2.height) {
					removeChild(h2);
					removeChild(h1);
					object();
				} else if (hero.hitTestObject(h2) || hero.hitTestObject(h1)) {
					removeChild(h2);
					removeChild(h1);
					object();
					score+=5;
				} else if (health<1) {
					removeChild(h2);
					removeChild(h1);
				} else {
					h2.y+=15;
					h1.y+=15;
				}

			}else if (oc==11 || oc==12 || oc == 13) {
				addChild(h2);
				addChild(h1);
				addChild(j2);
				if (h2.y>stage.stageHeight-h2.height) {
					removeChild(h2);
					removeChild(h1);
					removeChild(j2);
					object();
				} else if (hero.hitTestObject(h2) || hero.hitTestObject(h1)) {
					removeChild(h2);
					removeChild(h1);
					removeChild(j2);
					object();
					score+=5;
				} else if ( hero.hitTestObject(j2)) {
					removeChild(h2);
					removeChild(h1);
					removeChild(j2);
					object();
					health-=5;
				}else if (health<1) {
					removeChild(h2);
					removeChild(h1);
					removeChild(j2);
				} else {
					h2.y+=15;
					h1.y+=15;
					j2.y+=15;
				}

			}
}

		}
		public function keyup(event:KeyboardEvent):void {
			if (event.keyCode==Keyboard.LEFT||event.keyCode==Keyboard.RIGHT) {
				vx=0;
			}
		}
		public function keydown(event:KeyboardEvent):void {
			if (event.keyCode==Keyboard.LEFT) {
				vx=-10;
			} else if (event.keyCode==Keyboard.RIGHT) {
				vx=+10;
			}
		}
		public function onenter(event:Event):void {

			hero.x+=vx;
			herowidth=hero.width;
			heroheight=hero.height;
			hero.y=stage.stageHeight-heroheight;
			objectcall();
			if(o==false){
			displayed();
			gamecheck();
			}
			if(o==true)
			{
				displayed2();
			gamecheck2();
			}
			if (hero.x+herowidth>stage.stageWidth) {
				hero.x=stage.stageWidth-herowidth;
			} else if (hero.x < 0) {
				hero.x=0;
			}
		}
		public function gamecheck():void {
			if (health<1) {
				oc=12;
				stage.removeEventListener(KeyboardEvent.KEY_DOWN,keydown);
				stage.removeEventListener(KeyboardEvent.KEY_UP ,keyup);
				stage.removeEventListener(Event.ENTER_FRAME,onenter);
				scp.msg.text="Game Over";
				scores();
			}
		}
		public function displayed():void {
			gp.healthpt.text=String(health);
			gp.scorept.text=String(score);
			gp.timmer.text=String(time);
		}
		public function scores():void {
			removeChild(hero);
			removeChild(gp);
			addChild(scp);
			oc=50;
			stage.removeEventListener(Event.ENTER_FRAME,onenter);
			scp.scorept.text=String(score);
			scp.btnback.addEventListener(MouseEvent.CLICK,onclickbackscp);
		}
		public function scores2():void {
			removeChild(hero);
			removeChild(gpl2);
			stage.removeEventListener(Event.ENTER_FRAME,onenter);
			addChild(scp);
			oc=50;
			scp.scorept.text=String(score);
			scp.btnback.addEventListener(MouseEvent.CLICK,onclickbackscp);
		}
		public function onclickbackscp(event:MouseEvent):void {

			init();
		}
		public function onclickhelp(event:MouseEvent):void {
			removeChild(sp);
			addChild(hp);
			hp.btnback.addEventListener(MouseEvent.CLICK,onclickbackhp);
		}
		public function onclickbackhp(event:MouseEvent):void {
			starts();
		}
	}
}