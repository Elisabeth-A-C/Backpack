//The price/value for the items. //<>//
int maxPrice;

//Generate an array for the arrays of the generations.
generation[] generations;

//Current generation.
int numberOfGenerations = 0;

void setup() {
  size(500, 500);
  background(200);

  //There will be a max of 10000 generations.
  generations = new generation[10000];

  //maxPrice is calculated as the price sum of all items.
  maxPrice = 0;
  for (int i = 0; i < 24; i++) {
    maxPrice = maxPrice + priceList[i];
  }

  //Step 1: We generate the 1. and 2. generation randomly.
  for (int g = 0; g < 20; g++) {
    generations[g] = new generation();
    generations[g].createFirstGeneration();
    numberOfGenerations++;
  }
}

void draw() {
  //In the draw function, we generate the next generations after the first generation, generated from the previous generation.'
  if (numberOfGenerations >= 1000) { //TO-DO: 10000 not 1000!
    return;
  }
  //Step 2: Calculate fitness of each item.
  float fitness = generations[numberOfGenerations - 1].fitness();
  /*println(generations[numberOfGenerations - 1].selectedOrNot);
   println(generations[numberOfGenerations - 1].mass);
   println(fitness);*/

  //Step 3: Design next generation.
  //A. Pick the two parents with the highest fitness.
  generation highestFitness;
  generation secondHighestFitness;

  if (generations[0].fitness() > generations[1].fitness()) {
    highestFitness = generations[0];
    secondHighestFitness = generations[1];
  } else {
    highestFitness = generations[1];
    secondHighestFitness = generations[0];
  }
  for (int g = 2; g < numberOfGenerations; g++) {
    if (generations[g].fitness() > highestFitness.fitness()) {
      secondHighestFitness = highestFitness;
      highestFitness = generations[g];
    } else if (generations[g].fitness() > secondHighestFitness.fitness()) {
      secondHighestFitness = generations[g];
    }
  }
  print(numberOfGenerations);
  print(" : ");
  print(highestFitness.price);
  print(" : ");
  print(highestFitness.fitness());
  print(" : ");

  //B. Crossover - create a "child" by combining the DNA of these two parents.
  generations[numberOfGenerations] = highestFitness.crossover(secondHighestFitness);
  print(generations[numberOfGenerations].fitness()); //TO-DO: Del this.
  print(" : ");

  //C. Mutation - mutate the child's DNA based on the probability of 10%. For every item in the generation will there be 1% chance for mutation.
  generations[numberOfGenerations].mutate();
  println(generations[numberOfGenerations].fitness()); //TO-DO: Del this.

  //Move on to the next generation.
  numberOfGenerations++;
}