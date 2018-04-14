public class Time {
  
  private PVector times;
  private color cTime;
  private boolean timeUpdate;
  private int oldTime;
  private int time;
  private int freq;
  private int offset;
  private boolean bText;

  public Time(){
    time=1;
    oldTime=0;
    timeUpdate=false;
    cTime=color(floor(random(255)), floor(random(255)), floor(random(255)));
    freq=0;
    offset=0;
    bText=true;  
  }
  
  public Time(int o,int f, boolean t){
    this();
    bText=t;
    freq=f;
    offset=o;
    if(bText){
      setupNumbers();
    }
  }
  
  private void setupNumbers(){
    pushMatrix();
    translate(width/2, height/2);
    rectMode(CENTER);
    textAlign(CENTER);
    stroke(255);
    for(int i=0;i<freq;i++){
    // text(i+1,(width/2-40-offset/2)*mapToCircle(i+1,freq).x, (width/2-40-offset/2)*mapToCircle(i+1,freq).y); 
     updateTime(i+1);
      drawArc(20,0,TWO_PI,cTime,255,20);
      drawArc(10,0,2*TWO_PI,51,255,25);
    }
    popMatrix();
  
  }
  
  public void updateTime(int t){
   time=t; 
   times = mapToCircle(time, freq);
  }
  
  public void show() {
  
    if (oldTime!=time||oldTime==0) {
 
      oldTime=time;
      float ang =getAng(time, freq);
      timeHand();
      if (time==0) {
        time=freq;
        timeUpdate=true;
      } else if (time==1 && timeUpdate) {    
        cTime=color(floor(random(255)), floor(random(255)), floor(random(255))); 
        timeUpdate=false;
      }
      fill(cTime);
      if(bText){
        rectMode(CENTER);
        textAlign(CENTER);
        text(Integer.toString(time), times.x, times.y);
      }
      
      //erase text
      drawArc(80,ang-radians(90),ang-radians(10),51,100,30);
      
      //draw the circles
      drawArc(20,ang-radians(10), ang,cTime,255,20);
      drawArc(10,ang-radians(90),ang-radians(5),51,100,25);

    }
  }
  
  private void timeHand() {
    times= new PVector((width/2-40-offset/2)*times.x, (height/2-40-offset/2)*times.y);
  }

  private void drawArc(int offX, float angStart, float angFin, int st, int stAlpha, int stW){
      noFill();
      stroke(st,stAlpha);
      strokeWeight(stW);
      arc(0, 0, width-offX-offset, height-offX-offset, angStart,angFin);
  }

}
