// Printable speaker notes for the board talk, in the style of
// ../Zodiac/speaker-notes.typ. There is no deck to generate them from, so the
// notes are typed here directly with `#section` and `#beat`.
//   typst compile --font-path ../Zodiac/fonts speaker-notes.typ

// Standard prelude (CC, Hom, Hilb, frak/cal aliases, ...), plus the talk's
// own HBM / HBMk from template.typ.
#import "@local/my-prelude:1.0.0": *
#import "template.typ": HBM, HBMk

#let accent = rgb("#9f2f20")
#let blue = rgb("#2f6f9f")
#let green = rgb("#6f8068")
#let muted = rgb("#676052")
#let rule = rgb("#cbbda3")
#let surface = rgb("#f3ead8")

#set page(paper: "us-letter", margin: (x: 2cm, y: 1.8cm), footer: context {
  set text(font: ("Gill Sans", "Trebuchet MS"), size: 8pt, fill: muted)
  [Correspondences and convolution · speaker notes #h(1fr) #counter(page).display()]
})
#set text(font: ("ETBembo", "Palatino"), size: 11pt)
#set par(justify: true, leading: 0.55em)
#show math.equation: set text(font: "New Computer Modern Math")

#let ui(body, ..args) = text(font: ("Gill Sans", "Trebuchet MS"), ..args, body)
#let badge(body, fill: accent) = box(inset: (x: 4pt, y: 2pt), radius: 2pt, fill: fill, ui(
  size: 8pt,
  fill: white,
  upper(body),
))

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

// Section bar: part kicker, name, and the clock time you should be at.
#let section(name, part: none, at: none) = block(
  width: 100%,
  inset: (x: 8pt, y: 6pt),
  fill: surface,
  stroke: (left: 3pt + blue),
  sticky: true,
  breakable: false,
  above: 1.1em,
)[
  #ui(size: 9pt, fill: blue)[#upper(if part != none { part } else { "" })] \
  #text(size: 13pt)[#name] #h(1fr)
  #if at != none { ui(size: 10pt, fill: accent)[at #at] }
]

#let beat-counter = counter("beat")

// One beat of the talk. `min`: planned minutes. `panel`: board panel (A–D).
// `cut`: a number gives its place in the cut order (1 = cut first), `true`
// just marks it cuttable. `never-cut`: flag beats that must survive.
#let beat(title, min: none, panel: none, cut: none, never-cut: false, body) = {
  beat-counter.step()
  block(width: 100%, breakable: false, above: 0.7em, below: 0.7em)[
    #grid(
      columns: (2.2em, 1fr),
      column-gutter: 6pt,
      ui(size: 13pt, fill: accent)[#context beat-counter.display()],
      [
        #text(size: 12pt, weight: "bold")[#title]
        #h(1fr)
        #if never-cut {
          badge[never cut]
          h(4pt)
        }
        #if cut != none {
          badge(if type(cut) == int [cut #cut] else [cuttable], fill: muted)
          h(4pt)
        }
        #if panel != none {
          badge([panel #panel], fill: blue)
          h(4pt)
        }
        #if min != none { ui(size: 9pt, fill: muted)[#min min] }
        #v(-0.3em)
        #body
      ],
    )
    #v(0.1em)
    #line(length: 100%, stroke: 0.4pt + rule)
  ]
}

// Inside a beat:
// Words to say verbatim (opener, high-point sentences, the ending).
#let say(body) = block(inset: (left: 8pt), stroke: (left: 2pt + accent), above: 0.5em, below: 0.5em, emph(body))
// What goes on the board, exactly as written.
#let board(body) = block(
  width: 100%,
  inset: (x: 8pt, y: 5pt),
  radius: 2pt,
  fill: surface,
  above: 0.5em,
  below: 0.5em,
)[#ui(size: 8pt, fill: blue)[BOARD] \ #body]
// Stop and let it land.
#let pause = ui(size: 9pt, fill: accent)[ ‖ PAUSE ‖ ]
// Point back at something already on the board.
#let point(body) = ui(size: 9pt, fill: green)[→ #body]
// Ready if asked; not said otherwise.
#let if-asked(body) = block(above: 0.4em, below: 0.4em, text(size: 9.5pt, fill: muted)[#ui(size: 8pt)[IF ASKED] #h(
    4pt,
  ) #body])

// ---------------------------------------------------------------------------
// Notes
// ---------------------------------------------------------------------------

#align(center)[
  #text(size: 18pt)[Borel–Moore homology, correspondences and convolution] \
  #ui(size: 10pt, fill: muted)[SPEAKER NOTES · 50 MIN · BLACKBOARD · 25 NOVEMBER 2026]
]
#v(0.6em)

#section("Before the talk", part: "Setup")

#beat("Before the talk: checklist")[
  - Fill in the names for every "[speaker]" (seminar map, 5.1).
  - Did the Nakajima-varieties talk define Hecke correspondences? If yes, §6 says "recall".
  - Their stability convention: with $j$ injective, a subrep gives $U subset U'$; otherwise the
    inclusions reverse (§6).
  - A#sub[2] example: the $-C$ remark is "verify first". Unchecked means skip it.
]

#beat("Board prep")[
  Eight panels: four sliding boards, two halves each. *Front and back of one side are never visible
  together*, so at any moment you see one board on the left and one on the right.
  #table(
    columns: (auto, 1fr, 1fr),
    stroke: 0.4pt + rule,
    inset: 4pt,
    [], ui(size: 9pt)[*left half*], ui(size: 9pt)[*right half*],
    ui(size: 9pt)[left, front],
    [*A* seminar map (whole talk; §6 fills the "?")],
    [*B* §2 finite sets; subset-$frak(s l)_2$ box. Erased for §6],

    ui(size: 9pt)[left, back],
    [*C* dictionary: finite sets $->$ spaces (§2–§4)],
    [*D* §3 BM definition + toolkit. 5.3 and 5.5 after erasing],

    ui(size: 9pt)[right, front],
    [*E* §3 boxed theorem + intersection. Asides go below],
    [*F* §4 definition, graphs/unit],

    ui(size: 9pt)[right, back],
    [*G* §4 $Z = M times_N M$, algebra, module, Lagrangian],
    [*H* A#sub[1] picture, *pre-drawn, covered*. Grid (5.2), table (5.4), arrows (5.5)],
  )
  What is showing, section by section:
  #table(
    columns: (auto, 1fr, 1fr),
    stroke: 0.4pt + rule,
    inset: 4pt,
    [], ui(size: 9pt)[*left*], ui(size: 9pt)[*right*],
    [§1–§2], [A|B, then C|D for the dictionary], [—],
    [§3], [C|D], [E|F],
    [§4], [C|D], [E|F, then G|H from the algebra],
    [§5], [C|D (erase D for 5.3)], [G|H],
    [§6–§7], [A|B (erase B for the theorem)], [G|H],
  )
  - A pointer to a hidden panel is *said*, not pointed at.
  - *Pre-draw on H:* the cone $N = {x^2 = 0}$; above $0$, the fibre $"pt"_0 quad PP^1 quad "pt"_2$,
    labelled $M(0), M(1), M(2)$. Use the same labels as 5.1/5.2.
  - Leave room under the "?" on A for the final line.
  - Chalk in two colours, an eraser, and a watch on the table next to these notes.
]

#section("Where we are", part: "§1", at: "0:00")

#beat("The seminar map", min: 3, panel: "A", never-cut: true)[
  Start at the blank panel A and say this before writing anything:
  #say[Today we'll be talking about Borel–Moore homology. Throughout this quarter we've been
    constructing a variety whose geometry should give us a representation we want. Let me
    remind you how we got here.]
  Then the map: two branches out of the quiver, one per earlier talk, meeting at the "?". Name the
  speaker as you write each line. Geometry branch on the left, algebra on the right. Leave room
  under the "?": §6 fills it in, and §7 points back here.
  #board[
    #grid(
      columns: (1fr, 1fr),
      column-gutter: 14pt,
      row-gutter: 6pt,
      align: center,
      grid.cell(colspan: 2)[quiver $Q$ (vertices $I$)],
      [$arrow.bl$], [$arrow.br$],
      [quiver reps], [Cartan matrix $C$],
      [$arrow.b$ framing, $mu^(-1)(0)$, GIT], [$arrow.b$],
      [$pi : M(v, w) -> M_0(v, w)$ proper], [$frak(g)$ Kac–Moody],
      [$frak(L)(v, w) = pi^(-1)(0)$], [$arrow.b$],
      [e.g. $T^*"Gr"(k, n)$, $"Hilb"^n CC^2$], [$L(w)$, irreducible, highest weight $w$],
      [$arrow.br$], [$arrow.bl$],
      grid.cell(colspan: 2)[#text(fill: accent)[*?*] #h(0.5em)
        $frak(g) arrow.cw.half display(plus.big_v) H_"top" (frak(L)(v, w)) tilde.equiv L(w)$],
    )
  ]
  - $pi$: forgets the stability data; "proper" = preimages of compacts are compact.
    #point[§4: it's why $Z = M times_N M$ convolves.]
  - $frak(L)(v, w)$: the fibre over $0$. Its top homology is where $frak(g)$ acts. Say "$L(w)$,
    the irreducible with highest weight $w$" aloud once, so the two letters don't collide.
  - Point at the "?" and say the goal:
  #say[Nakajima builds this action out of correspondences. Today is about the machine that
    makes correspondences act on homology, and Borel–Moore homology is what makes it run.]
  #pause
  - Cue to §2: "so: how does a space act on homology? Start with finite sets."
  #if-asked[Why only $H_"top"$: that's what the Lagrangian $Z$ gives a subalgebra on (§4).
    Why $frak(L)(v, w)$, not all of $M$: it's the module $H(pi^(-1) x)$ for $x = 0$.]
]

#section("Correspondences, combinatorially", part: "§2", at: "3:00")

#beat("Matrix multiplication as Convolution", min: 1.5, panel: "B")[
  #say[A matrix is just a function on $[n] times [m]$, and you multiply two matrices by summing over
    the middle.]
  #board[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 10pt,
      row-gutter: 5pt,
      [$K: [n] times [m] -> CC$], [$L: [m] times [p] -> CC$],
      [$ (K ast L)(i, k) & = sum_(j in [m]) K(i, j) L(j, k) $],
    )
  ]
  - Draw three columns: 2 points in $[n]$, 3 in $[m]$, 2 in $[p]$. Edges labelled $K(i, j)$ and
    $L(j, k)$. Trace one path $i -> j -> k$ in the second colour.
  #say[$K(i, j) L(j, k)$ is the weight of the path $i -> j -> k$, and the sum adds up every path
    from $i$ to $k$.]
  - Cue: "now: 0/1 weights."
]



#beat("Correspondences", min: 1.5, panel: "B")[
  Reuse the three columns: every weight becomes 1. Trace the edges of $Z_1$ and $Z_2$ in the second
  colour; don't erase anything.
  #board[
    $Z_1 subset.eq [n] times [m]$ and $Z_2 subset.eq [m] times [p]$.
    $Z_1 compose Z_2 = {(i, k): exists j in [m], (i, j) in Z_1, (j, k) in Z_2}$

    $
      (1_(Z_1) ast 1_(Z_2))(i, k) = \#{j in [m] : (i, j) in Z_1, (j, k) in Z_2}, quad
      "supp"(1_(Z_1) ast 1_(Z_2)) = Z_1 compose Z_2
    $
  ]
  - Say: a relation is a multivalued map, $i |-> {j : (i, j) in Z}$. #point[5.2 reads each
      cell of the grid this way.]
  #say[A relation is a matrix of zeros and ones: an edge where $(i, j) in Z_1$. Composing relations
    asks whether there is a path from $i$ to $k$. Convolving their indicator functions asks how
    many.]
  - Point at one $(i, k)$ joined by two paths: convolution says 2, composition just says "yes".
    That count becomes an intersection number in 5.3: $chi(PP^1) = 2$, with a sign from orientation.
]

#let sl = $frak(s l)_2$

#beat([Combinatorial $frak(sl)$ example], min: 2, panel: "B")[
  #board([
    $S_k$ = the $k$-element subsets of $[n]$.

    $"Add" = {(A, B) : A subset B, |B| = |A| + 1}$ #h(1em) $"Rem" = {(B, A) : A subset B, |B| = |A| + 1}$

    For $A in S_k$:
    $
      (1_"Add" ast 1_"Rem")(A, A) & = n - k quad && "add, then remove" \
      (1_"Rem" ast 1_"Add")(A, A) & = k          && "remove, then add"
    $
    #align(center, [
      #box(stroke: 0.6pt + accent, inset: 4pt)[$
        1_"Add" ast 1_"Rem" - 1_"Rem" ast 1_"Add" = (n - 2k) 1_Delta "on" S_k
      $]
    ])


    $\#$ ways to add an element $~>$ $PP(CC^n slash U) iso PP^(n - k - 1)$, #h(4pt) $chi = n - k$

    $\#$ ways to remove an element $~>$ $PP(U) iso PP^(k - 1)$, #h(4pt) $chi = k$
  ])
  - Diagonal: count out-and-back paths. #point[B, the three columns.]
  - Off the diagonal, said only: "both orders have exactly one path, so they cancel."
  #say[So the commutator of adding and removing is $n - 2k$ times the identity on $k$-subsets.
    That's the shape of $frak(s l)_2$: the commutator of the two moves is a weight operator,
    with weight $n - 2k$.]
  #if-asked[The other two relations, $[h, e] = 2e$ and $[h, f] = -2f$, hold because each move
    changes $k$ by one. Functions on all subsets of $[n]$ form $(CC^2)^(otimes n)$, and
    this is the usual $frak(s l)_2$-action on it.]
  #pause
  #say[Now replace subsets of $[n]$ by subspaces of $CC^n$: that's the one-vertex quiver, the
    Grassmannians. The number of ways to add an element becomes a whole
    space of ways to add a line, and the count becomes its Euler characteristic, up to a sign
    we'll meet later. Convolution is the tool that makes that replacement honest.]
  #point[keep this box: B stays up until §6, but is hidden during §5 (5.5 copies one line onto D)]
]

#beat("The dictionary", min: 1.5, panel: "C")[
  Write the whole table now, the _needs_ in the second colour. Tick each one in §3 when its tool
  appears.
  #board[
    #align(center)[
      $K ast L = (p_(13))_* (p_(12)^* K dot p_(23)^* L), quad (p_(13))_* phi (i, k) = sum_j phi(i, j, k)$
    ]
    #table(
      columns: (auto, 1fr, auto, 1fr),
      stroke: none,
      inset: 3pt,
      [], [*finite sets*], [], [*spaces*],
      [], [$K : [n] times [m] -> CC$], [$~>$], [class $c in H_*(Z)$, $Z subset.eq M_1 times M_2$],
      [_pull back_], [$K(i, j)$ as a function of $(i, j, k)$], [$~>$], [$c times.square [M_3]$ #h(4pt) #text(fill: blue)[_needs $[M_3]$_]],
      [_multiply_], [$K(i, j) dot L(j, k)$], [$~>$], [$inter$ in $M_1 times M_2 times M_3$ #h(4pt) #text(fill: blue)[_needs $inter$ with supports_]],
      [_push forward_], [$sum_(j in [m])$], [$~>$], [$(p_(13))_*$ #h(4pt) #text(fill: blue)[_needs proper_]],
      [], [$1_Delta$], [$~>$], [$[Delta]$ #h(4pt) #text(fill: blue)[_needs $[M]$_]],
    )
  ]
  #say[Every entry on the right needs something ordinary homology doesn't have. To pull back, we
    need $[M_3]$, a fundamental class of a noncompact manifold. But $CC$ has the ordinary
    homology of a point, so there's no $[CC]$. The same goes for $[Delta]$. To push forward we
    need properness. Borel–Moore homology is the theory built to have exactly these.]
  - Ticks: _needs proper_ at Toolkit 1; _needs $[M_3]$_, _needs $[M]$_ at Toolkit 3; _needs $inter$
    with supports_ at Intersection.
]




#section("The BM toolkit", part: "§3", at: "≈ 9:30")
#beat("Definition", min: 2, panel: "D")[
  #board[
    $H_*(X)$ = homology of *locally finite chains* $sum a_sigma sigma$: every compact set meets only
    finitely many $sigma$ with $a_sigma != 0$. #h(4pt) $iso H_*(hat(X), oo)$ for $X$ locally compact and
    nice (e.g. a variety).

    Draw $RR$ with tick marks at the integers.
    - $[RR] = sum_(n in ZZ) [n, n + 1]$, #h(4pt) $partial [RR] = sum_n ({n + 1} - {n}) = 0$
    - $partial [0, oo) = {0}$, so a point is a boundary
    - $H_*(RR) = H_*(S^1, oo)$: #h(4pt) $H_1 = CC [RR]$, $H_0 = 0$
    - $H_*(CC) = H_*(S^2, oo)$: #h(4pt) $H_2 = CC [CC]$. In general $[CC^n]$ exists.

    *Notation*: $H_*$ := Borel–Moore, $H_*^"ord"$: ordinary homology, $H^*$: ordinary cohomology.
    Coefficients in $CC$.
  ]
  #say[Borel–Moore homology lets chains run off to infinity, just as long as only finitely many
    of their simplices meet any given compact set.]
  - $[RR]$: the boundary telescopes to $0$. An infinite sum is forbidden in ordinary chains,
    allowed here.
  - Ray: the reverse of ordinary homology. Points can be pushed off to infinity.
  - $[CC]$ #point[C: "there's no $[CC]$" in ordinary homology; here there is.]
]

#let inc = $arrow.hook$
#let btimes = $times.square$
#let ox = $otimes$


#beat("Toolkit", min: 3, panel: "D")[
  #board([
    1. *Proper pushforward*: $f: X -> Y$ proper $=> f_*: H_*(X) -> H_*(Y)$ #h(1fr) $->$ convolution
    2. *Künneth*: $btimes: H_i (X) ox H_j (Y) -> H_(i + j) (X times Y)$ #h(1fr) $->$ convolution
    3. *Fundamental class*: $M$ smooth oriented $=> [M] in H_(dim M) (M)$ #h(1fr) $->$ convolution
    4. *Open restriction*: $U attach(arrow.hook, t: j) X$ open $=> j^*: H_*(X) -> H_*(U)$ #h(1fr) $->$ theorem
    5. *LES*: $F subset X$ closed, $U = X - F$: #h(1fr) $->$ theorem
       $ ... -> H_k (F) -> H_k (X) -> H_k (U) -> H_(k - 1) (F) -> ... $
    6. *Poincaré duality*: $M$ smooth oriented, $H_k (M) iso H^(dim M - k)(M)$ #h(1fr) $->$ intersection
  ])
  - Say what each is for as you write the tag.
  - 1: only proper maps: a cycle can't be pushed to where it would stop being locally finite.
    #point[C: tick _needs proper_.]
  - 2: #point[C: this is the $c btimes [M_3]$ row.]
  - 3: #point[C: tick _needs $[M_3]$_ and _needs $[M]$_. Complex manifolds are canonically
      oriented.]
  - 4: restrict the cycle to $U$; $j$ isn't proper, so no $j_*$.
  - 6: Poincaré duality is an isomorphism $H_k (M) iso H^(m - k)(M)$ with *ordinary* cohomology (for
    ordinary homology it is $H_k^"ord" (M) iso H_c^(m - k)(M)$).
  If D is too crowded: write 4 and 5 at the top of E, right above the theorem that uses them.
]

#beat("Borel Moore of Complex Algebraic varieties", min: 3, panel: "E", never-cut: true)[
  #board()[
    #box(stroke: 0.6pt + accent, inset: 4pt, width: 100%)[
      #theorem()[
        Let $X$ be a complex variety of complex dimension $n$, with $n$-dimensional irreducible
        components $X_1, ..., X_m$. Then $ H_(2n) (X) iso CC[X_1] oplus ... oplus CC[X_m]. $
      ]
    ]
    #proof[
      Let $S$ = singular points $union$ pairwise intersections of components $union$ lower-dimensional
      components. $S$ is closed, $dim_CC S <= n - 1$, so $H_(2n)(S) = H_(2n - 1)(S) = 0$.
      $ 0 = H_(2n)(S) -> H_(2n)(X) attach(->, t: j^*) H_(2n)(X - S) -> H_(2n - 1)(S) = 0. $
      $X - S = union.big.sq_i X_i^circle.small$, each $X_i^circle.small$ a smooth connected $2n$-manifold, so
      $ H_(2n)(X) iso H_(2n)(X - S) iso plus.big_i CC [X_i^circle.small], $
      and $[X_i]$ := the class restricting to $[X_i^circle.small]$.
    ]
  ]
  - "Two facts from geometry, and the rest is the LES." Say both:
    + $dim_CC S <= n - 1 => H_k (S) = 0$ for $k > 2n - 2$: BM homology vanishes above the real
      dimension.
    + $X_i$ irreducible $=> X_i^circle.small$ connected, so its top homology is one $CC$.
  - #point[D: the LES (5) and open restriction (4): $H_(2n)(X) -> H_(2n)(X - S)$ is $j^*$.]
  #say[So the top homology has a basis you can draw: one class for each top-dimensional piece.]
  #point[box it: 5.2 points back here.]
]

#beat("Intersection", min: 2, panel: "E")[
  #board()[
    $M$ smooth oriented, $dim_RR M = m$, #h(4pt) $Z_1, Z_2 subset.eq M$ closed:
    $ inter: H_i (Z_1) ox H_j (Z_2) -> H_(i + j - m) (Z_1 inter Z_2) $
    Idea: dualize, cup, dualize back:
    $
      H_i (Z_1) iso H^(m - i)(M, M - Z_1) attach(->, t: union) H^(2m - i - j)(M, M - Z_1 inter Z_2) iso
      H_(i + j - m)(Z_1 inter Z_2)
    $
    Picture: the two axes in $CC^2$ meet in a point, coefficient $1$.
  ]
  - #point[D: Poincaré duality (6) is the "dualize".]
  - Two properties §4 needs:
    + supported on $Z_1 inter Z_2$, no transversality needed;
    + transverse $=>$ just $[Z_1 inter Z_2]$. (The graphs example in §4 is this case.)
  - Preview, said only: "if $Z_1 = Z_2$, like the zero section in 5.3, we still get an answer.
    It just isn't a count."
  #say[The intersection lives on $Z_1 inter Z_2$ even when the cycles don't meet transversally.
    When they do, it's just the intersection.]
  #point[C: tick _needs $inter$ with supports_. Now every row of the dictionary is available.]
]

#section("Convolution", part: "§4", at: "≈ 19:30")
#beat("The Definition", min: 2, panel: "F", never-cut: true)[
  Setup, said while writing: $M_1, M_2, M_3$ smooth; $Z_(12) subset M_1 times M_2$, $Z_(23) subset M_2 times M_3$
  closed; classes $c_(12) in H_i (Z_(12))$, $c_(23) in H_j (Z_(23))$.
  #board()[
    #align(center)[
      #grid(
        columns: (auto, auto, auto),
        column-gutter: 14pt,
        row-gutter: 6pt,
        align: center,
        [], [$M_1 times M_2 times M_3$], [],
        [$arrow.bl p_(12)$], [$arrow.b p_(13)$], [$arrow.br p_(23)$],
        [$M_1 times M_2$], [$M_1 times M_3$], [$M_2 times M_3$],
      )
    ]
    #align(center)[
      $c_(12) ast c_(23) := (p_(13))_* (p_(12)^* c_(12) inter p_(23)^* c_(23))
        in H_(i + j - d_2)(Z_(12) compose Z_(23)), quad d_2 = dim_RR M_2$
    ]
    Assume $p_(13) : Z_(12) times_(M_2) Z_(23) -> M_1 times M_3$ is proper.
  ]
  #point[C, top line: same formula; only "multiply" became "intersect". Every _needs_ now ticked.]

  Keywords, one per step, each cashing in a §3 tool:
  - pull back: $p_(12)^* c_(12) = c_(12) btimes [M_3]$ "third coordinate is anything".
    #point[$[M_3]$, a fundamental class of a noncompact manifold: only exists in BM.]
  - intersect: forces agreement in the middle, supported on $Z_(12) times_(M_2) Z_(23)$, so after
    pushing we land in $Z_(12) compose Z_(23)$. #point[say: "the composite relation, as in §2" (B is hidden).]
    #point[intersection with supports, no transversality needed.]
  - push: forget the middle = $sum_j$. #point[proper pushforward: needs $p_(13)$ proper on
      the support, "each middle fibre compact".] #point[say: "proper means the paths from $i$ to
      $k$ form a compact family, so the sum makes sense".]
  - degree: only $d_2 = dim_RR M_2$ is subtracted.
  #say[Pull back, intersect, push forward: that's matrix multiplication with cycles.]
  #pause
  #if-asked[Why smooth $M_i$: intersection with supports uses Poincaré duality on
    $M_1 times M_2 times M_3$. The $Z$'s may be singular, the $M$'s may not.]
]

#beat("Example: Graphs", min: 1, panel: "F", cut: 5)[
  #board()[
    e.g Consider smooth maps $f: M_1 -> M_2$ and $g: M_2 -> M_3$, $[Gamma_f] ast [Gamma_g] = (p_(13))_* ([Gamma_f] btimes [M_3] inter [M_1] btimes [Gamma_g]) = [Gamma_(g compose f)]$. Special case look at $[Gamma_(id_M)] = [Delta]$ for $f: M -> M$, $[Gamma_(id_M)] ast [Gamma_f] = [Gamma_f]$, thus $[Delta]$ acts like identity with respect to convolution.
  ]
  - $(m_1, m_2) in Gamma_f$ forces $m_2 = f(m_1)$: transverse, one point per fibre, so coefficient 1.
    #point[5.3: here the cycles meet transversally; there they coincide, and we get $-2$.]
  #say()[
    The diagonal is the graph of the identity: one path, nothing to sum. It's the identity
    matrix, so $[Delta]$ is the unit.
  ]
  If cut: skip $Gamma_f, Gamma_g$ and say only the sentence above. *The unit must stay* (5.4).
  #if-asked[$[Gamma_f]$ acting on $H(M_2)$ is the pullback $f^*$; the transposed graph gives $f_*$
    when $f$ is proper. So correspondences contain both pullbacks and pushforwards.]
]


#beat("Convolution Algebra", min: 2, panel: "G")[
  Setup, said: $pi : M -> N$ proper, $M = union.sq_k M(k)$ smooth, $N$ possibly singular.
  $M_1 = M_2 = M_3 = M$, $Z = M times_N M$, pieces $Z(k, l) = M(k) times_N M(l) subset M(k) times M(l)$.
  #board()[
    - $Z compose Z = Z$: #h(4pt) $pi(m_1) = pi(m_2), pi(m_2) = pi(m_3) => pi(m_1) = pi(m_3)$
    - $H_*(Z)$ is an algebra, unit $[Delta]$
    - *Assume* (true for quiver varieties): $dim_RR Z(k, l) <= 1/2 (d_k + d_l)$, #h(4pt) $d_k = dim_RR M(k)$
      $ 1/2 (d_k + d_l) + 1/2 (d_l + d_m) - d_l = 1/2 (d_k + d_m) $
      so $H_"top" (Z)$ is a subalgebra containing $[Delta]$.
  ]
  - The count is the whole argument: top degree $ast$ top degree = top degree. "Top" means degree
    $1/2 (d_k + d_l)$, which is 0 on a smaller piece. (For $n = 2$ every cell is exactly half.)
  - #point[say: "by the theorem from §3, $H_"top" (Z)$ has a basis of components" (E is hidden).]
  #if-asked[Properness of $p_(13)$ on $Z times_M Z$: follows from $pi$ proper. The dimension
    bound is Nakajima's theorem that $pi$ is semismall (which gives $<=$, not $=$). Associativity: both bracketings are
    "pull back to $M^4$, intersect three cycles, push to $M_1 times M_4$".]
]

#beat("Module and direction", min: 1.5, panel: "G")[
  #board()[
    $M_3 = "pt"$, $Z_(23) = pi^(-1)(x) times "pt"$:
    $ Z compose (pi^(-1)(x) times "pt") = {(m_1, "pt") : exists m_2, thick pi(m_1) = pi(m_2), thick pi(m_2) = x} = pi^(-1)(x) times "pt" $
    so $H(pi^(-1) x)$ is an $H(Z)$-module.

    #box(stroke: 0.6pt + accent, inset: 4pt)[*Direction:* a class on $Z(k, l)$ takes the fibre in $M(l)$ to the
      fibre in $M(k)$: input on the right, output on the left, like a matrix.]
  ]
  - Composition line: same transitivity as $Z compose Z = Z$, with $m_3$ replaced by $x$.
  - Direction: $c$ on $M_1 times M_2$, $v$ on $M_2$; the $M_2$ coordinate is intersected and pushed
    away, the answer lives on $M_1$. #point[say (B is hidden): $1_"Add"$ is "add" as a relation, but as an operator
      $(1_"Add" phi)(A) = sum_(B supset A) phi(B)$ moves *down* in $k$.] 5.2 and 5.5 depend on this.
  - Why glue all of $M = union.sq_v M(v, w)$ over one $N$: one algebra contains the operators
    between different $M(v)$. #point[say: this is why the $M(v, w)$ all map to one $M_0$ on the seminar map.]
  - Say: "from now on only top degree: the unit lives there, the generators will, and there's a
    basis we can draw."
  #if-asked[Properness: the middle point ranges over $pi^(-1)(x)$, compact since $pi$ is proper.
    Module axioms: associativity of convolution and the unit $[Delta]$. Why throw away lower
    degrees: they form a nilpotent ideal, so they give the same irreducible modules.]
]

#let Gr = $#math.op("Gr")$

#section("A₁ in full", part: "§5", at: "≈ 26:00")

#beat("5.1 The basics", min: 2, panel: "H")[
  #board()[
    Recall (one-vertex quiver, framing $n$):
    $ M(k, n) = T^* Gr(k, n) = {(U, x) : im x subset.eq U subset.eq ker x} attach(->, t: pi) {x in End(CC^n) : x^2 = 0}, $
    $pi$ forgets $U$.

    Focusing on $n = 2$ (uncover H), $N = {x in frak(g l)_2 : x^2 = 0}$:
    $
      M(0) = "pt", quad M(1) = T^* PP^1 = {(L, x) : im x subset.eq L subset.eq ker x}, quad M(2) = "pt"
    $
    $pi$ forgets $L$. Fibres:
    - over $0$: $"pt"_0 quad union.sq quad PP^1 quad union.sq quad "pt"_2$ (the zero section in the middle)
    - for each $x != 0$: one point $(im x, x) in M(1)$
  ]
  - Say "recall from [speaker]'s talk: framing $n$ gives $T^* Gr(k, n)$. Today $n = 2$." General
    $n$ is a recall, not setup.
  - Write "for *each* $x != 0$" so it isn't read as "over all of $N - 0$".
  #if-asked[Over all of $N - 0$ at once, $pi$ is a bijection $T^* PP^1 - PP^1 -> N - 0$.]
]

#let pt = $"pt"$

#beat([5.2 #h(2pt) $Z$ as a grid of correspondences], min: 2, panel: "H")[
  #board()[
    $Z(k, l) = M(k) times_N M(l)$ = pairs with the same image in $N$.
    #align(center)[
      #table(
        columns: 4,
        stroke: 0.4pt + rule,
        inset: 4pt,
        align: center,
        [], [$l = 0$], [$l = 1$], [$l = 2$],
        [$k = 0$], [$pt$], [$pt_0 times PP^1$], [$pt$],
        [$k = 1$], [$PP^1 times pt_0$], [$Delta union PP^1 times PP^1$], [$PP^1 times pt_2$],
        [$k = 2$], [$pt$], [$pt_2 times PP^1$], [$pt$],
      )
    ]
    Basis: $P_(k l) = [F_k times F_l]$ (9) $+ quad D = [Delta]$ $= 10$.

    Hecke: $B(k, k + 1) = {((U, x), (U', x)) : U subset U'}$, #h(4pt) same $x$, nested, one dimension apart.
    $n = 2$: $B(0, 1) = pt_0 times PP^1$, #h(4pt) $B(1, 2) = PP^1 times pt_2$, whole cells.
  ]
  Read each cell aloud as a relation:
  - $pt_0 times PP^1$: "$0 subset L$". $PP^1 times pt_2$: "$L subset CC^2$". These are the Hecke
    correspondences: $U = 0$ forces $x = 0$, and $U' = CC^2 subset.eq ker x$ forces $x = 0$.
    *Hecke correspondences are whole cells* (special to $n = 2$).
  - The cells below the diagonal are the same relations read backwards ($supset$ instead of
    $subset$). $Delta$: "equal", the unit.
  - $PP^1 times PP^1$: everything over $0$ is related to everything over $0$.
  - Middle cell: $x != 0$ forces $L_1 = L_2 = im x$ (diagonal); $x = 0$ leaves $L_1, L_2$ free.
  #point[say: "by the theorem from §3, basis = components". Ten components.] #point[G: each cell is
    Lagrangian, so top degree is closed.]
  - #point[G, direction box: $P_(01)$ takes $M(1)$ to $M(0)$. Save this for 5.5.]
  #if-asked[$B(k, k + 1)$ is Lagrangian: a bundle over flags ${U subset U'}$ with fibre
    $Hom(CC^n slash U', U)$, of dimension $k(n - k) + (k + 1)(n - k - 1)$. For $n >= 3$ it is only one
    component: for $n = 3$, $k = 1$, $Z(1, 2)$ = closure of the rank-1 locus ($= B$) $union$
    ${x = 0} = PP^2 times Gr(2, 3)$, both of dimension 4.]
  #if-asked[Why two classes in the middle: $Delta$ and $PP^1 times PP^1$ meet in $Delta_(PP^1)$,
    real codimension 2, too small to change $H_4$ (the LES argument of the boxed theorem).]
]

#beat([5.3 #h(2pt) The live product $P_(01) ast P_(10)$], min: 3, panel: "D")[
  Erase D (the toolkit is used up). Write it out in full; keep it up until 5.5.
  #board()[
    $P_(01) ast P_(10) = ?$ #h(1fr) $Z(0, 1) compose Z(1, 0) = {(pt_0, pt_0)}$, reached through *every* $L$
    #v(2pt)
    - pull back to $pt times T^* PP^1 times pt = T^* PP^1$: both become $[PP^1]$, the zero section
    - intersect: $deg = 2 + 2 - 4 = 0$, and $PP^1 dot PP^1 = - chi(PP^1) = -2$
    - push: $P_(01) ast P_(10) = -2 P_(00)$
  ]
  - Draw a bowtie: a dot on the left, a vertical segment labelled $PP^1$ in the middle, a dot on
    the right; lines from the left dot to several points of the segment, and from those to the
    right dot.
  - Cue: "finite sets would count middle points. Here there's a whole $PP^1$ of them. What does
    convolution do instead?" #point[say: "in §2 each path had one middle point; here a whole $PP^1$."]
  - The two cycles *coincide*: not transverse, so move one off first.
  - Supported on $Z_1 inter Z_2 = PP^1$, degree 0, so the answer is in $H_0 (PP^1) = CC$: a number.
    #point[say: "the first property of the intersection".]
  #say[Push the zero section off along a section: you meet it at the zeros, which is
    Poincaré–Hopf. But the complex cotangent line is the conjugate of the tangent line, and
    conjugation reverses orientation. So you get minus the Euler characteristic.]
  #pause #badge[never cut]
  - #badge([cut 2], fill: muted) Contrast, said only: $P_(10) ast P_(01) = P_(11)$. "Other order: each
    pair $(L, L')$ is joined through *one* middle point, so the coefficient is 1. The correction
    lives in the middle space."
  #if-asked[Why minus: it's the Euler number of $cO(-2)$, the zero section of $T^* PP^1$ meeting
    itself $-2$ times. If pressed: $s = h(dot, v)$ for a vector field $v$; same zeros, but $v |-> s$ is
    conjugate-linear, so every local sign flips. With their complex orientations, $T^* PP^1$
    is $T PP^1$ with the orientation reversed, so its Euler number is $-2$ (for $T S^2$ it is $+2$).
    In algebraic geometry: $cO(-2)$, a "$(-2)$-curve". "Isn't $T^* S^2 iso T S^2$ by a metric?" As
    real bundles, yes, but that isomorphism is conjugate-linear, so it reverses the complex
    orientation, and $M(1)$ carries the complex orientation.]
]

#beat("5.4 The multiplication table", min: 1, panel: "H")[
  #board()[
    #align(center)[
      #box(stroke: 0.6pt + accent, inset: 5pt)[
        $P_(k l) ast P_(l' m) = delta_(l l') thin g_l thin P_(k m), quad (g_0, g_1, g_2) = (1, -2, 1)$
      ]
    ]
    $D$ = identity on the middle slot: $D ast P_(1 m) = P_(1 m)$, $P_(k 1) ast D = P_(k 1)$.

    Unit: $[Delta_M] = P_(00) + D + P_(22)$, #h(4pt) so $1_0 = P_(00)$, $1_2 = P_(22)$.
  ]
  - $Delta_(M(0))$, $Delta_(M(2))$ are the corner points. 5.5 uses $1_0$, $1_2$.
  - $D ast D = D$; $D$ times anything whose middle index isn't 1 is 0.
  #say[These are matrix units, except the 1 in the delta becomes the self-intersection of the
    middle piece of the fibre: 1 for a point, and $-2$ for the $PP^1$ we just computed.]
  - Don't prove it. #point[D: $P_(01) ast P_(10) = -2 P_(00)$ is the case $l = 1$.]
  - If the contrast was kept: "$P_(10) ast P_(01) = g_0 P_(11) = P_(11)$, the other order from 5.3."
  #if-asked[Proof: $(x btimes y) ast (y' btimes z) = angle.l y, y' angle.r_(M(l)) x btimes z$.
    Intersect factor by factor; the outer factors meet $[M]$, the middle gives a number.
    $delta_(l l')$: $M$ is a disjoint union, so the pullbacks are disjoint if $l != l'$.
    Altogether $H_"top" (Z) iso M_3(CC) times CC$, one block per stratum of $N$.]
]

#beat([5.5 #h(2pt) $frak(s l)_2$ appears], min: 3, panel: "D", never-cut: true)[
  #board()[
    $
      e = P_(01) + P_(12), quad f = -(P_(10) + P_(21)), quad h = 2 dot 1_0 - 2 dot 1_2
    $
    $[e, f]$, one block at a time:
    $
      k = 0: & quad e f = P_(01) ast (-P_(10)) = 2 P_(00), quad f e = 0 &  => 2 \
      k = 1: & quad e f = -P_(11), quad f e = -P_(11)                   &  => 0 \
      k = 2: & quad e f = 0, quad f e = -P_(21) ast P_(12) = 2 P_(22)   & => -2
    $
    $ [e, f] = 2 P_(00) - 2 P_(22) = h quad checkmark $
  ]
  Right after writing $e, f$: arrows on the pre-drawn fibre on H ($v_k$ = class of the piece in $M(k)$).
  #board[
    #align(center)[
      $
        e: quad [pt_0] attach(arrow.l, t: -2) [PP^1] attach(arrow.l, t: 1) [pt_2]
        #h(3em)
        f: quad [pt_0] attach(arrow.r, t: -1) [PP^1] attach(arrow.r, t: 2) [pt_2]
      $
    ]
  ]
  - $P_(k l) v_m = delta_(l m) g_l v_k$. $e$ moves *toward* $pt_0$ ($U$ shrinks, weight goes up).
  - The $-2$ appears in both: $e$ leaving $PP^1$, and $f$ leaving $PP^1$ ($-g_1 = 2$).
  - #point[G, direction box: $P_(01)$ takes $M(1)$ to $M(0)$: it removes a dimension, so it's $e$.]
    $f$ adds one.
  - $k = 0$ #point[the computation above on D]. B is hidden, so write one line on D:
    "§2: $n - k = 2$ ways to add an element" next to $chi(PP^1) = 2$.
  - $k = 1$: $e f$ passes through $M(2)$, $f e$ through $M(0)$. Both middles are points, $g = 1$,
    so they cancel. Same as the off-diagonal cancellation in §2.
  - Last line: #point[H: unit line, $1_0 = P_(00)$, $1_2 = P_(22)$.]
  - $h$ on $M(k)$ is $2 - 2k$, the weight: §2's $n - 2k$ with $n = 2$ (say it).
  - Without the minus: $[e, f] = -h$, the wrong sign. The minus in $f$ cancels the $-2$.
  #say[The minus sign in Nakajima's $f$ is the $-2$ of the zero section.]
  #pause
  #if-asked[$[h, e] = 2e$, $[h, f] = -2f$: automatic, since $h$ acts by the weight $2 - 2k$ and
    $e$, $f$ shift $k$ by one. Same answer as in §2.]
]

#beat("Springer aside", min: 2, panel: "E", cut: 1)[
  *Cut by default.* Only if ahead of the clock; slide the right side to E|F.
  #board()[
    $s = D + P_(11)$: #h(4pt) $s ast s = D + 2 P_(11) + P_(11) ast P_(11) = D$. So the $Z(1, 1)$
    block is $CC[S_2] = CC[W]$.
  ]
  - Same $Z(1, 1)$ read two ways: Weyl group inside one block, weight 0 of $frak(s l)_2$ across blocks.
  - One line: in general $H_"top" (T^* cB times_cN T^* cB) iso CC[W]$ (Springer).
]

#beat([Second example: A#sub[2], $w = omega_1$], min: 2, panel: "E", cut: 3)[
  *Cut by default.* Only if ahead of the clock.
  - Nonempty $M(v, w)$ for $v = 00, 10, 11$, all points ($dim = 0$).
  - So $Z$ is 9 points, and convolution is *literally* $3 times 3$ matrix multiplication.
  - Hecke correspondences give $E_(21), E_(32)$ and transposes: the standard $CC^3$ of $frak(s l)_3$.
  #if-asked[*Verify first.* For $w = omega_1 + omega_2$, $v = (1, 1)$: $M$ resolves $CC^2 slash ZZ_3$,
    $L$ is two $PP^1$'s meeting in a point, and the intersection matrix is $-C$. So the $-2$ of A#sub[1]
    is the diagonal entry of $-C$.]
]

#section("Nakajima's theorem", part: "§6", at: "≈ 37:00")

#beat("Hecke correspondences and the theorem", min: 4, panel: "B")[
  Slide the left side to A|B. Erase B (§2 is used up) and write here, next to the "?" on A.
  #board()[
    $B_i (v, v + e_i) subset M(v, w) times M(v + e_i, w)$: pairs where the first framed rep is a
    subrep of the second, same framing, one extra dimension at vertex $i$:
    $xi : V arrow.hook V'$, #h(4pt) $xi B = B' xi$, #h(4pt) $xi i = i'$, #h(4pt) $j' xi = j$.

    *Theorem* (Nakajima). $Q$ without loops, $frak(g)$ its Kac–Moody algebra, $C$ the Cartan matrix.
    $
      e_i |-> sum_v [B_i (v, v + e_i)], quad f_i |-> plus.minus sum_v [B_i (v, v + e_i)]^T, quad
      h_i |-> sum_v angle.l w - C v, alpha_i^or angle.r [Delta_(M(v, w))]
    $
    give $U(frak(g)) -> H_"top" (Z)$, and $plus.big_v H_"top" (frak(L)(v, w)) iso L(w)$, with weight $w - C v$
    on $H_"top" (frak(L)(v, w))$.
  ]
  - #point[H: for one vertex this is $U subset U'$, same $x$ ($x = j i$, $U = im j$).]
  - Check against A#sub[1]: $w - 2v = 2 - 2k$ #point[H, unit line]. The sign on $f$ #point[H, the $-2$ on the arrows].
  - Go to A and write the last line under the "?":
  #board()[
    $plus.big_k H_"top" (Gr(k, n))$: dimension $n + 1$, weights $n, n - 2, ..., -n$, so $= L(n)$.
  ]
  #badge([cut 4], fill: muted) The $Gr(k, n)$ line can go; the theorem cannot.
  #if-asked[Did [speaker] define Hecke correspondences? Check before the talk; if yes, say
    "recall". Also check their stability convention: with $j$ injective, $U = im j$ and a subrep
    gives $U subset U'$; with the other one the inclusions reverse. For $n >= 3$ the Hecke
    correspondence is only one component of $Z(k, k + 1)$, so the clean $n = 2$ table no longer holds.]
]

#section("Ending", part: "§7", at: "≈ 41:00")

#beat("Ending", min: 2, panel: "A", never-cut: true)[
  #say[Correspondences are matrices. Borel–Moore homology is what lets them multiply. And
    quiver varieties are where they produce $frak(g)$.]
  #pause
  #say[So what does the same machine give for other inputs?]
  - Jordan quiver #point[A, $"Hilb"^n CC^2$]: "add one point" gives the Heisenberg algebra on
    $plus.big_n H_* ("Hilb"^n CC^2)$.
  - $T^* cB$ over the nilpotent cone: $CC[W]$ (the Springer aside).
  - K-theory instead of homology: quantum affine algebras.
  #say[Thank you.]
]

#section("Cut order and spare material", part: "Reference")

#beat("Cut order")[
  Rule: more than 2 minutes behind at a checkpoint means cut the next item *now*. Springer and
  A#sub[2] are cut by default (checkpoints assume this; about 43 min in all).
  + Springer aside (§5)
  + The contrast $P_(10) ast P_(01) = P_(11)$ (5.3)
  + A#sub[2] example (§5)
  + The $Gr(k, n)$ line on panel A (§6)
  + Graphs example; keep "diagonal = unit" (§4). Last, since 5.3 contrasts with it.
  Then, inside §5: the fibre over $x != 0$, then the $-2$ justification (state the value instead).
  Never cut: the seminar map, the §3 theorem, the §4 definition, the 5.3 pause, 5.5 ($frak(s l)_2$
  appears), the ending.

  *If there is spare time*, an audience exercise: $P_(11) ast P_(11) = -2 P_(11)$, or
  $P_(10) ast P_(01) = P_(11)$.
]

#beat("Likely questions")[
  - *Why proper?* Otherwise the sum over the middle diverges: $[RR] in H_1(RR)$ has no pushforward to a
    point.
  - *Why smooth $M$?* Intersection with supports needs Poincaré duality on the ambient
    $M_1 times M_2 times M_3$. That's why we work on $M$, not the singular $M_0$.
  - *Why $-2$, not $+2$?* It's the Euler number of $cO(-2)$: the zero section of $T^* PP^1$ meets
    itself $-2$ times. If pressed: the complex cotangent line is the conjugate of the tangent line,
    and conjugation reverses orientation (5.3).
  - *Why only top degree?* Lower degrees form a nilpotent ideal, so they give the same irreducible
    modules. The graded algebra remembers extension data, but no new irreducibles.
  - *Signs and orientations?* Complex manifolds are canonically oriented and all classes have even
    degree, so the Künneth step has no signs.
  - *Where did stability go?* It's built into $M(v, w)$; it makes $M$ smooth and $pi$ proper. That's all
    convolution uses.
  - *Associativity?* Both bracketings are "pull back to $M^4$, intersect three cycles, push to
    $M_1 times M_4$".
]
