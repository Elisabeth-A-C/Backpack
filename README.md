# Backpack
This program will pack the backpack in a way where the mass is under 5000 kg, and the value/price is as high as possible.
---
The genetic algorithm that is used in this program is based on the following concept:

In the setup-function:
- Step 1: Generate the 1. and 2. generation randomly.

In the draw-function:
- Step 2: Calculate the fitness of each backpack.
- Step 3: Design the next generation. This step consists of:
   1. Define which backpacks are most likely to parents in the next generation.
   2. Crossover - create a "child" by combining the DNA of the two parents.
   3. Mutation - mutate the child's DNA based on a probability.

# Graph
The highest price will be found pretty quickly. However, to ensure that it indeed is the highest price that is found (which is 1130), I have chosen to 
let the program run for 400 generations. That way I ensure that the acutal highest price will be found. Otherwise, the program will sometimes (not often, but sometimes)
find the solution 1127 instead.
