float s, m, h;
float sAngle, mAngle, hAngle;
float sX, sY, mX, mY, hX, hY;
float centerX, centerY;
float markAngle, markX, markY;

void setup(){
  size(400, 400);
  background (255);
  fill(0);
  stroke(0);
  textSize(35);
  textAlign(CENTER);
  s = second();
  m = minute();
  h = hour();
  centerX = width / 2;
  centerY = height / 2;
}

void draw(){
  background(255);
  clockFace();
  updateTime();
  drawHand();
}

void clockFace(){
  circle(centerX, centerY, 2);
  noFill();
  circle(centerX, centerY, 300);
  int hour = 0;
  for (float second = 0; second <= 60; second ++){
    markAngle = second / 60 * 2 * PI - PI/2;
    markX = centerX + cos(markAngle) * 150;
    markY = centerY + sin(markAngle) * 150;
    if (second % 5 == 0){
      line((markX - centerX) * 0.9 + centerX,(markY - centerY) * 0.9 + centerY, markX, markY);
      hour = int(second / 5);
      if (hour != 0){
        text(hour, (markX - centerX) * 0.75 + centerX, (markY - centerY) * 0.75 + centerY + 10);
      }
    }
    else{
      line((markX - centerX) * 0.95 + centerX,(markY - centerY) * 0.95 + centerY, markX, markY);
    }
  }
}

void updateTime(){
  s = second();
  m = minute();
  h = hour() + 1;
  if (h > 12){
    h -= 12;
  }
  println(s,m,h);
}

void timeToAngle(float s, float m, float h){
  sAngle = s / 60 * 2 * PI - PI/2;
  mAngle = m / 60 * 2 * PI - PI/2;
  hAngle = h / 12 * 2 * PI - PI/2;
}

void drawHand(){
  timeToAngle(s, m, h);
  sX = centerX + cos(sAngle) * 125;
  sY = centerY + sin(sAngle) * 125;
  stroke(255, 0, 0);
  strokeWeight(2);
  line(centerX, centerY, sX, sY);
  mX = centerX + cos(mAngle) * 115;
  mY = centerY + sin(mAngle) * 115;
  stroke(0);
  strokeWeight(3);
  line(centerX, centerY, mX, mY);
  hX = centerX + cos(hAngle) * 75;
  hY = centerY + sin(hAngle) * 75;
  strokeWeight(5);
  line(centerX, centerY, hX, hY);
}
