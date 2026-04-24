= How structured is a graphon?

== Motivation

Let $f: [0, 1]^(2) -> [0, 1]$ be a graphon, ie a symmetric function. Traditionally, we generate random graphs using $f$ using the following algorithm. Let $ X_(1),#sym.dots.h, X_(n) ~ "Uniform"([0, 1]), $ $G_(n)$ be a random graph with $n$ vertices where $ {(v_(i), v_(j)) in E(G_(n))} ~ "Bernoulli"(f(X_(i), X_(j))). $ From this perspective, locally it seems that $f(x, y) = p$ or Erdös Renyi Graphs have the highest entropy. But if you look at the graph from a global perspective, you see 1 community as $n -> infinity$ and thus Erdös Renyi Graphs end up having the most structure. Something similar happens with block stochastic graphons which correspond to multipartite-esque graphs ($n$ "communities" with maybe a few connections between communities). So it makes sense to study graphons and the sequences that they produce form a more global perspective.

The impetus for the problem comes from the following idea, what if $f$, a graphon doesn't describe probability of an edge but rather edge weight of a complete graph. Let $G_(n) = (K_(n), Phi)$ where $Phi: E(K_(n)) -> [0, 1]$ where $ phi(v_(i), v_(j)) = f(X_(i), X_(j)). $ Let $(G_(n))_(n in NN)$ be the sequence of random weighted complete graphs generated in this way. Note two graphs are equal if they are results of a simple permutation of vertices. Let $H_(f)$ be the set of all possible complete weighted graphs that can be produced by this algorithm. You will notice a few things:

1. If $f = p$, then $abs(H_(f)) = 1$.
2. If $f$ is a block graphon with $n$ blocks, then $abs(H_(f)) = n$
3. The less structured the graphon is the more sequences are possible. Note you start to care about asymptotic growth.
4. At the extreme, a graphon $f(x, y) ~ "Uniform"([0, 1])$ should have the most sequences

One can logically ask the question how many possible sequences of complete weighted graphs can you create from such a process for a given graphon $f$. This should be equivalent to asking the question how complicated is the graphon $f$.


== Problem

*Can you quantify how random a graphon is or how much entropy does a graphon have?*

== Possible Implications

- Sampling Bounds: If you can quantify how complex a graphon is you may be able get learning-theoretic results. For a expected model with lower complexity, you may need fewer samples.
- Understand Larger Network Structure: Real world networks typically exhibit a spectrum of structure:
  - Social networks: community structure (low-medium complexity)
  - Biological networks: some motif structure but noisy (medium complexity)
  - Random graphs for null models: high complexity


- Compression and Information Theory: Descriptive complexity = compressibility
- Algorithm Design and Computational Complexity: The more global structure can aid algorithmic tasks. For example community detection is fast on block models, hard on random graphs. Graph matching is easier with structure

You can get a spectrum of complexity.

Prediction 1: Community detection should work better on graphs sampled from low-complexity graphons

Test: Sample from varying complexity graphons, measure detection accuracy



Prediction 2: Real networks with "good" community structure should have low estimated graphon complexity

Test: Estimate graphon from real networks, measure complexity
Hypothesis: Social networks (known communities) → low complexity
Hypothesis: Random ER graphs → high complexity


Prediction 3: Complexity should predict limits of community detection

Information-theoretic threshold: can you detect communities?
Computational threshold: can you efficiently detect them?
Both should relate to graphon complexity


Maybe you can give confidence bounds given a sequence of graphs on community detection.

== Possible related problems

What if you sample $f$ from a probability distribution?

== Ideas
- Szmeridi's Lemma
- Sobolev Norm
- Kolmogrov Entropy
