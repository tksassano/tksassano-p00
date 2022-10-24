float s, m, h;
float sAngle, mAngle, hoursAngle;
float sX, sY, mX, mY, hX, hY;
float centerX = width / 2, centerY = height / 2;

void setup(){
  size(400, 400);
  background (255);
  fill(255);
  stroke(0);
  s = second();
  m = minute();
  h = hour();
}

void draw(){
  background(255);
  clockFace();
  drawHand();
}

void clockFace(){
  circle(centerX, centerY, 100);
}

void updateTime(){
  s = second();
  m = minute();
  h = hour() + 1;
  if (h > 12){
    h = 24 - h;
  }
}

void timeToAngle(float s, m, h){
  sAngle = s / 60 * 2 * PI;
  mAngle = m / 60 * 2 * PI;
  hAngle = h / 12 * 2 * PI;
}

void drawHand(){
  timeToAngle(s, m, h);
  sX = centerX + cos(sAngle) * 10;
}
