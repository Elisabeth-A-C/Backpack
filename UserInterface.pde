class UIelements {
  //This class is going to be part of all other classes in the UserInterface-file.
  int UIx;
  int UIy;
  int UIw; 
  int UIh;

  void setup(int x, int y, int w, int h) {
    //The position of the title (the object).
    UIx = x;
    UIy = y;
    UIw = w;
    UIh = h;
  }
}

class heading extends UIelements {
  void draw() {
    fill(255);
    rect(UIx, UIy, UIw, UIh);
    PFont f = createFont("Stencil", 65);
    textFont(f);
    fill(40);
    text("Pak rygsæk", UIx+UIw*0.265, UIy+UIh*0.7);
  }
}

class thingsInTheBackpack extends UIelements {
  void draw() {
    fill(255);
    rect(UIx, UIy, UIw, UIh);
    PFont f = createFont("Stencil", 25);
    textFont(f);
    fill(40);
    text("Ting i rygsækken", UIx+UIw*0.180, UIy+UIh*0.03);
  }
}

class graph extends UIelements {
  void draw() {
    fill(255);
    rect(UIx, UIy, UIw, UIh);
    PFont f = createFont("Stencil", 25);
    textFont(f);
    fill(40);
    text("Udvikling af pris", UIx+UIw*0.185, UIy+UIh*0.1);
  }
}

class button extends UIelements {
  void draw() {
    fill(255);
    rect(UIx, UIy, UIw, UIh);
  }
}

class information extends UIelements {
  void draw() {
    fill(255);
    rect(UIx, UIy, UIw, UIh);
  }
}
