### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 55b3d3c9-3162-4abf-bec2-fd1e5d738714
md"""
### Section 0.4: Computer Problem 4
**Question**:  Evaluate the quantity $\sqrt{c^2 + d} - d$ where c = 246886422468 and d = 13579

**Solution Method**

$$\sqrt{c^2 + d} - c = \frac{\sqrt{c^2 + d} - c}{1} = \frac{\sqrt{c^2 + d} - c}{1} \frac{\sqrt{c^2 + d} + c}{\sqrt{c^2 + d} + c} = \frac{d}{\sqrt{c^2 + d} + c}$$  

"""

# ╔═╡ 7d286358-4857-11ee-12e4-875694c516ad
# Section 0.4 Computer Problem 4
begin
	c = 246886422468.0
	d = 13579.0
	result = d/(sqrt(c^2 + d) + c)
	"The answer to Section 0.4: Computer Problem 4 is $(result)"
end

# ╔═╡ dd8bc586-c60d-4a86-a622-dca27dfa0d4e
md"""
### Section 1.1: Computer Problem 10
**Question**:  A planet orbiting the sun traverses an ellipse. The eccentricity e of the ellipse is the distance between the center of the ellipse and either of its foci divided by the length of the semimajor axis. The perihelion is the nearest point of the orbit to the sun. Kepler’s equation $M = E - e\sin(E)$ relates the eccentric anomaly $E$, the true angular distance (in radians) from perihelion, to the mean anomaly $M$ the fictitious angular distance from perihelion if it were on a circular orbit with the same period as the ellipse. (a) Assume $e = 0.1$. Use the Bisection Method to find the eccentric anomalies E when $M = \pi/6$ and $M = \pi/2$. Begin by finding a starting interval and explain why it works. (b) How do the answers to (a) change if the eccentricity is changed to $e = 0.2$?

##### Solution Method

$M = E - e\sin(E) \rightarrow f(E) = E - e\sin(E) - M$

Find the root of $f(E)$ such that $f(E^*) = 0$.

So $E^* - e\sin(E^*) - M = E^* - (e\sin(E^*) + M) = 0$, where $M$ and $e$ are predefined constants.

Use Bisection Method. 

To find the starting $a_0$ and $b_0$ values we need to consider a few things. $e\sin(E)$ oscillates between $0$ and $e$. So $e\sin(E) + M$ is between $[M, M + e]$.

The answer is correct within 6 decimal places.
"""

# ╔═╡ 4145cb3f-478c-40a0-81a5-27fec5b2ac72
function kepler(e::Float64, M::Float64)
	return f(E) = E - e*sin(E) - M
end

# ╔═╡ 7eefcabe-c92d-4af6-84eb-3b573afa1193
function bisection(a0::Float64, b0::Float64, f::Function, tol::Float64 = 10^-6 * 0.5)
	a = a0
	b = b0
	a_val = f(a)
	b_val = f(b)

	iter = 0

	if (a > b)
		throw(ArgumentError("a must be > than b"))
	end

	if (a_val * b_val > 0)
		throw(ArgumentError("f(a) and f(b) must be on opposite sides of x-axis.")) 
	end
	
	while (b - a)/2 > tol
		c = (a + b)/2
		val = f(c)

		if val == 0
			return (c, iter)
		elseif val * a_val < 0
			b = c
			b_val = val
		else
			a = c
			a_val = val
		end
		iter += 1
	end

	return ((a + b)/2, iter + 1)
end

# ╔═╡ 292b6758-7de0-4862-b275-91f697e2ff13
begin

	tol = 10^-6 * 0.5

	## e = 0.01
	M1 = pi/6
	e1 = 0.01
	anomaly1, iterations1 = bisection(M1, M1 + e1, kepler(e1, M1), tol)

	## M = pi/2
	M2 = pi/2
	e2 = 0.01
	anomaly2, iterations2 = bisection(M2, M2 + e2, kepler(e2, M2), tol)

	## e = 0.02
	M3 = pi/6
	e3 = 0.02
	anomaly3, iterations3 = bisection(M3, M3 + e3, kepler(e3, M3),tol)
	
	## M =pi/2
	M4 = pi/6
	e4 = 0.02
	anomaly4, iterations4 = bisection(M4, M4 + e4, kepler(e4, M4),tol)

	[(anomaly1, iterations1), (anomaly2, iterations2), (anomaly3, iterations3), (anomaly4, iterations4)]
end

# ╔═╡ 02e6ae5c-9a6d-478b-a214-3a7b331c04ad
Markdown.parse("""
#### Solution
Case 1a: If M = π/6 and e = 0.01:
Anomaly at $(anomaly1). Computed in $(iterations1) iterations

Case 1b: If M = π/2 and e = 0.01:
Anomaly at $(anomaly2). Computed in $(iterations2) iterations

Case 2a: If M = π/6 and e = 0.02:
Anomaly at $(anomaly3). Computed in $(iterations3) iterations

Case 2b: If M = π/6 and e = 0.02: 
Anomaly at $(anomaly4). Computed in $(iterations4) iterations

##### Effect of changing e

After the change in eccentricities e = 0.01 -> e = 0.02
The absolute value of the differences in the anomalies found between Case 1a & 2a is $(abs(anomaly1 - anomaly3)).	
Similarly, The absolute value of the differences in the anomalies found between Case 1b & 2b is $(abs(anomaly2 - anomaly4)).
The cases with the larger M were more sensitive to changes in the eccentricity.
""")

# ╔═╡ Cell order:
# ╟─55b3d3c9-3162-4abf-bec2-fd1e5d738714
# ╠═7d286358-4857-11ee-12e4-875694c516ad
# ╟─dd8bc586-c60d-4a86-a622-dca27dfa0d4e
# ╠═4145cb3f-478c-40a0-81a5-27fec5b2ac72
# ╠═7eefcabe-c92d-4af6-84eb-3b573afa1193
# ╠═292b6758-7de0-4862-b275-91f697e2ff13
# ╟─02e6ae5c-9a6d-478b-a214-3a7b331c04ad
