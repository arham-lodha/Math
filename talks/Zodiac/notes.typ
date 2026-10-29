= How the Zodiac Z340 Cipher Was Finally Broken

*Abstract*: Between December 1968 and October 1969, the Zodiac Killer murdered at least five people in the San Francisco Bay Area and taunted police and newspapers with letters containing four cryptograms: Z408, Z340, Z13 and Z32, named for their lengths. Z408 fell within a week in 1969 to schoolteacher Donald Harden and his wife Bettye, using frequency analysis. Z340 resisted the FBI and generations of codebreakers for 51 years, until American software engineer David Oranchak, Australian mathematician Sam Blake and Belgian programmer Jarl Van Eycke solved it in December 2020. This talk focuses on the solution of Z340 and the mathematics behind searching for a cipher key and certifying that a candidate is correct. Topics include information theory, Markov chains on groups, and Monte Carlo randomized algorithms, along with the twists that made Z340 so much harder than Z408.

== Introduction

== Is there a unique answer?
When you are trying to brute force a problem, you want to know if the problem is uniquely solvable or well defined?

*Example*: Much of cryptography and subsequently code breaking relies on the fact that $ZZ$ is a UFD and that you can uniquely factor a number into a product of prime, but this task of finding these primes are hard.

Thus when you are given a cipher, you want to know when can you find a unique key which will give you a deciphered message that is the original plaintext with probability close to 1. This happens when the ciphertext itself contains more information than the cipher system can feasibly hide. Shannon developed the theory for this.

=== Basic Setup:
We need to set up the basics of Information Theory. Highly recommend reading Shannon's seminal papers _A Mathematical Theory of Communication_ (1948) and _Communication Theory of Secrecy Systems_ (1949); the second is where the ideas in this talk come from.

Let $S$ be a finite state space, for our needs it will be the set of symbols (either in our cipher script or English). $X$ is a random variable on the state space $S$. We want to understand, how "random" $X$ is, entropy is the measure of randomness. $ H(X) & = - sum_(x in S) Pr(X = x) log(Pr(X = x)). $ Throughout, $log$ is base $2$ (so entropy is measured in bits) and $0 log 0 = 0$. Two extremes: if $X$ is deterministic then $H(X) = 0$, and if $X$ is uniform on $S$ then $H(X) = log |S|$, the maximum possible. For two random variables, the *conditional entropy* $ H(X | Y) = - sum_(x, y) Pr(X = x, Y = y) log Pr(X = x | Y = y) $ is the uncertainty left in $X$ after seeing $Y$. It satisfies $0 <= H(X | Y) <= H(X)$, with equality on the right iff $X$ and $Y$ are independent.

A Markov Chain is a stochastic process $(X_t)_(t = 0)^(oo )$ where $ Pr(X_t = s_t | X_0 = s_0, ..., X_(t - 1) = s_(t - 1)) = Pr(X_t = s_t | X_(t - 1) = s_(t - 1)). $ We assume it is time-homogeneous, so it is described by a transition matrix $P_(i j) = Pr(X_t = j | X_(t-1) = i)$. A distribution $pi$ on $S$ is *stationary* if $pi P = pi$. The chain is *irreducible* if every state can be reached from every other state, and *aperiodic* if the return times to a state have gcd $1$. For such a chain on a finite $S$ there is a unique stationary distribution $pi$, and $Pr(X_t = j) -> pi_j$ for any starting distribution.

A language is a stochastic process: a text is a sample $(X_0, X_1, X_2, ...)$ of letters from $S$ (say $S =$ the $26$ letters), where each letter depends on the ones before it. A Markov chain is the simplest model of this, where the next letter depends only on the current one (a bigram model). Better models let the next letter depend on the previous $m$ letters, which is still a Markov chain, just on the state space $S^m$ of $m$-blocks. Real English is not exactly Markov, but this approximation captures most of the structure that matters for us.

A *cipher system* (Shannon) consists of
- a set of plaintext messages $M$, with a probability distribution coming from the language (for us, $M = S^n$, strings of length $n$),
- a finite set of keys $cal(K)$, with a probability distribution (typically uniform),
- for each key $k in cal(K)$ an injective encryption map $E_k : M -> C$ into the ciphertexts $C$, whose inverse on the image is the decryption $D_k$.

A message $m$ and an independent key $k$ are chosen, and the codebreaker sees only the ciphertext $c = E_k (m)$. *Example*: a simple substitution cipher on $S$ with $|S| = 26$ has $cal(K) =$ the permutations of $S$, so $|cal(K)| = 26! approx 4 times 10^26$ and $H(cal(K)) = log(26!) approx 88$ bits if keys are uniform. This looks hopeless to brute force, but the question is not whether it is hard to search the keys. It is whether, given $c$, there is more than one key that produces a sensible plaintext.

The codebreaker's remaining uncertainty about the key after seeing $n$ letters of ciphertext is the *equivocation* $H(cal(K) | C)$. If it is close to $0$, the key is (essentially) determined. The *redundancy* of the language is $ D = log |S| - H, $ where $H$ is the entropy rate of the language (defined below). It measures how far English is from random text: English has $H approx 1$ to $1.5$ bits per letter against $log 26 approx 4.7$, so $D approx 3$ to $3.7$ bits per letter.
=== Main Theorems:
Let $(X_t)_(t >= 0)$ be a Markov chain on a finite state space $S$ with transition matrix $P = (P_(i j))$ and stationary distribution $pi$. The *entropy rate* is $ H & = lim_(n -> oo) H(X_1, ..., X_n)/n \
  & =- sum_(i in S) pi_i sum_(j in S) P_(i j) log P_(i j), $ the average uncertainty in the next symbol given the current one (logs are base 2, so $H$ is in bits). For i.i.d. symbols this is just $H(X)$.

*Theorem (AEP for Markov chains):* Let $X$ be an irreducible, aperiodic Markov chain on a finite state space (any initial distribution). Then $ -1/n log Pr(X_0, X_1, ..., X_n) ->_(n -> oo) H quad "almost surely." $

*Proof*: By the Markov property, the probability of a path factors into the initial probability and one-step transition probabilities: $ Pr(X_0 = x_0, ..., X_n = x_n) = Pr(X_0 = x_0) product_(k = 1)^(n) Pr(X_k = x_k | X_(k - 1) = x_(k - 1)) = Pr(X_0 = x_0) product_(k = 1)^(n) P_(x_(k-1) x_k). $ Taking $-1/n log$, $ -1/n log Pr(X_0, ..., X_n) = underbrace(-(log Pr(X_0))/n, -> 0) + 1/n sum_(k = 1)^(n) f(X_(k-1), X_k), quad f(i, j) = -log P_(i j). $ The first term tends to $0$ since $Pr(X_0)$ is a fixed positive number for each realization of $X_0$ (with $Pr(X_0) > 0$ almost surely). The pair process $Y_k = (X_(k-1), X_k)$ is itself an irreducible Markov chain on the (finite) set of allowed transitions $\{(i, j) : P_(i j) > 0\}$, with stationary distribution $pi_i P_(i j)$. Pairs with $P_(i j) = 0$ never occur, so $f$ is finite along the path. By the Ergodic Theorem for Markov chains (time averages converge to space averages), almost surely $ 1/n sum_(k = 1)^(n) f(X_(k-1), X_k) -> sum_(i, j) pi_i P_(i j) f(i, j) = - sum_(i, j) pi_i P_(i j) log P_(i j) = H. $ $qed$

*Consequence (typical sequences)*: Fix $epsilon > 0$ and define the *typical set* $ A_epsilon^n = {(x_0, ..., x_n) in S^(n+1) : |-1/n log Pr(x_0, ..., x_n) - H| < epsilon}, $ i.e. the sequences with $2^(-n(H + epsilon)) < Pr(x_0, ..., x_n) < 2^(-n(H - epsilon))$. Then:

+ $Pr((X_0, ..., X_n) in A_epsilon^n) -> 1$ as $n -> oo$.
+ $|A_epsilon^n| <= 2^(n(H + epsilon))$.
+ $|A_epsilon^n| >= (1 - epsilon) 2^(n(H - epsilon))$ for $n$ large.

So a long sequence is, with probability close to $1$, one of about $2^(n H)$ typical sequences, each of which is roughly equally likely (probability $approx 2^(-n H)$). Compare with all $|S|^(n+1) = 2^((n+1) log |S|)$ sequences: whenever $H < log |S|$ (English: $H approx 1$ bit per letter vs. $log 26 approx 4.7$), typical sequences are an exponentially small fraction of everything.

*Proof*: (1) Almost sure convergence implies convergence in probability, which says exactly that $Pr(A_epsilon^n) -> 1$. (2) Every $x in A_epsilon^n$ has $Pr(x) > 2^(-n(H + epsilon))$, and probabilities sum to at most $1$: $ 1 >= sum_(x in A_epsilon^n) Pr(x) > |A_epsilon^n| 2^(-n(H + epsilon)). $ (3) By (1), for $n$ large $Pr(A_epsilon^n) > 1 - epsilon$, while every $x in A_epsilon^n$ has $Pr(x) < 2^(-n(H - epsilon))$: $ 1 - epsilon < sum_(x in A_epsilon^n) Pr(x) < |A_epsilon^n| 2^(-n(H - epsilon)). $ $square.stroked$

*Why this answers "is there a unique answer?"*: a wrong key decrypts the ciphertext to something that looks like a random string of symbols, which is almost never typical for the language. If there are $K$ keys, the expected number of wrong keys that give a typical-looking plaintext is about $K dot 2^(-n(log |S| - H))$, which is $<< 1$ once $n$ exceeds $ (log K)/(log |S| - H) = (log(K)) / (D) $ (the unicity distance). Past that length, the key is unique with probability close to $1$.

*Simple Example*: For a substitution cipher: $ log(K) = log(26 !) & = sum_(k = 1)^(26) log(k) \
                   & <= 88.39 $
$ "Unicity Distance" <= (88.39) / (3) = 29.4633333333 $
A tweet more than long enough to ensure a unique key with high probability.

*Zodiac 408*: Zodiac 408 maps 54 unique symbols to 26 letters. Count every such map (overcounting here), we can see $ log(K) <= log_2(26^(54)) = 54 log_2(26) <= 54 * 5 = 270. $
Using a similar redundancy as english (we are undercounting the redundancy), which isn't accurate because Zodiac's own writing has slightly different statistics than english, Gives us that the $ "Unicity Distance"<= (270) / (3) = 90. $ 408 is nearly six times as large, thus the Harden's solution is forced to be the correct one with extremely high probability. Even granting additional flexibily, like misspellings only pushes the upper bound on the unicity distance to around 157.

$Z 408$ had to have a unique answer, that was easier to find because it was longer and thus more information was revealed in the message.

*Opposite situation:* The message containing the Zodiac's name, which is called $Z 13$, and some of his other later ciphers $Z 23$ (23 character letter), are far below any reasonable lower bound of the unicity distance. Thousands of "solutions" to Z13 exist, and none can ever be confirmed. They are not unsolved; they are unsolvable in principle.

== How do we search for the key?

Suppose we know a unique key exists. How do we find it? The space of keys is the set of
all functions $f: cal(C) -> cal(A)$ from the code symbols to the alphabet, which is far
too large to enumerate. We also have no known structure in the cipher to exploit, so
brute force is out. Randomized algorithms, specifically Markov chain Monte Carlo (MCMC),
are well suited to this kind of problem.

Suppose we had an oracle that, given the encoded string and a candidate key $f$, returns
the plausibility $"Pl"(f)$ of seeing the resulting decoded text in English. We then
search as follows:

+ Start with some key $f$ and compute $"Pl"(f)$.
+ Pick a random transposition $sigma in S_26$ and form the proposal
  $f_sigma (x) = sigma(f(x))$. Compute $"Pl"(f_sigma)$.
+ Replace $f$ with $f_sigma$ with probability
  $ min(1, "Pl"(f_sigma) / "Pl"(f)), $
  otherwise keep $f$. Repeat from step 2.

This is the Metropolis algorithm. Since $sigma$ is its own inverse, the proposal is
symmetric, and the chain concentrates on keys whose decodings look like English.

*A plausibility model.* The better the language model, the faster we expect the search
to converge. The simplest reasonable choice is the digram model: the probability of each
letter depends only on the one before it. Let $M$ be the $26 times 26$ transition matrix
of a Markov chain on the alphabet, where $M_(i j)$ is the probability that letter $j$
follows letter $i$, estimated from a reference English text. For a coded string
$s_1 s_2 dots s_L$,
$ "Pl"(f) = product_(i = 1)^(L - 1) M(f(s_i), f(s_(i+1))). $
In practice, one should smooth $M$ so that no entry is zero (otherwise the ratio above can be undefined) and work with $log "Pl"$ to avoid numerical underflow.

*How many proposals do we need?* The algorithm relies on being able to reach any
permutation of the alphabet through a sequence of random transpositions. This is a
question about the mixing time of $k$ random transpositions in $S_n$.

*Theorem* (Diaconis-Shahshahani, 1981). Let $Q$ be the random transposition measure on
$S_n$,
$ Q(sigma) = cases(1/n & "if" sigma = e, 2/n^2 & "if" sigma "is a transposition", 0 & "otherwise"), $
and let $U$ be the uniform distribution. There is a universal constant $a$ such that for
$k = 1/2 n log n + c n$ with $c > 0$,
$ norm(Q^(ast k) - U)_(L^1) <= a e^(-2c). $

In other words, after a modest number of random transpositions, the resulting permutation
is close to uniform on $S_n$. For the alphabet, $n = 26$, so $k approx 42 + 26 c$
transpositions suffice. This tells us the proposal moves can reach every region of the
key space quickly. It does not by itself bound the mixing time of the full Metropolis
chain, which is also shaped by the acceptance step and the landscape of $"Pl"$.

*Proof sketch.* The idea is to diagonalize the walk using representation theory, then show that a single term dominates the resulting sum.

+ *Reduce to Fourier coefficients.* For an irreducible representation $rho$ of $S_n$ with dimension $d_rho$, let $hat(Q)(rho) = sum_sigma Q(sigma) rho(sigma)$. Convolution becomes matrix multiplication, so the transform of $Q^(ast k)$ is $hat(Q)(rho)^k$, while the transform of $U$ vanishes for every nontrivial $rho$. Cauchy–Schwarz plus Plancherel give the _Upper Bound Lemma_:
  $ norm(Q^(ast k) - U)_(L^1)^2 <= sum_(rho != "triv") d_rho "Tr"(hat(Q)(rho)^k (hat(Q)(rho)^*)^k). $

+ *Diagonalize using symmetry.* $Q$ is constant on conjugacy classes, so by Schur's lemma $hat(Q)(rho) = r_rho I$ is a scalar, with
  $ r_rho = 1/n + (n-1)/n chi_rho(tau) / d_rho, $
  where $tau$ is any transposition. The bound becomes $sum_(rho != "triv") d_rho^2 r_rho^(2k)$.

+ *Compute the eigenvalues.* Irreducibles are indexed by partitions $lambda tack.r n$, and Frobenius' formula gives $chi_lambda (tau) / d_lambda$ as the sum of box contents divided by $binom(n, 2)$. Hence
  $ r_lambda = 1/n + 2/n^2 sum_((i,j) in lambda) (j - i). $

+ *One term dominates.* For $lambda = (n-1, 1)$ we have $d_lambda = n - 1$ and $r_lambda = 1 - 2/n$, so its contribution is at most
  $ n^2 e^(-4k/n) = e^(-4c) quad "when" k = 1/2 n log n + c n. $

+ *The rest is of the same order.* Write $lambda = (n - j, mu)$ with $mu tack.r j$. Then $d_lambda <= binom(n, j) d_mu$, and $sum_(mu tack.r j) d_mu^2 = j!$, so the level-$j$ terms contribute about $(n^j / j!) dot n^(-2j) ...$ in total $lt.tilde e^(-4 c j) / j!$. Summing over $j >= 1$ gives $O(e^(-4c))$. (Partitions with $j$ near $n$ and those with negative $r_lambda$ need separate, routine estimates.)

+ *Conclude.* The sum is $O(e^(-4c))$, so $norm(Q^(ast k) - U)_(L^1) <= a e^(-2c)$.

The matching lower bound uses the test function $"fix"(sigma) = chi_((n-1,1))(sigma) + 1$ (number of fixed points). Under $U$ it has mean $1$ and variance $1$. After $k = 1/2 n log n + c n$ steps its mean is $1 + (n-1) r^k approx 1 + e^(-2c)$, which is many standard deviations away when $c$ is very negative. This is the cutoff.

== Why the theorem does not immediately control the Metropolis chain

The theorem is about a walk that *accepts every proposal*. The algorithm we run is a different Markov chain on the same state space.

#table(
  columns: 3,
  [], [Random transposition walk], [Metropolis chain],
  [Stationary distribution], [$U$], [$pi(f) prop "Pl"(f)$],
  [Move $f -> g = sigma f$], [$Q(sigma)$], [$Q(sigma) min(1, pi(g) / pi(f))$],
  [Structure], [convolution on a group], [rejection depends on the current state],
)

The first row is the main issue: Metropolis converges to $pi$, not to $U$. The third row is why the proof breaks. The walk in the theorem is a convolution, so Schur's lemma makes every $hat(Q)(rho)$ a scalar. With state-dependent rejections the kernel is no longer a convolution, and there is no such diagonalization. Also, $k$ proposals no longer means $k$ moves.

*Where does $pi$ peak?* Suppose the ciphertext of length $L$ was produced by encoding English text with a true key $f^*$, and suppose English really is well modeled by the digram chain $M$ with stationary distribution $mu$. By the law of large numbers, for any key $f$,
$ 1/L log "Pl"(f) -> sum_(a, b) mu(a) M(a, b) log M(f(a), f(b)), $
where $a, b$ range over the plaintext letters. By Gibbs' inequality this limit is largest at $f = f^*$, and strictly larger as long as $M$ is rich enough to tell $f^*$ apart from every other key. So under these assumptions $pi prop "Pl"$ concentrates on the correct key, and more sharply as $L$ grows.

*The uniform case is the flat limit.* Consider the tempered targets $pi_beta prop "Pl"^beta$. At $beta = 0$ the target is uniform, acceptance is always 1, and the chain is exactly the random transposition walk, so the Diaconis–Shahshahani theorem applies. At $beta = 1$ we get our algorithm. The decoding chain is therefore a deformation of the uniform case: the same proposals, with the flat target replaced by one peaked at $f^*$.

*What we lose.* The theorem no longer gives a sharp bound. Rejections slow the chain down, and a peaked $pi$ can have local maxima that trap it. We should expect $O(n log n)$ proposals to be the right scale as a heuristic, but we cannot guarantee it. This matches what we see in practice, where a few thousand steps suffice to decode English text.

== What made Z340 so much harder?
These types of randomized algorithms existed for quite a long time and by the late 2000s and certainly in the 2010s we had powerful enough computers that could break a standard homophonic encryption scheme, furthermore the problem was popular enough for amateurs to be interested in breaking the code. So what made Z340 all that different from other homophonic ciphers.

Suppose that Z340 was strictly a homophonic cipher, we can calculate what a upper bound on the unicity distance should be. There are 63 unique symbols in the cipher thus $ log K <= log_2 (26^63) = 63 log_2 (26) <= 63 * 5 = 315. $
Thus the unicity distance is $ "Unicity Distance" = (log K) / (D) <= (315) / (3) = 105. $ Thus if it was strictly a homophonic cipher we should have more than enough information such that the plausibility function should have a sharp peak at the correct key and the standard algorithms should have been able to find it comparatively quickly. Given the fact that Z408 was solved within days of publication, if Z340 was strictly a homophonic cipher it shouldn't have taken more than at most a couple of months for skilled individuals to break it. Furthermore, by the late 2000s, we had strong enough computers that breaking the cipher should have been trivial. We even had experimental evidence to support this claim, several Z340 like encoded text were tested on randomized and optimization based algorithms and were easily broken. However this didn't happen, which leads to the thought that either something more complicated is happening or the message is too corrupted with errors (spelling errors, typos, or a hoax) to be broken.

However several contextual clues hint toward the latter not being true:
1. A hidden regularity at a spacing of 19. In ordinary writing, a letter is strongly tied to the letter right after it, and much more weakly to letters further along. After a symbol-for-letter substitution, that same pattern should survive: the pairs that keep repeating should be the ones made of symbols sitting side by side, and pairs separated by larger gaps should repeat only at a low background rate. For Z340 that is not what we see. Symbols side by side look unremarkable, while symbols exactly 19 places apart repeat far more than at any other gap. In a plain homophonic cipher there is no reason for 19 to stand out, because nothing in a one-for-one symbol substitution creates a special relationship at that distance. Typos or a hoax would not create one either, since random errors blur patterns and do not build new ones. The simplest explanation is that the symbols were deliberately rearranged in a regular way, so that letters that were originally neighbors were moved to positions 19 apart.
2. Successful decryption of Z408 revealed it was designed with a real message, so Zodiac had already proved his ability to create a functioning cipher.
3. The code is given in a spatial pattern of a grid and is quite precise about it.
4. We hypothesize that Zodiac was motivated by attention, and wanted Z340 solved because it would get his name into the headlines not only after mailing it to the newspapers, but when a solution was found.

So clues pointed toward something where an additional complication was added, something to do with the positioning of the symbols. Classically, there is another known encryption technique called transposition cipher where you apply permutation of $S_N$ onto your string of length $N$. In 2014, a graduate student named Jeffery Yi suspected that a transposition cipher was used, which combined with a homophonic cipher leads to a blow up in the space of keys.

$ log K <= 296 + log(340!) approx 2670 => "Unicity Distance" approx 890 $

But as humans we like to go for perumutaions which are "simple" or just not too complicated. So maybe you can filter out complicated permutations and only keep the "simple ones". With about about 650,000 candidates is just $log_2 650000 ≈ 19$ extra bits which keeps the unity distance around 110. Moreover the fact that there is a spike at this spacing of 19 gives a clue that the permutations lead to this spacing of 19 between a letter and "whats supposed to be the next one".

