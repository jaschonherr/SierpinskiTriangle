public int base = 10;
public boolean[] keys = new boolean[128];
public void setup() {
  size(800, 800);
  background(0);
}

public void draw() {
  background(0);
  if(base <= width/2 && base >= 0) {
    if(keys['d']) {
      base += 10;
    }
    if(keys['a']) {
      base -= 10;
    }
  }
  if(base < 0) {  
    base += 10;
  }
  if(base > width/2) {  
    base -= 10;
  }
  sierpinski(0, height, base);
  sierpinski(0, height/2, base);
  sierpinski(width/2, height, base);
  sierpinski(width/2, height/2, base);
}

public void sierpinski(int x, int y, int len) {
  if(len <= 12) {
    noStroke();
    fill(0, 0, 255);
    triangle(x, y, x + len/2, y - len, x + len, y);
  } else {
    sierpinski(x, y, len/2);
    sierpinski(x + len/2, y, len/2);
    sierpinski(x + len/4, y - len/2, len/2);
  }
}

void keyPressed() {
  keys[key] = true;
}

public void keyReleased() {
  keys[key] = false;
}
