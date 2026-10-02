"""
Problem 1.6 — visualize z^n for a given z.

Edit Z and N_MAX below, then run:
    python hw1_1_6.py
"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.cm as cm

# ── parameters ────────────────────────────────────────────────────────────────
Z = 0.9 + 0.4j   # the base complex number
N_MAX = 40        # how many powers to compute
# ──────────────────────────────────────────────────────────────────────────────

powers = np.array([Z**n for n in range(N_MAX + 1)])
ns = np.arange(N_MAX + 1)

fig, ax = plt.subplots(figsize=(7, 7))

# color trajectory by n
colors = cm.viridis(ns / N_MAX)
for i in range(len(powers) - 1):
    ax.plot(powers[i:i+2].real, powers[i:i+2].imag, color=colors[i], lw=1.2, zorder=2)

sc = ax.scatter(powers.real, powers.imag, c=ns, cmap="viridis", s=40, zorder=3)
ax.scatter(powers[0].real, powers[0].imag, color="black", s=80, zorder=4, label=r"$z^0 = 1$")

# unit circle for reference
theta = np.linspace(0, 2 * np.pi, 500)
ax.plot(np.cos(theta), np.sin(theta), "k--", lw=0.8, alpha=0.4, label="|z|=1")

# golden-ratio circle (the threshold from the problem)
phi = (1 + np.sqrt(5)) / 2
ax.plot(phi * np.cos(theta), phi * np.sin(theta), color="tomato", lw=1, ls="--",
        alpha=0.7, label=rf"$|z|=\varphi={phi:.3f}$")

plt.colorbar(sc, ax=ax, label="n")
ax.axhline(0, color="k", lw=0.5)
ax.axvline(0, color="k", lw=0.5)
ax.set_aspect("equal")
ax.set_xlabel("Re")
ax.set_ylabel("Im")
ax.set_title(
    rf"$z^n$ for $z = {Z.real:+.3f}{Z.imag:+.3f}i$,  $|z| = {abs(Z):.4f}$,  $n = 0,\ldots,{N_MAX}$"
)
ax.legend(loc="upper right", fontsize=8)
ax.grid(True, alpha=0.25)
plt.tight_layout()
plt.savefig("hw1_1_6.png", dpi=150, bbox_inches="tight")
plt.show()
