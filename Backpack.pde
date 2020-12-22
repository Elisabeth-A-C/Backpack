boolean runCode = false; //<>//

//Nothing is in the backpack when you start the program.
int[] emptySelectedOrNot = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

//Global variables created to implement in UserInterface.
heading UIheading;
thingsInTheBackpack UIthingsInTheBackpack;
graph UIgraph;
button UIbutton;
information UIinformation;

//Change the start population size by changing this number.
int startPopulationSize = 100;

//Change the percentage of the mutation by changing this number.
float mutationPercent = 0.05;

//The price/value for all items in the backpack.
int maxPrice;

//Generate an array for the arrays of the generations.
generation[] generations;

void setup() {
  size(800, 950);
  background(220);

  //Implement setup-functions in UserInterface.
  UIheading = new heading();
  UIheading.setup(0, 0, 800, 160);
  UIthingsInTheBackpack = new thingsInTheBackpack();
  UIthingsInTheBackpack.setup(0, 160, 350, 1140);
  UIthingsInTheBackpack.selectedOrNot = emptySelectedOrNot;
  UIgraph = new graph();
  UIgraph.setup(350, 500, 550, 450);
  UIbutton = new button();
  UIbutton.setup(350, 160, 550, 120);
  UIinformation = new information();
  UIinformation.setup(350, 280, 550, 230);

  //There will be a max of 10000 generations.
  generations = new generation[10000];

  //maxPrice is calculated as the price sum of all items.
  maxPrice = 0;
  for (int i = 0; i < 24; i++) {
    maxPrice = maxPrice + priceList[i];
  }

  //Step 1: We generate the 1. and 2. generation randomly.
  for (int g = 0; g < startPopulationSize; g++) {
    generations[g] = new generation();
    generations[g].createFirstGeneration();
  }
}

//In the draw function, we generate the next generations after the first generation, generated from the previous generation.
void draw() {
  if (runCode) {
    //Draw the graph until the current number is the same as the number 400 generations ago.
    int s = UIgraph.bestPrice.size();

    if (s > 400) { 
      int a = UIgraph.bestPrice.get(s-401);
      int b = UIgraph.bestPrice.get(s-1);
      if (a==b) {
        runCode = false;
        UIbutton.clickedOnTheButton = false;
        return;
      }
    }

    //Step 2: Calculate fitness of each item. This is done on the fly in the function "fitness()" in the Generation-file.

    //Step 3: Design next generation.
    //A. The next generation will be defined by the previous generation. The higher the price, the more likely will it be that the parent is going to be picked in the next generation.
    generation newGeneration[] = new generation[startPopulationSize];

    for (int g = 0; g < startPopulationSize; g++) {
      float r;
      int p1;
      int p2;

      r = random(1);
      p1 = floor(startPopulationSize*pow(r, 4));
      do {
        r = random(1);
        p2 =  floor(startPopulationSize*pow(r, 4));
      } while (p1 == p2);

      //B. Crossover - create a "child" by combining the DNA of the two parents.
      newGeneration[g] = generations[p1].crossover(generations[p2]);

      //C. Mutation - mutate the child's DNA based on a probability. For every item in the generation there be a percentage of chance for mutation.
      newGeneration[g].mutate();
    }
    sortGeneration(newGeneration);

    //Set UIinformation for current values of the highest fitness which will be newGeneration[0] (because we set it to newGeneration[0] in the function, "sortGeneration()").
    UIinformation.informationMass = newGeneration[0].mass;
    UIinformation.informationPrice = newGeneration[0].price;
    UIinformation.informationFitness = newGeneration[0].fitness();
    UIthingsInTheBackpack.selectedOrNot = newGeneration[0].selectedOrNot;
    UIgraph.bestPrice.add(newGeneration[0].price);

    //Delete old generation.
    generations = newGeneration;
  }

  //Implement draw-functions in UserInterface.
  UIheading.draw();
  UIthingsInTheBackpack.draw();
  UIgraph.draw();
  UIbutton.draw();
  UIinformation.draw();
}

void sortGeneration(generation[] gen) {
  //Sorting the generation so the generation with the highest fitness will be newGeneration[0].
  for (int i = 0; i < gen.length-1; i++) {

    for (int j = 0; j < gen.length-i-1; j++) {
      if (gen[j].fitness() < gen[j+1].fitness()) {
        generation temp = gen[j];
        gen[j] = gen[j+1];
        gen[j+1] = temp;
      }
    }
  }
}

void mouseClicked() {
  //Function to click on the "Pak rygsæk"-button. 
  if (UIbutton.mouseClicked(mouseX, mouseY)) {
    runCode = true;
    UIgraph.bestPrice.clear();

    for (int g = 0; g < startPopulationSize; g++) {
      generations[g] = new generation();
      generations[g].createFirstGeneration();
    }
  }
}
