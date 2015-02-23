import "dart:html" as h;class QF{static const  RF="Chrome";static const  SF="Safari";final  wE;final  minimumVersion;const QF(this.wE,[this.minimumVersion]);}class TF{const TF();}class UF{final  name;const UF(this.name);}class VF{const VF();}class WF{const WF();}class MC{var k;var backgroundImage;MC(this.k){backgroundImage=new h.Element.tag('img');backgroundImage.src="images/game-field.jpg";}v(){k.m.drawImage(backgroundImage,0,0);}}class RB{var k;var x;var y;var sB;var ZF;var speed;var direction;var o;RB( g, j, i, s){this.k=g;this.sB=j;this.x=j*g.QB;this.y=i;speed=1;o=new h.Element.tag('img');switch (s){case 0:o.src="images/car1-down.png";direction=1;break;case 1:o.src="images/car1a-down.png";direction=1;break;case 2:o.src="images/car1-up.png";direction=-1;break;case 3:o.src="images/car1a-up.png";direction=-1;break;case 4:o.src="images/truck2-up.png";direction=-1;break;case 5:o.src="images/truck2-down.png";direction=1;break;case 6:o.src="images/log2.png";direction=1;break;case 7:o.src="images/log3.png";direction=-1;break;case 8:o.src="images/log4.png";direction=1;break;}ZF=(g.FB*i)-o.height;}v(){var g=k.QB;var i=k.FB;k.m.drawImage(o,x,ZF);}update( g){ZF=ZF+(speed*direction);if(direction>0){if(ZF>k.height+o.height){ZF=0-o.height;}}else{if(ZF<(o.height*-1)){ZF=k.height+o.height;}}var aF=(ZF/k.FB);if(k.CB.x==sB){if(aF>1.0&&aF<2.0){k.CB.BF();}}}}class KC{var k;var x;var y;var splat;var CC;var JF;var PB;var ZB;var aB;var AC;var BC;KC(this.k){x=0;y=2*k.FB;splat=false;PB=0;ZB=new h.Element.tag('img');ZB.src="images/frogger.png";aB=new h.Element.tag('img');aB.src="images/frogger-splat.png";AC=h.query("#audioJump");BC=h.query("#audioDead");}v(){var g=k.QB;var i=k.FB;if(splat){k.m.drawImage(aB,CC*g,i*2);}else{k.m.drawImage(ZB,x*g,i*2);}}zB(){if(splat)return;x++ ;if(x>=k.JB){x=0;k.rB(1);}AC.play();}BF(){CC=x;JF=y;x=0;splat=true;k.rB(-1);BC.play();}update( g){if(splat){PB++ ;if(PB>100){PB=0;splat=false;}}}}class DB{var canvas;var height;var width;var FB;var QB;var JB=9;var rows=5;var xB=0;var m;var background;var CB;var t;var DC;DB(this.canvas){m=canvas.getContext('2d');height=canvas.height;width=canvas.width;QB=width~/JB;FB=height~/rows;print("canvas.height = ${height}");print("cavnas.width = ${width}");DC=new LC(this,width,height);background=new MC(this);CB=new KC(this);t=new List<RB>();t.add(new RB(this,3,0,0));t.add(new RB(this,4,2,2));t.add(new RB(this,4,4,3));t.add(new RB(this,1,0,4));t.add(new RB(this,6,0,6));t.add(new RB(this,6,2,6));t.add(new RB(this,7,2,7));}AF(){}v(){NC(m,width,height);DC.v();background.v();CB.v();t.forEach(( g)=>g.v());xE();}update( g){CB.update(g);t.forEach(( i)=>i.update(g));}rB( g){xB+= g;}xE(){m.font='16pt Calibri';m.strokeText(xB.toString(),10,25);}}class LC{var k;var m;var JB=9;var rows=5;var height;var width;var fB;var bB;LC(this.k,this.width,this.height){fB=(width/JB).toInt();bB=(height/rows).toInt();print("heightSpacing = ${bB}");print("widthSpacing = ${fB}");m=k.m;}v(){for(int g=0;g<rows;g++ ){uB(0,g*bB,width,0);}for(int i=0;i<JB;i++ ){uB(i*fB,0,0,height);}} uB(i,g,j,s){m.lineWidth=1;m.lineCap="round";m.strokeStyle="white";m.beginPath();m.moveTo(i,g);m.lineTo(i+j,g+s);m.stroke();m.closePath();}}var SB;NC( i, g, j)=>i.clearRect(0,0,g,j); main(){SB=h.query("#canvas");var i=new DB(SB);var s=false;var j=false;var GB=0.0;h.document.onKeyDown.listen((BB){BB.preventDefault();if(BB.keyCode==32){i.CB.zB();}});var g=new WB(SB);g.eB=(( g){if(s==false){var LB=g.OB-GB;if(LB>1.0){s=true;}}i.update(g);});g.dB=((g){i.v();});i.AF();g.start();h.window.onDeviceMotion.listen(( MB){var HB=MB.accelerationIncludingGravity.z;if(HB>=3.0&&j==false&&s==true){j=true;GB=g.OB;i.CB.zB();}else if(HB<0.0&&j==true){j=false;}});}typedef  OC( event, repeat);abstract class jB{ get x; get y; get dx; get dy; get time; get n;}typedef  PC( gameLoop);abstract class q{var KB=0.015;var cB=0.03; get n; get OB; get yE=>KB;static  UB(g)=>g/1000.0; get time=>UB(new DateTime.now().millisecondsSinceEpoch);q(){} GF(){var bF=cF.length;for(int g=0;g<bF;g++ ){cF[g].dF(yE);}for(int g=cF.length-1;g>=0;g-- ){var i=cF.length-1;if(cF[g].eF){if(g!=i){cF[g]=cF[i];}cF.removeLast();}}} start();final  cF=new List<QC>();var eB;}class QC{}class kB{final  IB;var vB=0;var wB=0;var KF=0.0;var LF=0.0;kB(this.IB); get EB=>vB>wB;}class RC{}class TB{final  EB;final  n;final  IB;final  time;TB(this.IB,this.EB,this.n,this.time); toString()=>'Button: ${IB} DOWN: ${EB} [${n}@${time}]';}class VB{final  l;final  buttons=new Map<int,kB>();var yB;VB(this.l, i){for(int g in i){buttons[g]=new kB(g);}} tB( i){var g=buttons[i.IB];if(g==null){return;}if(yB!=null){if(yB(i,g.EB)==false){return;}}if(i.EB){if(g.EB==false){g.vB=i.n;g.KF=i.time;}}else{g.wB=i.n;g.LF=i.time;}}}class SC{final  x;final  y;final  dx;final  dy;final  XB;final  YB;final  time;final  gB;final  n;SC(this.x,this.y,this.dx,this.dy,this.XB,this.YB,this.gB,this.time,this.n);}class TC{final  l;TC(this.l){l.element.onClick.listen(fF);h.document.onPointerLockChange.listen(gF);} HF(){l.element.requestPointerLock();} fF( g){if(CF){HF();}}var CF=true; get DF=>h.document.XF==l.element; gF( g){if(l.onPointerLockChange!=null){l.onPointerLockChange(l);}}}class AB{static const lB=0x1;static const mB=0x2;static const nB=0x3;final  event;final  type;AB(this.event,this.type);}class UC{final  l;var buttons;var YF;UC(this.l){}}typedef  VC( gameLoop);class WC extends VB{static const YC=h.KeyCode.A;static const ZC=h.KeyCode.B;static const bC=h.KeyCode.C;static const cC=h.KeyCode.D;static const dC=h.KeyCode.E;static const eC=h.KeyCode.F;static const gC=h.KeyCode.G;static const hC=h.KeyCode.H;static const jC=h.KeyCode.I;static const lC=h.KeyCode.J;static const nC=h.KeyCode.K;static const pC=h.KeyCode.L;static const rC=h.KeyCode.M;static const sC=h.KeyCode.N;static const tC=h.KeyCode.O;static const uC=h.KeyCode.P;static const vC=h.KeyCode.Q;static const wC=h.KeyCode.R;static const xC=h.KeyCode.S;static const yC=h.KeyCode.T;static const zC=h.KeyCode.U;static const AD=h.KeyCode.V;static const BD=h.KeyCode.W;static const CD=h.KeyCode.X;static const DD=h.KeyCode.Y;static const ED=h.KeyCode.Z;static const FD=h.KeyCode.SHIFT;static const GD=h.KeyCode.CTRL;static const HD=h.KeyCode.ALT;static const ID=h.KeyCode.SPACE;static const JD=h.KeyCode.ZERO;static const KD=h.KeyCode.ONE;static const LD=h.KeyCode.TWO;static const MD=h.KeyCode.THREE;static const ND=h.KeyCode.FOUR;static const OD=h.KeyCode.FIVE;static const PD=h.KeyCode.SIX;static const QD=h.KeyCode.SEVEN;static const RD=h.KeyCode.EIGHT;static const SD=h.KeyCode.NINE;static const TD=h.KeyCode.ENTER;static const UD=h.KeyCode.UP;static const VD=h.KeyCode.DOWN;static const iC=h.KeyCode.LEFT;static const mC=h.KeyCode.RIGHT;static const WD=h.KeyCode.ESC;static const XD=h.KeyCode.APOSTROPHE;static const YD=h.KeyCode.BACKSLASH;static const ZD=h.KeyCode.BACKSPACE;static const aD=h.KeyCode.CAPS_LOCK;static const bD=h.KeyCode.CLOSE_SQUARE_BRACKET;static const cD=h.KeyCode.COMMA;static const dD=h.KeyCode.CONTEXT_MENU;static const eD=h.KeyCode.DASH;static const fD=h.KeyCode.DELETE;static const gD=h.KeyCode.END;static const hD=h.KeyCode.EQUALS;static const iD=h.KeyCode.F1;static const jD=h.KeyCode.F2;static const kD=h.KeyCode.F3;static const lD=h.KeyCode.F4;static const mD=h.KeyCode.F5;static const nD=h.KeyCode.F6;static const oD=h.KeyCode.F7;static const pD=h.KeyCode.F8;static const qD=h.KeyCode.F9;static const rD=h.KeyCode.F10;static const sD=h.KeyCode.F11;static const tD=h.KeyCode.F12;static const uD=h.KeyCode.FF_EQUALS;static const vD=h.KeyCode.FF_SEMICOLON;static const wD=h.KeyCode.FIRST_MEDIA_KEY;static const xD=h.KeyCode.HOME;static const yD=h.KeyCode.INSERT;static const zD=h.KeyCode.LAST_MEDIA_KEY;static const AE=h.KeyCode.MAC_ENTER;static const BE=h.KeyCode.MAC_FF_META;static const CE=h.KeyCode.META;static const DE=h.KeyCode.NUM_CENTER;static const EE=h.KeyCode.NUM_DELETE;static const FE=h.KeyCode.NUM_DIVISION;static const GE=h.KeyCode.NUM_EAST;static const HE=h.KeyCode.NUM_EIGHT;static const IE=h.KeyCode.NUM_FIVE;static const JE=h.KeyCode.NUM_FOUR;static const KE=h.KeyCode.NUM_INSERT;static const LE=h.KeyCode.NUM_MINUS;static const ME=h.KeyCode.NUM_MULTIPLY;static const NE=h.KeyCode.NUM_NINE;static const OE=h.KeyCode.NUM_NORTH;static const PE=h.KeyCode.NUM_NORTH_EAST;static const QE=h.KeyCode.NUM_NORTH_WEST;static const RE=h.KeyCode.NUM_ONE;static const SE=h.KeyCode.NUM_PERIOD;static const TE=h.KeyCode.NUM_PLUS;static const UE=h.KeyCode.NUM_SEVEN;static const VE=h.KeyCode.NUM_SIX;static const WE=h.KeyCode.NUM_SOUTH;static const XE=h.KeyCode.NUM_SOUTH_EAST;static const YE=h.KeyCode.NUM_SOUTH_WEST;static const ZE=h.KeyCode.NUM_THREE;static const aE=h.KeyCode.NUM_TWO;static const bE=h.KeyCode.NUM_WEST;static const cE=h.KeyCode.NUM_ZERO;static const dE=h.KeyCode.NUMLOCK;static const eE=h.KeyCode.OPEN_SQUARE_BRACKET;static const fE=h.KeyCode.PAGE_UP;static const gE=h.KeyCode.PAGE_DOWN;static const hE=h.KeyCode.PAUSE;static const iE=h.KeyCode.PERIOD;static const jE=h.KeyCode.PRINT_SCREEN;static const kE=h.KeyCode.QUESTION_MARK;static const lE=h.KeyCode.SCROLL_LOCK;static const mE=h.KeyCode.SEMICOLON;static const nE=h.KeyCode.SINGLE_QUOTE;static const oE=h.KeyCode.SLASH;static const pE=h.KeyCode.TAB;static const qE=h.KeyCode.TILDE;static const rE=h.KeyCode.WIN_IME;static const sE=h.KeyCode.WIN_KEY;static const tE=h.KeyCode.WIN_KEY_FF_LINUX;static const uE=h.KeyCode.WIN_KEY_LEFT;static const vE=h.KeyCode.WIN_KEY_RIGHT;static final  oC=[YC,ZC,bC,cC,dC,eC,gC,hC,jC,lC,nC,pC,rC,sC,tC,uC,vC,wC,xC,yC,zC,AD,BD,CD,DD,ED,FD,GD,HD,ID,JD,KD,LD,MD,ND,OD,PD,QD,RD,SD,TD,UD,VD,iC,mC,WD,XD,YD,ZD,aD,bD,cD,dD,eD,fD,gD,hD,iD,jD,kD,lD,mD,nD,oD,pD,qD,rD,sD,tD,uD,vD,wD,xD,yD,zD,AE,BE,CE,DE,EE,FE,GE,HE,IE,JE,KE,LE,ME,NE,OE,PE,QE,RE,SE,TE,UE,VE,WE,XE,YE,ZE,aE,bE,cE,dE,eE,fE,gE,hE,iE,jE,kE,lE,mE,nE,oE,pE,qE,rE,sE,tE,uE,vE];WC(g):super(g,oC);}typedef  XC( gameLoop);class oB implements jB{final  x;final  y;final  dx;final  dy;final  time;final  n;oB(this.x,this.y,this.dx,this.dy,this.time,this.n);}typedef  aC( gameLoop);typedef  fC( gameLoop);class pB extends VB implements jB{static const iC=0;static const kC=1;static const mC=2;static final  oC=[iC,kC,mC];var jF=0; get dx=>jF;var nF=0; get dy=>nF;var rF=0; get x=>rF;var sF=0; get y=>sF;var tF=0; get XB=>tF;var wF=0; get YB=>wF;var xF=0;var AG=0;var BG=false; get gB=>BG;var DG=0.0; get time=>DG;var HG=0; get n=>HG;pB(g):super(g,oC); zE( g){rF=g.x;sF=g.y;DG=g.time;HG=g.n;jF+= g.dx;nF+= g.dy;tF=g.XB;wF=g.YB;BG=g.gB;} NG( i, g){xF+= i;AG+= g;} OG(){xF=0;AG=0;jF=0;nF=0;}}typedef  qB( gameLoop, touch);class NB{final  id;final  FF=new List<oB>();NB(this.id);}class WB extends q{final  element;var hF=0;var iF=false;var kF=false;var lF;var mF=0.0;var oF=false;var pF=0.0; get n=>hF;var cB=0.03;var uF=0.0; get width=>element.client.width; get height=>element.client.height;var yF=0.0; get OB=>yF;var zF=0.0;var IF=0.05;var CG;var FG;var IG; get EF=>IG;var JG;var KG=new h.Point(0,0);var LG;WB(this.element):super(){FG=new WC(this);IG=new pB(this);JG=new UC(this);CG=new TC(this);LG=new qC(this);} PG(){QG();SG();TG();} QG(){for(h.KeyboardEvent g in UG){var i;var BB=g.type=="keydown";var s=q.UB(g.timeStamp);var j=g.keyCode;i=new TB(j,BB,n,s);FG.tB(i);}UG.clear();} SG(){EF.OG();final EC=h.document.documentElement;final FC=element.getBoundingClientRect();var BB=(FC.left+h.window.pageXOffset-EC.clientLeft).floor();var HB=(FC.top+h.window.pageYOffset-EC.clientTop).floor();for(h.MouseEvent g in VG){var MF=g.type=='mousemove';var NF=g.type=='mousewheel';var OF=g.type=='mousedown';var GC=q.UB(g.timeStamp);if(MF){var hB=g.page.x;var GB=g.page.y;var HC=hB-BB;var IC=GB-HB;var s=0;var i=0;var j=false;if(hB<BB){s=0;}else if(hB>BB+width){s=width;}else{s=HC;j=true;}if(GB<HB){i=0;j=false;}else if(GB>HB+height){i=height;j=false;}else{i=IC;}var MB,LB;if(CG.DF){MB=g.movement.x;LB=g.movement.y;}else{MB=g.client.x-KG.x;LB=g.client.y-KG.y;KG=g.client;}KG=g.client;var iB=new SC(HC,IC,MB,LB,s,i,j,GC,n);IG.zE(iB);}else if(NF){var JC=g as h.WheelEvent;IG.NG(JC.deltaX,JC.deltaY);}else{var PF=g.button;var iB=new TB(PF,OF,n,GC);IG.tB(iB);}}VG.clear();} TG(){for(AB g in WG){switch (g.type){case AB.nB:LG.vF(g.event);break;case AB.mB:LG.GG(g.event);break;case AB.lB:LG.MG(g.event);break;default:throw new StateError('Invalid _GameLoopTouchEven type.');}}WG.clear();}var XG; YG( ZG){if(lF==null){mF=time;lF=mF;PG();XG=h.window.requestAnimationFrame(YG);return;}if(kF==true){XG=null;return;}XG=h.window.requestAnimationFrame(YG);hF++ ;lF=mF;mF=time;var g=mF-lF;uF+= g;if(uF>cB){uF=cB;}PG();while (uF>=KB){GF();yF+= KB;if(eB!=null){eB(this);}uF-= KB;}if(oF==true&&onResize!=null&&pF<=mF){onResize(this);pF=mF+IF;oF=false;}if(dB!=null){zF=uF/KB;dB(this);}} aG( ZG){if(onFullscreenChange==null){return;}onFullscreenChange(this);} bG( ZG){if(onFullscreenChange==null){return;}onFullscreenChange(this);}final  WG=new List<AB>(); cG( g){WG.add(new AB(g,AB.nB));g.preventDefault();} dG( g){WG.add(new AB(g,AB.lB));g.preventDefault();} eG( g){WG.add(new AB(g,AB.mB));g.preventDefault();}final  UG=new List<h.KeyboardEvent>(); fG( g){UG.add(g);} gG( g){UG.add(g);}final  VG=new List<h.MouseEvent>(); hG( g){VG.add(g);} iG( g){VG.add(g);} jG( g){VG.add(g);} kG( g){VG.add(g);g.preventDefault();} lG( ZG){if(oF==false){oF=true;}} start(){if(iF==false){h.document.onFullscreenError.listen(bG);h.document.onFullscreenChange.listen(aG);element.onTouchStart.listen(cG);element.onTouchEnd.listen(eG);element.onTouchCancel.listen(eG);element.onTouchMove.listen(dG);h.window.onKeyDown.listen(fG);h.window.onKeyUp.listen(gG);h.window.onResize.listen(lG);element.onMouseMove.listen(jG);element.onMouseDown.listen(hG);element.onMouseUp.listen(iG);element.onMouseWheel.listen(kG);iF=true;}kF=false;XG=h.window.requestAnimationFrame(YG);}var dB;var onResize;var onFullscreenChange;var onPointerLockChange;var onTouchStart;var onTouchEnd;}class qC{final  u=new Map<int,NB>();final  l;qC(this.l); qF( j, g){var i=new oB(g.page.x,g.page.y,0,0,l.OB,l.n);j.FF.add(i);} vF( j){j.changedTouches.forEach(( g){var i=new NB(g.identifier);if(u[g.identifier]!=null){return;}assert(u[g.identifier]==null);u[g.identifier]=i;qF(i,g);if(l.onTouchStart!=null){l.onTouchStart(l,i);}});EG(j.touches);} GG( j){j.changedTouches.forEach(( i){var g=u[i.identifier];if(g==null){return;}assert(g!=null);u.remove(i.identifier);qF(g,i);if(l.onTouchEnd!=null){l.onTouchEnd(l,g);}});EG(j.touches);} MG( i){i.changedTouches.forEach(( g){var j=u[g.identifier];qF(j,g);});EG(i.touches);} RG( i,j){for(int g=0;g<i.length;g++ ){if(i[g].identifier==j){return true;}}return false;}EG( g){if(g.length!=u.length){print('${g.length} ${u.length}');}u.forEach((i,j){if(!RG(g,i)){print('Did not find ${i}');}});}}