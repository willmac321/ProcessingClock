private Time seconds;
private Time minutes;
private Time hours;

public void setup() {
  size(1000, 1000); 
  background(51);
  //first param is offset form edge of window, so 0 is outermost edge, second param is the frequency, ie 60 seconds
  seconds = new Time(width/10,60,true);
  minutes = new Time(width/4,60,true);
  hours = new Time(width/2,12,true);
}

public void draw() {
  translate(width/2, height/2);
  seconds.updateTime(second());
  minutes.updateTime(minute());
  hours.updateTime(hour()%12); 
  seconds.show();
  minutes.show(); //<>//
  hours.show();
}

protected float getAng(int t, int freq) {
  return map(t, 0, freq, -PI/2, (3*PI)/2);
}

protected PVector mapToCircle(int t, int freq) {
  float ang = getAng(t, freq);
  return new PVector(cos(ang), sin(ang));
}
