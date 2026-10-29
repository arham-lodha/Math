#import "@preview/polylux:0.4.0": *
#import "@preview/polylux:0.4.0": later as pl-later

// ---------------------------------------------------------------------------
// Theme
// ---------------------------------------------------------------------------

// Palette and type follow arham-lodha.github.io (css/style.css).
#let paper = rgb("#fffdf2")    // --color-bg
#let surface = rgb("#f3ead8")  // --color-surface
#let soft = surface
#let code-bg = rgb("#f0e7d5")  // --color-code-bg
#let border = rgb("#d7cab2")   // --color-border
#let rule = rgb("#cbbda3")     // --color-rule
#let ink = rgb("#171512")      // --color-text
#let heading = rgb("#11100d")  // --color-heading
#let muted = rgb("#676052")    // --color-muted
#let accent = rgb("#9f2f20")   // --color-accent
#let blue = rgb("#2f6f9f")     // --color-blue
#let green = rgb("#6f8068")    // --color-green

// ET Book lives in ./fonts (compile with `--font-path fonts`); Palatino is
// the site's own fallback, so the deck still builds without it.
#let font-body = ("ETBembo", "Palatino")
#let font-ui = ("Gill Sans", "Trebuchet MS")
#let font-mono = ("Menlo",)

// Site-style kicker: small uppercase Gill Sans.
#let kicker(body, fill: muted) = text(font: font-ui, size: 14pt, fill: fill, upper(body))

#set page(paper: "presentation-16-9", fill: paper, margin: (x: 2.4cm, top: 2.8cm, bottom: 1.7cm),
  footer: context {
    set text(font: font-ui, size: 11pt, fill: muted)
    line(length: 100%, stroke: 0.6pt + rule)
    v(-0.4em)
    [Arham Lodha #h(0.6em) · #h(0.6em) Z340]
    h(1fr)
    toolbox.slide-number
  },
)
#set text(font: font-body, size: 22pt, fill: ink)
#set par(leading: 0.62em)
#show math.equation: set text(font: "New Computer Modern Math")
#set list(marker: text(fill: muted)[•])
#set enum(numbering: n => text(font: font-ui, fill: muted)[#n.])
#show strong: set text(fill: accent)
#show table: set text(size: 20pt)

// Wrap in a block: a list inside a bare `later` merges into the list
// before it, and `hide` then leaves its bullets visible.
#let later(body) = pl-later(block(width: 100%, body))

// Speaker note for pdfpc. Emits the same metadata as polylux's
// `toolbox.pdfpc.speaker-note`, without its deprecated type check.
#let note(body) = [#metadata((t: "Note", v: body)) <pdfpc>]

// Content slide: blue section kicker over a regular-weight serif title,
// then a thin rule, like the site's `.section-kicker` + `h2`.
#let s(title, body) = slide[
  #place(top + left, dy: -2.05cm, kicker(toolbox.current-section, fill: blue))
  #place(top + left, dy: -1.55cm, text(size: 34pt, fill: heading)[#title])
  #place(top + left, dy: -0.3cm, line(length: 100%, stroke: 0.6pt + rule))
  #body
]

#let section(name, part: none, sub: none) = slide[
  #toolbox.register-section(name)
  #set align(horizon)
  #if part != none { kicker(part, fill: blue); v(-0.2em) }
  #text(size: 48pt, fill: heading)[#name]
  #if sub != none [ \ #text(size: 24pt, fill: muted, style: "italic")[#sub] ]
]

#let boxed(body, fill: surface) = block(width: 100%, inset: 14pt, radius: 3pt,
  fill: fill, stroke: 0.6pt + border, body)
// Theorem: like the site's `pre`, a surface block with a blue left bar.
#let thm(name, body) = block(width: 100%, inset: (x: 16pt, y: 12pt), radius: 3pt,
  fill: surface, stroke: (left: 3pt + blue, rest: 0.6pt + border),
  [#text(font: font-ui, fill: blue)[#upper(name)] \ #body])
#let small(body) = text(size: 17pt, body)
#let cipher(body) = block(width: 100%, inset: (x: 16pt, y: 12pt), radius: 3pt,
  fill: code-bg, stroke: (left: 3pt + blue, rest: 0.6pt + border),
  text(font: font-mono, size: 14pt, tracking: 0.5pt, body))
// Marks a slide that can be skipped on the fly; invisible in the deck,
// flagged in speaker-notes.pdf.
#let droppable = metadata("droppable")
#let credit(body) = text(font: font-ui, size: 10pt, fill: muted, body)

// ---------------------------------------------------------------------------
// Title
// ---------------------------------------------------------------------------

#slide[
  #set align(horizon)
  #block(width: 66%)[
    #kicker[Graduate seminar · UCLA]
    #v(0.2em)
    #text(size: 40pt, fill: heading)[How the Zodiac Z340 Cipher Was Finally Broken]
    #v(0.5em)
    #text(size: 23pt, fill: heading)[Information theory, Markov chains on groups, and a 51-year-old ciphertext.]
    #v(0.9em)
    #text(fill: muted)[Arham Lodha]
  ]
  #place(right + horizon, dx: 0.4cm, box(stroke: 0.6pt + border, image("images/z340.jpg", height: 82%)))
  #note("Abstract: four cryptograms, Z408 fell in a week (Hardens, 1969), Z340 held out 51 years until Oranchak, Blake and Van Eycke, December 2020. Today: how do you know an answer is unique, how do you search for it, and why Z340 was so much harder.")
]

// ---------------------------------------------------------------------------
// Part 0: the story
// ---------------------------------------------------------------------------

#section("The story", part: "Prologue", sub: "San Francisco Bay Area, 1968–1970")

#s("The Zodiac")[
  #toolbox.side-by-side(columns: (1.3fr, 1fr))[
    - Dec 1968 – Oct 1969: at least five people murdered around the Bay Area.
    - Letters to the _Chronicle_, _Examiner_ and _Vallejo Times-Herald_ taunting police.
    - Four cryptograms, named by length: *Z408*, *Z340*, *Z13*, *Z32*.
    - Never identified; the case is still open.
  ][
    #align(center, image("images/letter-june1970.jpg", height: 88%))
  ]
  #note("Keep this brief and sober. Lake Herman Road (Dec 1968), Blue Rock Springs (Jul 1969), Lake Berryessa (Sep 1969), Paul Stine in Presidio Heights (Oct 1969). The letter shown is from June 1970 and contains Z32 at the bottom.")
]

#s("Z408: solved in a week, by a schoolteacher")[
  #toolbox.side-by-side(columns: (0.8fr, 1.2fr))[
    #align(center, image("images/z408-1.jpg", width: 100%))
    #small[31 July 1969, one of three parts. Print it on the front page, or he kills again.]
  ][
    #set text(size: 19pt)
    - Donald and Bettye Harden, Salinas, August 1969.
    - Guessed the ego: starts with *"I"*, contains *"KILL"*.
    - 54 symbols for 26 letters (*homophones*), but still a substitution.
    #(cipher[
      I LIKE KILLING PEOPLE BECAUSE IT IS SO MUCH FUN IT IS MORE FUN THAN KILLING WILD GAME IN THE FORREST ... I WILL NOT GIVE YOU MY NAME BECAUSE YOU WILL TRY TO SLOI DOWN OR ATOP MY COLLECTIOG OF SLAVES FOR MY AFTERLIFE
    ])
  ]
  #note("Z408 was mailed in three parts to the Vallejo Times-Herald, SF Examiner and SF Chronicle, with the demand that it be printed on the front page: 'In this cipher is my idenity.' 408 symbols, 54 distinct ones. The final 18 letters EBEORIETEMETHHPITI have never been convincingly read. The misspellings are in the original. Frequency analysis plus a crib (a guessed word) is the 1969 method.")
]

#s("8 November 1969: Z340")[
  #toolbox.side-by-side(columns: (1fr, 1.4fr))[
    #align(center, image("images/z340.jpg", height: 92%))
  ][
    - 340 symbols, 20 rows × 17 columns, *63* distinct symbols.
    - Same alphabet of symbols as Z408, so people tried the Z408 key. Nonsense.
    - The FBI, the NSA and generations of amateurs: unsolved for *51 years*.
    #v(0.5em)
    #uncover(2)[Why? That is the talk.]
  ]
  #note("Mailed to the Chronicle with a 'dripping pen' greeting card. Many published 'solutions' over the years, none verifiable.")
]

#s("Z13 and Z32")[
  #align(center)[
    #image("images/z13.png", width: 70%)
    #small[Z13, April 1970: "My name is —"]
    #v(0.8em)
    #image("images/z32.png", width: 80%)
    #small[Z32, June 1970: "The map coupled with this code will tell you where the bomb is set."]
  ]
  #note("Just show them and move on. Part 1 opens by coming back to Z13: many consistent solutions, and whether the ciphertext can ever pick one.")
]

#s("Plan")[
  #droppable
  #set enum(spacing: 1em)
  + *Is there a unique answer?* Shannon: entropy, the AEP, unicity distance.
  + *How do we search for the key?* Metropolis on $S_26$, and Diaconis–Shahshahani.
  + *What made Z340 so much harder?* Homophones + transposition.
]

// ---------------------------------------------------------------------------
// Part 1: unique answer
// ---------------------------------------------------------------------------

#section("Is there a unique answer?", part: "Part 1", sub: "Shannon, 1948–49")

#s("How many answers fit?")[
  #set text(size: 20pt)
  // Glyph x-extents (px) in images/z13.png, 450 x 28.
  #let spans = ((1, 23), (43, 59), (81, 100), (108, 137), (147, 168), (185, 204), (218, 238),
    (255, 275), (291, 310), (323, 343), (362, 377), (392, 410), (429, 450))
  #let px = 0.042cm
  #let glyph(i) = {
    let (x0, x1) = spans.at(i)
    box(width: (x1 - x0 + 4) * px, height: 28 * px, clip: true,
      place(dx: -(x0 - 2) * px, image("images/z13.png", width: 450 * px)))
  }
  #let amber = rgb("#b07a1f")
  // Repeat classes: 1 = 12, 3 = 11, 5 = 7 = 9, 8 = 13.
  #let tint = (accent, none, blue, none, green, none, green, amber, green, none, blue, accent, amber)
  #let word = "STEVEPETEWEST"
  Z13 repeats only four symbols. Any 13 letters with the same coincidences fit a key:
  #v(-0.2em)
  #align(center, grid(columns: (1.7cm,) * 13, row-gutter: 0.25em, align: center + horizon,
    ..range(13).map(i => block(width: 100%, inset: (y: 4pt), radius: 3pt,
      fill: if tint.at(i) == none { none } else { tint.at(i).lighten(80%) }, glyph(i))),
    ..range(13).map(i => text(font: font-mono, size: 22pt,
      fill: if tint.at(i) == none { ink } else { tint.at(i) },
      weight: if tint.at(i) == none { "regular" } else { "bold" }, word.at(i))),
  ))
  #v(-0.4em)
  #later[
    #cipher[
      #set text(size: 14pt)
      #grid(columns: (1fr, 1fr, 1fr), row-gutter: 0.4em,
        [STEVE PETE WEST], [ADRIAN A HARRAH], [SHANNON E NEASE],
        [STEVE PETE BEST], [GARY LYLE LARGE], [ISRAEL E NEGRIN],
        [ASHLEY E MECHAM], [ELIJAH A RAPIER], [EDDIE GENE ODEN],
        [STEVE PETE VEST], [BARNEY E YEARBY], [GENE LYLE LANGE],
        [EDDIE GENE EDEN], [ED STEVEN EISEN], [E ALVA VANALLEN],
        [ANGELO LYLE GAY], [EDDIE RENE ODEN], [ISREAL A SARRIS],
      )
    ]
    #credit[A few of the proposed Z13 solutions: zodiackillerciphers.com/wiki, "Z13 Solutions".]
  ]
  #later[
    Every one is *consistent* with the ciphertext. So which is right? Maybe the ciphertext cannot tell. #h(0.3em) *When does it determine the answer?*
  ]
  #note("Opening question for Part 1. Consistency with the ciphertext is cheap when the ciphertext is short: these 18 all satisfy every constraint Z13 imposes (I checked each against the repeat pattern), and there are thousands more. A codebreaker who finds one consistent plaintext has not proved anything. So before asking how to search for a key, ask whether the ciphertext pins down a unique answer at all, and how long it has to be before it does. Shannon answers that with the unicity distance. Top row is the real Z13, cut glyph by glyph; colors mark repeated symbols and the letters they must share: red S at 1 and 12, blue E at 3 and 11, green E at 5, 7, 9, amber T at 8 and 13.")
]

#s("Entropy")[
  $X$ a random variable on a finite set $S$ (letters, cipher symbols). Logs base 2.
  $ H(X) = - sum_(x in S) Pr(X = x) log Pr(X = x) $
  - $X$ deterministic: $H = 0$. $X$ uniform: $H = log |S|$, the max.
  #note("$0 log 0 = 0$. Entropy measures randomness in bits: the average number of yes/no questions needed to pin down $X$.")
]

#s("Markov chains, and language as one")[
  #set text(size: 20pt)
  A *Markov chain* on finite $S$: $Pr(X_t = j | X_0, dots, X_(t-1)) = P_(X_(t-1) j)$.
  - *Stationary:* $pi P = pi$. *Irreducible:* all states communicate. *Aperiodic:* return times have gcd 1.
  - *Theorem.* Irreducible + aperiodic $=>$ unique stationary $pi$, and $Pr(X_t = j) -> pi_j$.
  - *Language:* a text is a sample $X_0, X_1, dots$ of letters. Bigram model: $P_(i j) = Pr(j "follows" i)$. The last $m$ letters: still Markov, on $S^m$.
  #later[
    #boxed[*Entropy rate:* $display(H = lim_(n -> oo) H(X_1, dots, X_n) / n = - sum_i pi_i sum_j P_(i j) log P_(i j))$]
  ]
  #note("Time-homogeneous chains only. Aperiodicity rules out e.g. a chain bouncing between two states. The convergence theorem gives long-run letter frequencies ($pi$ for English bigrams, which are irreducible and aperiodic), and later says where a sampler ends up. English is not exactly Markov, but this captures the structure that matters. The entropy rate is the average uncertainty in the next symbol given the current one; for i.i.d. symbols it is just $H(X)$.")
]

#s("Cipher systems and redundancy")[
  #set text(size: 21pt)
  *Shannon:* messages $M = S^n$ with the language's distribution; keys $cal(K)$ (uniform); injective $E_k : M -> C$.
  - Substitution cipher: $cal(K) = S_26$, $log 26! approx 88$ bits. Hopeless to brute force... but first ask:
  #boxed[Given the ciphertext $c$, is there only one key that produces a *sensible* plaintext?]
  #later[
    - *Redundancy* $D = log |S| - H$. English: $H approx 1$ to $1.5$, $log 26 approx 4.7$, so $D approx 3$ to $3.7$ bits per letter.
  ]
  #note("Shannon, _A Mathematical Theory of Communication_ (1948); _Communication Theory of Secrecy Systems_ (1949). Before searching, check the problem is well posed: a unique answer exists when the ciphertext carries more information than the cipher system can hide. Shannon developed exactly this theory in the 1949 secrecy paper. A message $m$ and an independent key $k$ are chosen; the codebreaker sees only $c = E_k (m)$. Redundancy measures how far English is from random text.")
]

#s("The AEP and typical sequences")[
  #thm("Theorem (Shannon–McMillan–Breiman, Markov case)")[
    $X$ irreducible, aperiodic Markov chain on finite $S$. Then almost surely
    $ -1/n log Pr(X_0, X_1, dots, X_n) --> H. $
  ]
  #later[
    *Typical set* $A_epsilon^n = {x : 2^(-n(H + epsilon)) < Pr(x) < 2^(-n(H - epsilon))}$: $Pr(A_epsilon^n) -> 1$ and $|A_epsilon^n| approx 2^(n H)$.
    #boxed[
      #align(center)[
        $underbrace(2^(n H), "typical texts") #h(1em) lt.double #h(1em) underbrace(2^(n log |S|), "all strings")$ #h(1.5em) #small[English: $2^(1 dot n)$ vs. $2^(4.7 n)$]
      ]
    ]
  ]
  #note("Proof of the AEP: by the Markov property $Pr(X_0, dots, X_n) = Pr(X_0) product_k P_(X_(k-1) X_k)$. Take $-1/n log$: the $Pr(X_0)$ term goes to $0$, the rest is a time average of $f(i, j) = -log P_(i j)$. The pair chain $(X_(k-1), X_k)$ is ergodic with stationary law $pi_i P_(i j)$, so by the ergodic theorem the time average converges to $sum_(i, j) pi_i P_(i j) f(i, j) = H$. Typical set: (1) a.s. convergence implies convergence in probability, so $Pr(A_epsilon^n) -> 1$. (2) Each typical $x$ has $Pr(x) > 2^(-n(H + epsilon))$ and probabilities sum to at most 1, so $|A_epsilon^n| <= 2^(n(H + epsilon))$. (3) For $n$ large $Pr(A_epsilon^n) > 1 - epsilon$ and each $Pr(x) < 2^(-n(H - epsilon))$, so $|A_epsilon^n| >= (1 - epsilon) 2^(n(H - epsilon))$. Upshot: a long text is almost surely one of about $2^(n H)$ roughly equally likely strings, an exponentially small fraction of everything.")
]

#s("Unicity distance")[
  A wrong key decrypts to something like a random string: typical with probability $approx 2^(-n D)$.
  $ EE[\#"wrong keys giving typical text"] approx K dot 2^(-n D) $
  #later[
    This is $lt.double 1$ once
    #boxed[$ n > U = (log K) / D quad "(unicity distance)" $]
  ]
  #later[
    Past $U$ letters, the key is unique with probability close to 1. Below $U$, many keys fit and *no amount of cleverness* can pick the right one.
  ]
  #note("Heuristic: wrong decryptions behave like uniform random strings, and a uniform string is typical with probability $|A_epsilon^n| \/ |S|^n approx 2^(-n(log |S| - H)) = 2^(-n D)$.")
]

#s("The numbers")[
  #table(columns: (auto, auto, auto, auto), inset: 10pt, stroke: none,
    align: (left, center, center, center),
    table.hline(stroke: 1pt + ink),
    [*Cipher*], [*$log K$ (bits)*], [*$U approx log K \/ 3$*], [*length*],
    table.hline(stroke: 0.5pt + muted),
    [Simple substitution], [$log 26! approx 88$], [$approx 29$], [a tweet],
    [Z408 (54 symbols)], [$<= 54 log 26 approx 254$], [$<= 85$], [*408*],
    [Z13], [$>= $ huge], [$gt.double 13$], [13],
    [Z32], [$>=$ huge], [$gt.double 32$], [32],
    table.hline(stroke: 1pt + ink),
  )
  - Z408 is $approx 5 times$ its unicity distance: the Hardens' answer is *forced*. Slack for misspellings still leaves $U lt.tilde 157$.
  - Z13, Z32: not unsolved, *unsolvable*.
  #note("In the notes I bounded $54 log 26 <= 54 dot 5 = 270$, giving $U <= 90$; either way 408 is several times larger. We are overcounting keys (every map from 54 symbols to 26 letters) and using English redundancy, which is not exactly Zodiac's. Z13 needs only 13 letters and has fewer than $U$'s worth even for a simple substitution.")
]

// ---------------------------------------------------------------------------
// Part 2: search
// ---------------------------------------------------------------------------

#section("How do we search for the key?", part: "Part 2", sub: "Markov chain Monte Carlo")

#s("The Metropolis algorithm")[
  Keys $f : cal(C) -> cal(A)$, far too many to enumerate. Suppose an oracle gives the *plausibility* $"Pl"(f)$ of the decoded text.
  #boxed[
    + Start with any key $f$.
    + Pick a random transposition $sigma in S_26$ and let $f_sigma = sigma compose f$.
    + Move to $f_sigma$ with probability $min(1, "Pl"(f_sigma) \/ "Pl"(f))$; otherwise stay at $f$. Repeat.
  ]
  $sigma = sigma^(-1)$, so $f -> f_sigma$ is picked as often as $f_sigma -> f$, and the chain has stationary law $pi(f) prop "Pl"(f)$.
  #note("No known structure to exploit, so brute force is out. The chain concentrates on keys whose decodings look like English. Reference: Diaconis, The Markov chain Monte Carlo revolution, which opens with exactly this prison-cipher example.")
]

#s("A plausibility model")[
  Bigram matrix $M$ ($26 times 26$), $M_(i j)$ = frequency of $j$ after $i$ in a reference text. For ciphertext $s_1 s_2 dots s_L$:
  $ "Pl"(f) = product_(i=1)^(L-1) M(f(s_i), f(s_(i+1))) $
  - Smooth $M$ so no entry is 0; work with $log "Pl"$.
  - Better model $=>$ sharper target $=>$ faster search. (Z340 used 5-grams and up.)
  #note("Smoothing avoids undefined ratios; logs avoid underflow. The better the language model, the faster we expect convergence.")
]

#s("An analogous problem: shuffling by transpositions")[
  Drop the plausibility and *always* apply the transposition: the *random transposition walk* on $S_n$,
  $ Q(sigma) = cases(1/n & sigma = e, 2/n^2 & sigma "a transposition", 0 & "otherwise") $
  #thm("Theorem (Diaconis–Shahshahani, 1981)")[
    For $k = 1/2 n log n + c n$, $c > 0$: $quad norm(Q^(* k) - U)_(L^1) <= a e^(-2 c)$.
  ]
  #later[For the alphabet, $n = 26$: about $42 + 26 c$ transpositions reach every key with nearly equal probability.]
  #note("Cutoff, only if asked: for $c < 0$ the walk is still far from uniform, so the transition at $1/2 n log n$ is sharp. $a$ is a universal constant. Metropolis does not accept every transposition, so this is not our chain: it is the analogous chain with a flat target. The proof is Fourier analysis on $S_n$: $Q$ is a class function so its Fourier transform is scalar on each irreducible, and the $(n-1, 1)$ representation dominates.")
]

#s([Why $1/2 n log n$?])[
  - *Diagonalize:* $Q$ is a class function, so by Schur $hat(Q)$ acts on each irreducible $rho_lambda$, $lambda tack.r n$, as a scalar $r_lambda$. One eigenvalue per partition.
  - *Slowest mode:* $lambda = (n - 1, 1)$, with $r = 1 - 2/n$ and multiplicity $(n-1)^2$:
    $ (n-1)^2 (1 - 2/n)^(2k) approx n^2 e^(-4k\/n) quad "is small iff" quad k > 1/2 n log n. $
  #note("Details. Upper bound lemma (Cauchy–Schwarz + Plancherel): $ norm(Q^(* k) - U)^2 <= sum_(rho != \"triv\") d_rho op(\"Tr\")(hat(Q)(rho)^k (hat(Q)(rho)^*)^k) = sum_(lambda != (n)) d_lambda^2 r_lambda^(2k) $ Frobenius: $r_lambda = 1/n + 2/n^2 sum_((i, j) in lambda) (j - i)$ (box contents). Level-$j$ partitions $(n - j, mu)$ contribute about $e^(-4 c j) \/ j!$, so the $(n-1, 1)$ term dominates and the total is $O(e^(-4c))$, giving $a e^(-2c)$. Lower bound: $op(\"fix\")(sigma) = chi_((n-1, 1))(sigma) + 1$ has mean 1 and variance 1 under $U$; after $k$ steps its mean is $1 + (n-1) r^k approx 1 + e^(-2c)$, far off when $c lt.double 0$. Cutoff intuition, only if asked (coupon collector): each step touches 2 cards; until every card is touched (about $1/2 n log n$ steps), the untouched ones are still fixed points, too many for a uniform permutation.")
]

#s("But we don't run that walk")[
  #droppable
  #table(columns: (auto, 1fr, 1fr), inset: 10pt, stroke: none, align: left,
    table.hline(stroke: 1pt + ink),
    [], [*Random transpositions*], [*Metropolis*],
    table.hline(stroke: 0.5pt + muted),
    [Stationary law], [$U$], [$pi(f) prop "Pl"(f)$],
    [Move $f -> sigma f$], [$Q(sigma)$], [$Q(sigma) min(1, pi(sigma f) \/ pi(f))$],
    [Structure], [convolution on a group], [rejection depends on state],
    table.hline(stroke: 1pt + ink),
  )
  - Not a convolution on the group: Schur no longer diagonalizes the walk, so the proof does not carry over.
  #note("First row: Metropolis converges to $pi$, not $U$. Third row: why the proof breaks. Also, Metropolis refuses some transpositions, so $k$ steps is not $k$ moves.")
]

#s([Where does $pi$ peak?])[
  #droppable
  Ciphertext of length $L$ = English (modeled by $M$, stationary $mu$) encrypted by the true key $f^*$. By the LLN, for any key $f$:
  $ 1/L log "Pl"(f) --> sum_(a, b) mu(a) M(a, b) log M(f(a), f(b)). $
  - *Gibbs:* largest at $f = f^*$, so $pi prop "Pl"$ concentrates on $f^*$, sharper as $L$ grows.
  #later[
    #boxed[*Tempering* $pi_beta prop "Pl"^beta$: $beta = 0$ is the uniform shuffle (D–S applies), $beta = 1$ is our algorithm.]
  ]
  #note("$a, b$ range over plaintext letters. Strict maximum needs $M$ rich enough to tell $f^*$ apart from every other key. Tempering: same proposals, the flat target deformed into one peaked at $f^*$. Simulated annealing (used on Z340) varies $beta$ over time.")
]

#s("A peaked target we can analyze")[
  #droppable
  #set text(size: 19pt)
  *Mallows model:* $pi_theta (sigma) prop theta^(d(sigma, sigma_0))$, $0 < theta <= 1$, $d$ = Cayley distance. Peaked at $sigma_0$, like $"Pl"$ at $f^*$. Same Metropolis chain.
  #thm("Theorem (Diaconis–Hanlon, 1992)")[
    From $sigma_0$, $k = a(theta) n log n + c n$ steps bring the chain within $f(theta, c) -> 0$ ($c -> oo$) of $pi_theta$, where $a(theta) = 1/(2 theta) + 1/(4 theta) (1/theta - theta)$. Order $n log n$ steps are also necessary.
  ]
  #later[
    - $theta = 1$: $a = 1/2$, exactly Diaconis–Shahshahani.
    - From far away (an $n$-cycle): order $n^2 log n$. For $n = 26$: $approx 85$ vs. $approx 2200$ steps.
  ]
  #note("Why it is still solvable: the Cayley metric is bi-invariant, so the kernel commutes with conjugation and reduces to conjugacy classes, i.e. partitions. Eigenvalues $beta_lambda = (1 - theta) + (theta n(lambda^t) + n(lambda)) \/ binom(n, 2)$, with $n(lambda) = sum_i (i - 1) lambda_i$; eigenvectors come from Jack symmetric functions (Schur functions at $theta = 1$). Cayley distance $d$ = fewest transpositions from $sigma$ to $sigma_0$; Metropolis accepts a move closer to $sigma_0$, otherwise flips a $theta$-coin. Source: Diaconis, _MCMC revolution_, §3, Theorem 2; the survey prints $f -> 0$ for $c -> 0$, a typo for $c -> oo$. Caveat: $op(\"Pl\")$ is not a Mallows model and can have local maxima, so for decoding $n log n$ stays a heuristic, but now one backed by a theorem for a peaked target. Restarts and annealing handle local maxima. In practice a few thousand steps decode English, matching the $n^2 log n$ scale from a bad start.")
]

// ---------------------------------------------------------------------------
// Part 3: Z340
// ---------------------------------------------------------------------------

#section("What made Z340 so much harder?", part: "Part 3", sub: "Homophones and a transposition")

#s("So it should have been solvable...")[
  Homophonic substitution only:
  $ log K <= 63 log 26 approx 296 "bits", quad U approx 296 / 3 approx 99 lt.double 340. $
  So $pi$ should have a sharp peak at the true key.
  #later[
    - Z408 fell in *days*. By the late 2000s, computers ran the MCMC search from Part 2 easily.
    - Test ciphers built like Z340 were broken quickly. Z340 itself: *nothing*.
  ]
  #later[
    #boxed[Either the cipher is *more than* homophonic substitution, or the message is too corrupted (typos, misspellings, a hoax) to break.]
  ]
  #note("Unicity says the answer is determined; search found nothing. That contradiction is itself evidence the model of the cipher is wrong. Cruder bound from the notes: $63 dot 5 = 315$ bits, $U <= 105$; same conclusion. Homophones flatten the histogram: 63 symbols over 340 positions is about 5.4 occurrences per symbol (Z408: about 7.6), so plain frequency analysis sees a nearly flat histogram. Test ciphers: Berg-Kirkpatrick et al. (2013) argued Z340 is not strictly homophonic because Z340-like test ciphers are solved automatically.")
]

#s("Errors, or a hidden step?")[
  Clues against corruption:
  + *A spike at spacing 19.* Errors blur patterns; they do not build new ones.
  + *Z408 had a real message:* he could build a working cipher.
  + *A precise 20 × 17 grid:* the layout looks deliberate.
  + *He wanted attention:* a solved cipher means more headlines.
  #later[
    #boxed[The extra complication is about the *positions* of the symbols: a *transposition* (suspected by Jeffery Yi, 2014).]
  ]
]

#s("Transpositions blow up the key space")[
  Also permute the 340 positions by an *arbitrary* $sigma in S_340$:
  $ log K approx 296 + underbrace(log(340!), approx 2374) approx 2670 "bits", quad U approx 2670 / 3 approx 890 gt.double 340. $
  #later[
    #boxed[General transposition + homophonic, length 340: *unsolvable in principle*.]
  ]
  #later[
    But people pick *simple* permutations: sectioning + a regular transposition + word reversals cost only $approx 22$ extra bits, so $U approx 318 \/ 3 approx 106$.
  ]
  #note("This is the payoff of Part 1: unicity tells you which hypotheses about the cipher are even worth testing. The search over transpositions has to be over a small, guessable family, and the spacing-19 spike says which kind. The 22 bits: von zur Gathen counts $log_2 (26 dot 167) approx 14.7$ bits for splitting into up to 3 sections and $log_2 208 approx 7.7$ for transpositions up to 51 places plus word reversals.")
]

#let paper-credit = credit[Figure: Oranchak, Blake, Van Eycke, arXiv:2403.17350 (2024).]

#s("The clue: period 19")[
  Repeated pairs $(c_i, c_(i+p))$ at each spacing $p$ (red: shuffle average).
  #grid(columns: (1fr, 1fr), gutter: 14pt, align: center,
    image("images/period-z408.png", height: 4.4cm),
    image("images/period-z340.png", height: 4.4cm),
    small[Z408: peak at $p = 1$ (62).], small[Z340: $p = 1$ is 25; *$p = 19$* is 37.],
  )
  #v(-0.6em)
  #align(right, paper-credit)
  #v(-0.4em)
  #later[
    #small[At $p = 1$: shuffled Z340 *20*, Z340 as written *25*, Z340-like test ciphers *34.5*. At $p = 19$: *37*.] \
    In reading order Z340 looks almost random; plaintext neighbors were *moved* 19 apart.
  ]
  #note("Fig. 24 and Fig. 26 of the solvers' paper. Nothing in a one-for-one substitution singles out 19, and errors would not create such a spike. Spotted by Van Eycke and 'daikon', independently, summer 2015; both first suspected columnar transposition, which failed. Z340 at period 1 is only 1.36 standard deviations above the shuffle mean; Z408 at period 1 is 7.52 standard deviations above. Test ciphers: 1,000 artificial homophonic ciphers of length 340 with known English plaintexts.")
]

#let diag-grid(rows: 9, cols: 17, shown: 40) = {
  // k-th plaintext letter sits at (k mod rows, 2k mod cols)
  let order = (:)
  for k in range(rows * cols) {
    order.insert(str(calc.rem(k, rows)) + "," + str(calc.rem(2 * k, cols)), k)
  }
  grid(columns: (1.15em,) * cols, rows: (1.15em,) * rows, stroke: 0.4pt + muted,
    ..range(rows * cols).map(i => {
      let k = order.at(str(calc.quo(i, cols)) + "," + str(calc.rem(i, cols)))
      if k < shown {
        box(width: 100%, height: 100%, fill: accent.lighten(100% - 85% * (shown - k) / shown),
          align(center + horizon, text(size: 9pt, fill: white, weight: "bold", str(k + 1))))
      } else { [] }
    })
  )
}

#s("The scheme")[
  #toolbox.side-by-side(columns: (auto, 1fr))[
    #diag-grid()
    #small[Reading order for a 9 × 17 block (first 40 letters).]
  ][
    #set text(size: 19pt)
    - Sections: rows 1–9, 10–18, 19–20.
    - Sections 1, 2: *one down, two right*, wrapping.
    - $17(r + 1) + (c + 2)$ \ $= i + 19$.
    - "LIFE IS" left out of section 2.
    - Rows 19–20: nearly in order.
  ]
  #note("Full transposition: Fig. 43 of the solvers' paper (`images/transposition.png`). Sections 1 and 2 are $(1, 2)$-decimations. In the last two rows some chunks are reversed. Since $gcd(9, 17) = 1$ the diagonal walk visits every cell of a $9 times 17$ block exactly once. Procedure: start at position 1, write the symbol, move down one (wrapping), right two (wrapping), repeat.")
]

#s("Encoding slips")[
  #droppable
  #toolbox.side-by-side(columns: (1fr, 1.1fr))[
    #image("images/garbled.png", height: 88%)
  ][
    - Words garbled on line 15 (row 6 of Section 2): NOW, ENOUGH, SLAVES, FOR.
    - Cause: Zodiac *skipped a symbol* on that line.
    - Fix: circularly right-shift RATENYRNOSRVSH within the line.
    #v(0.4em)
    #small[Errors do happen, but they are local: they garble a line, not the whole message.]
    #v(0.4em)
    #paper-credit
  ]
  #note("Fig. 42. Found by Van Eycke. The reading direction runs down-right through the grey line, so one skipped symbol garbles one letter in each of several words.")
]

#s("The search, in practice")[
  - *Blake:* generate a large family of plausible transpositions.
  - *Van Eycke's AZdecrypt:* for each candidate, solve the homophonic substitution by *simulated annealing* with an *n-gram* model.
  - That inner solver is the Metropolis chain from Part 2: higher-order Markov plausibility, tempered over time.
  - *Oranchak:* read the outputs and spotted phrases.
  #note("Outer loop: a structured, finite family of transpositions. Inner loop: MCMC over homophonic keys. Unicity says the true transposition, once tried, gives a uniquely determined, high-plausibility plaintext.")
]

#s("The plaintext")[
  #(cipher[
    I HOPE YOU ARE HAVING LOTS OF FUN IN TRYING TO CATCH ME \
    THAT WASNT ME ON THE TV SHOW \
    WHICH BRINGS UP A POINT ABOUT ME \
    I AM NOT AFRAID OF THE GAS CHAMBER \
    BECAUSE IT WILL SEND ME TO PARADICE ALL THE SOONER \
    BECAUSE I NOW HAVE ENOUGH SLAVES TO WORK FOR ME ...
  ])
  - The "TV show": a caller claiming to be the Zodiac on a talk show, Oct 1969.
  - Consistent with Z408's "slaves for my afterlife". No name, of course.
  #note("Shown with the original typos corrected; the raw decryption reads e.g. FAN, BRINGO, BECAASE, PARADLCE, SOOHER, WORV (von zur Gathen, p. 3). It continues: WHERE EVERYONE ELSE HAS NOTHING WHEN THEY REACH PARADICE SO THEY ARE AFRAID OF DEATH I AM NOT AFRAID BECAUSE I KNOW THAT MY NEW LIFE IS LIFE WILL BE AN EASY ONE IN PARADICE DEATH.")
]

#s("The solution is certified")[
  #toolbox.side-by-side(columns: (1.35fr, 1fr))[
    #table(columns: (1fr, auto), inset: 8pt, stroke: none, align: (left, right),
      table.hline(stroke: 1pt + ink),
      [*Key component*], [*bits*],
      table.hline(stroke: 0.5pt + muted),
      [Homophonic substitution], [$296.1$],
      [Sectioning (up to 3)], [$14.7$],
      [Transposition + reversals], [$7.7$],
      [Up to 25 letter errors], [$244.1$],
      table.hline(stroke: 0.5pt + muted),
      [*Total* $log K$], [$562.6$],
      table.hline(stroke: 1pt + ink),
    )
  ][
    #later[
      #boxed[#align(center)[$U approx 152 < 340$]]
      #small[$H = 1.36$: $U approx 132$. \ $H = 2.30$: $U approx 183$.]
    ]
  ]
  #later[
    The structure costs $22$ bits, not $log 340! approx 2374$. Even generous error slack leaves $U$ well under 340: the December 2020 plaintext is *the* solution.
  ]
  #v(0.2em)
  #small[J. von zur Gathen, _Unicity distance of the Zodiac-340 cipher_, IACR ePrint 2021/1620.]
  #note("Closes the loop with Part 1: same argument as for Z408, now for the structured transposition family. Compare $U approx 890$ for an arbitrary transposition. His formula differs slightly from our $log K \/ D$: he treats ciphertext symbols as uniform ($log_2 63 approx 5.98$ bits each) and the plaintext as 430 characters including blanks, so $U = I(\"key\") \/ (log_2 63 - 430/340 dot H) = 562.6 \/ (5.98 - 1.8 dot 430/340) approx 152$, with $H = 1.8$ measured on the Zodiac's own letters. Robustness: $H = 1.36$ gives 132, $H = 2.30$ gives 183. Error slack: 25 replacements, $log_2 (binom(340, 25) dot 27^25) approx 244$ bits.")
]

#s("Takeaways")[
  #set text(size: 20pt)
  #set enum(spacing: 0.8em)
  + *Uniqueness first.* Unicity distance $(log K) \/ D$ says when a solution can be certified: Z408 yes, Z13 no, Z340 only under a structured transposition.
  + *Search with Markov chains.* Metropolis over keys: order $n log n$ steps for the uniform (D–S) and a model peaked (D–H) target.
  + *Z340 needed both:* information theory to pick hypotheses, MCMC to test them.
  #later[
    #boxed[
      #kicker(fill: accent)[Open questions] \
      - No theorem bounds Metropolis mixing for a *realistic* language target.
      - Is there a *different* well-specified cipher system, with a similarly small unicity distance, giving another sensible Z340 plaintext?
    ]
  ]
  #note("Peroration: never drop this slide. End here, then stop; the chair takes questions. Open question 1: Diaconis–Hanlon covers only the Mallows model, and $op(\"Pl\")$ is not Mallows and can have local maxima, which is why $n log n$ stays a heuristic for decoding. Open question 2 is von zur Gathen’s closing question; a competing solution would need its own system with unicity distance below 340 (ideally near 152).")
]

#s("References")[
  #set text(size: 16pt)
  - C. E. Shannon, _A Mathematical Theory of Communication_, Bell Syst. Tech. J. (1948).
  - C. E. Shannon, _Communication Theory of Secrecy Systems_, Bell Syst. Tech. J. (1949).
  - T. Cover, J. Thomas, _Elements of Information Theory_, ch. 3–4, 16.
  - P. Diaconis, M. Shahshahani, _Generating a random permutation with random transpositions_, Z. Wahrsch. (1981).
  - P. Diaconis, P. Hanlon, _Eigen-analysis for some examples of the Metropolis algorithm_, Contemp. Math. 138 (1992).
  - P. Diaconis, _The Markov chain Monte Carlo revolution_, Bull. AMS (2009).
  - D. Oranchak, S. Blake, J. Van Eycke, _The Solution of the Zodiac Killer's 340-Character Cipher_, Cryptologia (2024); arXiv:2403.17350.
  - J. von zur Gathen, _Unicity distance of the Zodiac-340 cipher_, IACR ePrint 2021/1620 (2021).
  #v(1em)
  #credit[Cipher images: Wikimedia Commons (public domain), except the Z340 key (CC BY-SA 4.0). Charts and transposition figures: Oranchak, Blake, Van Eycke (2024).]
]
