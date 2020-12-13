//Defining the objects that are going to fit into the bagpack. //<>// //<>//
String[] item = {"kort", "kompas", "vand", "sandwich", "sukker", "dåsemad", "banan", "æble", "ost", "øl", "solcreme", "kamera", "t-shirt", "bukser", "bukser", "paraply", "vandtætte bukser", "vandtæt overtøj", "pung", "solbriller", "håndklæde", "sokker", "bog", "notesbog", "telt"};
int[] massList = {90, 130, 1530, 500, 150, 680, 270, 390, 230, 520, 110, 320, 240, 480, 730, 420, 430, 220, 70, 180, 40, 300, 900, 2000};
int[] priceList = {150, 35, 200, 160, 60, 45, 60, 40, 30, 10, 70, 30, 15, 10, 40, 70, 75, 80, 20, 12, 50, 10, 1, 150};

class generation {
  int[] selectedOrNot = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  int mass;
  int price;

  //Create first generation.
  void createFirstGeneration() {
    for (int i = 0; i < 24; i++) {
      float pick = random(1);
      if (pick > 0.5) {
        selectedOrNot[i] = 1;
        calcMass();
        if (mass > 5000) {
          selectedOrNot[i] = 0;
        }
      } else {
        selectedOrNot[i] = 0;
      }
    }
    calcMass();
    calcPrice();
  }

  //Calculate fitness a generation.
  float fitness() {
    if (mass > 5000) {
      return(0);
    } else {
      //high price = high fitness
      return((float)price / (float)maxPrice);
    }
  }

  void calcMass() {
    mass = 0;
    for (int i = 0; i < 24; i++) {
      if (selectedOrNot[i] == 1) {
        mass = mass + massList[i];
      }
    }
  }
  void calcPrice() {
    price = 0;
    for (int i = 0; i < 24; i++) {
      if (selectedOrNot[i] == 1) {
        price = price + priceList[i];
      }
    }
  }

  generation crossover(generation parent2) {
    generation child = new generation();
    for (int i = 0; i < 12; i++) {
      child.selectedOrNot[i] = this.selectedOrNot[i];
    }
    for (int i = 12; i < 24; i++) {
      child.selectedOrNot[i] = parent2.selectedOrNot[i];
    }
    child.calcMass();
    child.calcPrice();
    while (child.mass > 5000) {
      float randomItemFloat = random(24);
      int randomItemInt = floor(randomItemFloat);
      child.selectedOrNot[randomItemInt] = 0;
      child.calcMass();
    }
    return child;
  }

  void mutate() {
    for (int i = 0; i < 24; i++) {
      float mutate = random(1);
      if (mutate < 0.1) {
        if (selectedOrNot[i] == 0) {
          selectedOrNot[i] = 1;
          calcMass();
          if (mass > 5000) {
            selectedOrNot[i] = 0;
          }
        } else {
          selectedOrNot[i] = 0;
        }
      }
    }
    calcPrice();
    calcMass();
  }
}
