public int base = 0;
public int squares = 1;
public int speed = 4;
public color myColor = color(0, 0, 0);
public boolean[] keys = new boolean[128];
public void setup() {
  size(800, 800);
  background(200);
}

public void draw() {
  background(200);
  for(int i = 0; i < squares; i++) {
    for(int j = 0; j < squares; j++) {
      sierpinski(i*(width/squares), height - j*(height/squares), base);
    }
  }
  base += speed;
  if(base <= 0 || base >= width/squares) {
    speed = -speed;
  }
}

public void sierpinski(int x, int y, int len) {
  if(len <= 40) {
    noStroke();
    fill(myColor);
    triangle(x, y, x + len/2, y - len, x + len, y);
  } else {
    sierpinski(x, y, len/2);
    sierpinski(x + len/2, y, len/2);
    sierpinski(x + len/4, y - len/2, len/2);
  }
}

void keyPressed() {
  if(key == 'w') {
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  }
  if(key == 'd') {
    if(squares < 6) {
      base = 1;
      squares++;
    }
  }
  if(key == 'a') {
    if(squares >= 2) {
      base = 1;
      squares--;
    }
  }
}
