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
    
    //noStroke();
  }
}

class heading extends UIelements {
  void draw() {
    fill(200,240,250);
    rect(UIx, UIy, UIw, UIh);
    PFont f = createFont("Stencil", 65);
    textFont(f);
    fill(40);
    text("Pak rygsæk", UIx+UIw*0.265, UIy+UIh*0.6);
    textSize(20);
    text("Når det gælder om at pakke rygsækken med den højeste pris.", UIx+UIw*0.09, UIy+UIh*0.8);
    
  }
}

class thingsInTheBackpack extends UIelements {
  void draw() {
    fill(200,240,240);
    rect(UIx, UIy, UIw, UIh);
    PFont f = createFont("Stencil", 25);
    textFont(f);
    fill(40);
    text("Ting i rygsækken", UIx+UIw*0.180, UIy+UIh*0.03);
  }
}

class graph extends UIelements {
  void draw() {
    fill(200,240,240);
    rect(UIx, UIy, UIw, UIh);
    PFont f = createFont("Stencil", 25);
    textFont(f);
    fill(40);
    text("Udvikling af pris", UIx+UIw*0.185, UIy+UIh*0.1);
  }
}

class button extends UIelements {
  void draw() {
    fill(200,240,240);
    rect(UIx, UIy, UIw, UIh);
  }
}

class information extends UIelements {
  int informationMass;
  int informationPrice;
  float informationFitness;

  void draw() {
    fill(200,240,240);
    rect(UIx, UIy, UIw, UIh);
    fill(0);
    textSize(25);
    text("For nuværende bedste løsning:", UIx+UIw*0.02, UIy+UIh*0.15);
    textSize(20);
    text("Vægt: " + informationMass, UIx+UIw*0.02, UIy+UIh*0.35);
    text("Højeste pris: " + informationPrice, UIx+UIw*0.02, UIy+UIh*0.45);
    text("Højeste fitness: " + informationFitness, UIx+UIw*0.02, UIy+UIh*0.55);
  }
}
