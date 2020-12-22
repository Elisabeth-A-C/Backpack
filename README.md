# Backpack
This program will pack the backpack in a way where the mass is under 5000 kg, and the value/price is as high as possible.
---
The genetic algorithm that is used in this program is based on the following concept:

In the setup-function:
- Step 1: Generate the 1. and 2. generation randomly.


In the draw-function:
- Step 2: Calculate the fitness of each backpack.
- Step 3: Design the next generation. This step consists of:
   1. Define which backpacks are most likely to be parents in the next generation (see how this is done later in this ReadMe-file).
   2. Crossover - create a "child" by combining the DNA of the two parents.
   3. Mutation - mutate the child's DNA based on a probability.

# Graph
The highest price will be found pretty quickly. However, to ensure that it indeed is the highest price that is found (which is 1130), I have chosen to 
let the program run for 400 generations. That way I ensure that the acutal highest price will be found. Otherwise, the program will sometimes (not often, but sometimes)
find the solution 1127 instead.

# Change values in the program.
In the program, it is possible to change the size of the population, and the chance of mutation. This is done when "startPopulationSize" and "mutationPercent" is create above in the Backpack-file. 

# UserInterface
The interface of the program is made in a way where every object is encapsulated. That way, it is easy to move the objects around without making a mess in the interface. 

# Step 3.i: Define which backpacks are most likely to be parents in the next generation
Originally, I made the code in a way where it was only the two best backpacks that would form the next generation. However, that way there wasn't any real evolution, since the next generation would continue to be the same unless mutation happened. Therefore, I choose to change this part. 
In the current code, I create a new generation with 100 backpacks each time, and I delete the old generation. The generation is created in a way where there's a higher chance that a backpack with a higher fitness will get picked compared to a backpack with a lower fitness. To make this, I have used the mathematical function x^4, since that will give me that result (I have sorted the backpacks in a way that the lowest number newGeneration[x] will have the highest fitness; aka newGeneration[0] will have the highest fitness, newGeneration[1] will have the second highest fitness and so on).
