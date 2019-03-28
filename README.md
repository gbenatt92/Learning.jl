# Learning.jl

This is a project I'm using to learn the basics of Julia.

Currently implemented a Directional Graph utilizing structs, strings, dicts and tuples. This tries to use the easy  Adjacency List data structure.

The objective is to be able to summary and index knowledge as one learns in a simple summary markdown file, like the following example and convert it to a directional graph data structure, able to plot the relationships, search paths and so on. Bellow is an example of the markdown format

```
# Probability Calculus

Topic: Central Limit Theorem
Description: For a statistical theory states that given a sufficiently large sample size from a population with a finite level of variance, the mean of all samples from the same population will be approximately equal to the mean of the population.
Further notes: /home/user/Documents/Notes/Probability/CLT.md
References: http://www.incertitudes.fr/book.pdf, http://www.contrib.andrew.cmu.edu/~ryanod/?p=866
Parents: Probability Distribution, Law of Large Numbers
Offspring: Regression Analysis, Density Estimation
```

Where each topic is a Node (or Vertice) while parents/offspring are topics with the Edge directed to/from the current topic.

This is a work in progress.
