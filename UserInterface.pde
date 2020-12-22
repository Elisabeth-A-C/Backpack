class UIelements {
  //This class is going to be part of all other classes in the UserInterface-file.
  int UIx;
  int UIy;
  int UIw; 
  int UIh;

  void setup(int x, int y, int w, int h) {
    UIx = x;
    UIy = y;
    UIw = w;
    UIh = h;
  }
}

class heading extends UIelements {
  //Create the heading.
  void draw() {
    fill(200, 240, 250);
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
  //Create area where you can see which things are in the backpack.
  String[] item = {"kort", "kompas", "vand", "sandwich", "sukker", "dåsemad", "banan", "æble", "ost", "øl", "solcreme", "kamera", "t-shirt", "bukser", "bukser", "paraply", "vandtætte bukser", "vandtæt overtøj", "pung", "solbriller", "håndklæde", "sokker", "bog", "notesbog", "telt"};
  int[] selectedOrNot;

  void draw() {
    fill(200, 240, 240);
    rect(UIx, UIy, UIw, UIh);

    //Header.
    PFont f = createFont("Stencil", 25);
    textFont(f);
    fill(40);
    text("Ting i rygsækken", UIx+UIw*0.1, UIy+UIh*0.04);

    //Which things are in the backpack. Green = in the backpack; gray = not in the backpack.
    textSize(15);
    for (int i = 0; i < 24; i++) {
      if (selectedOrNot[i] == 1) {
        fill(50, 210, 50);
      } else {
        fill(200, 200);
      }
      text(item[i], UIx+UIw*0.1, UIy+UIh*0.07+27*i);
    }
  }
}

class graph extends UIelements {
  //Create graph.
  ArrayList<Integer> bestPrice = new ArrayList<Integer>();

  void draw() {
    fill(200, 240, 240);
    rect(UIx, UIy, UIw, UIh);

    //Header.
    PFont f = createFont("Stencil", 25);
    textFont(f);
    fill(40);
    text("Udvikling af pris", UIx+UIw*0.185, UIy+UIh*0.1);

    //Draw graph.
    fill(0, 0);
    rect(UIx+UIw*0.075, UIy+UIh*0.15, 365, 365);
    fill(0);
    textSize(20);
    text("Pris", UIx+UIw*0.09, UIy+UIh*0.2);
    text("Antal iterationer", UIx+UIw*0.3675, UIy+UIh*0.935);

    //Draw graph function.
    int previousXPos = 0;
    int previousYPos = 0;

    for (int i = 0; i < bestPrice.size(); i++) {
      int xPos = round(((float)365 / (float)bestPrice.size()) * (float)i);
      int yPos = round(((float)365 / (float)maxPrice) * (float)bestPrice.get(i));

      //Set point.
      line(UIx+UIw*0.075+previousXPos, UIy+UIh*0.15+365-previousYPos, UIx+UIw*0.075+xPos, UIy+UIh*0.15+365-yPos);
      previousXPos = xPos;
      previousYPos = yPos;
    }
  }
}

class button extends UIelements {
  //Create button "Pak rygsæk".
  boolean clickedOnTheButton = false;

  void draw() {
    fill(200, 240, 240);
    rect(UIx, UIy, UIw, UIh);

    //The button.
    if (clickedOnTheButton == false) {
      fill(0, 200, 0);
    } else {
      fill(0, 100, 0);
    }
    rect(UIx+UIw*0.1, UIy+UIh*0.1, 335, 97, 8);

    fill(20);
    textSize(30);
    text("Pak rygsækken", UIx+UIw*0.175, UIy+UIh*0.58);
  }

  boolean mouseClicked(int x, int y) {
    if (x > UIx+UIw*0.1 && x < UIx+UIw*0.1+335 && y > UIy+UIh*0.1 && y < UIy+UIh*0.1+97) {
      clickedOnTheButton = true;
      return true;
    } else {
      return false;
    }
  }
}

class information extends UIelements {
  //Create informations under the button.
  int informationMass;
  int informationPrice;
  float informationFitness;

  void draw() {
    fill(200, 240, 240);
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
