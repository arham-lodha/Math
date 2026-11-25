#import "template.typ": *

#show: paper.with(
  title: "Exponential Sums",
  abstract: [TODO],
  keywords: (),
)

// ── Usage ────────────────────────────────────────────────────────────────────
//
//  Sections are level-1 (=), subsections level-2 (==). Theorem counters reset
//  at each section: Definition 2.1, Theorem 2.2, ...
//
//  Environments (from @local/my-prelude, colored boxes):
//    #definition("Name")[ ... ]   #theorem[ ... ]   #lemma[ ... ]
//    #proposition[ ... ]          #corollary[ ... ]
//    #example[ ... ]  #remark[ ... ]  #notation[ ... ]   (own counters)
//    #proof[ ... ]                #callout("Title")[ ... ]
//    #question[ ... ]             amber box for things to chase down
// ─────────────────────────────────────────────────────────────────────────────


#notation[
  Write $e(x) = e^(2 pi i x)$, so that $e(n x)$ is the character of $RR \/ ZZ$ of frequency $n$.
]

#example[
  Take all coefficients equal to $1$ (the Dirichlet kernel). Then
  $ integral_[0, 1] abs(sum_(n <= N)^() e(n x))^p dif x approx N^p dot 1/N = N^(p - 1), $
  since the sum has size $approx N$ on an interval of length $approx 1/N$ around $x = 0$.
]

#conjecture("Rudin")[
  For $p in (2, 4)$,
  $ integral_[0, 1] abs(sum_n a_n e(n^2 x))^p dif x = O_p (1) $
  whenever $norm(a)_(l^2) <= 1$.
]


#corollary[
  The number of squares in an arithmetic progression of length $M$ is $<= M^(1/2 + o(1))$.
]

#remark[
  Rudin doesn't hold for $p = 4$.
  $
    integral_[0, 1] abs(sum e(n^2 x))^4 = integral_[0, 1] abs(sum_(n_1, n_2, n_3, n_4) e((n_1^2 + n_2^2 - n_3^2 - n_4^2) x))^p dif x = \#{n_1^2 + n_2^2 = n_3^2 + n_4^2} = o(N^2 log N)
  $
]

#definition()[
  A Sidon set, $S subset [N]$ where if $a_1, a_2, a_3, a_4 in S$ gives $a_1 + a_2 = a_3 + a_4 => {a_1, a_2} = {a_3, a_4}$
  #example()[
    Powers of two
  ]
]

#theorem(name: "Erdos Turan + Lefman Thiele")[
  There exists a sidon set of $S_N$ with size $N^(2/3)$
]

#theorem(name: "Pohoata et al")[
  Showed such a set $<= N exp(-C log(N)/log(log(N)))$
]

#question[
  What happens at $N = 10$?
]

#theorem[
  Any sidon set has the prop that $ integral abs(sum_(n in S) a_n e(n x))^p <= O_p (sum abs(a_n)^2 )^(p/2) $ for $p > 2$
]



#corollary[
  Any length $M$ arithmetic progression contains an $M^(1/2)$ Sidon Set.
]

= Clopen Problems
#conjecture[
  For a subset A of squares
]

#question[
  What is additive energy?


]
