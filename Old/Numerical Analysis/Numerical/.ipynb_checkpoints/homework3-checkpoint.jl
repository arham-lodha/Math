### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ cc6788cc-5892-11ee-17d4-993f8bf833ca
function newtons(f:: Function, derivative:: Function, x0 :: Float64, tol::Float64 = 0.5 * 10^-8, maxIter = nothing)
	xi = x0
	value = f(xi)
	iter = 0
	
	# If max iteration set otherwise simply continue till tolerance is satisfied
	while (maxIter != nothing && iter < maxIter) || (maxIter == nothing)
		xLast = xi
		xi = xLast - value/derivative(xLast)
		value = f(xi)

		if abs(xi - xLast) < tol || value == 0.0
			break
		end
		iter+=1
	end

	return (xi, value)
end

# ╔═╡ c1a7d640-dc94-4f20-b1c6-45676d3ae59b
begin
	f1(x) = sin(x) - 6x - 5
	df1(x) = cos(x) - 6

	ans1, val1 = newtons(f1, df1, 0.0)
end

# ╔═╡ 8b49909f-dba4-4c31-8224-2eb2b0983b10
Markdown.parse(""" # Section 1.4: Computer Problem 2b:

Use Newton's method to approximate the root to eight correct decimal places of ``\\sin(x) = 6x + 5``. 


## Answer
``\\sin(x) = 6x + 5 \\to f(x) = \\sin(x) - 6x - 5``

``r`` is the root of ``f(x)``. ``r = $(ans1)``.

""")

# ╔═╡ 313e267b-85e8-4c1b-85b1-14e1d702fd39
function modifiedNewtons(f:: Function, derivative:: Function, x0 :: Float64, multiplicity :: Float64 = 1.0, tol::Float64 = 0.5 * 10^-8)
	xi = x0
	value = f(xi)
	iter = 0
	while true
		xLast = xi
		xi = xLast - value/derivative(xLast) * multiplicity
		value = f(xi)

		if abs(xi - xLast) < tol || value == 0.0
			break
		end
		iter+=1
	end

	return (xi, value)
end

# ╔═╡ 38559c69-022d-4071-84b4-93bb18994406
begin
	f2(x) = 2exp(x - 1) - x^2 - 1
	df2(x) = 2exp(x - 1) - 2x
	d2f2(x) = 2exp(x - 1) - 2
	d3f2(x) = 2exp(x - 1)

	root2, val2 = newtons(f2, df2, 0.0, 0.5 * 10^-8)


	e10 = abs(newtons(f2, df2, 0.0, 0.5 * 10^-8, 10)[1] - root2)
	e11 = abs(newtons(f2, df2, 0.0, 0.5 * 10^-8, 11)[1] - root2)

	S = e11/e10

	modifiedRoot2, modifiedVal2 = modifiedNewtons(f2, df2, 0.0, 3.0,  0.5 * 10^-8)

	(root2, val2, modifiedRoot2, modifiedVal2)
end

# ╔═╡ 7e51800f-f443-4090-bc60-54f49af53df8
Markdown.parse(""" # Section 1.4: Computer Problem 4a:

Apply Newton’s Method to find the only root to as much accuracy as possible, and find the root’s multiplicity. Then use Modified Newton’s Method to converge to the root quadratically. Report the forward and backward errors of the best approximation obtained from each method: ``f (x) = 2e^{x−1} − x^2 − 1``


## Answer
Root found with normal Newton's Method ``r_n = $(root2)``

``f (x) = 2e^{x−1} − x^2 − 1``

``f'(x) = 2e^{x - 1} - 2x \\implies  f'(r_n) = $(df2(root2)) \\approx 0``

``f''(x) = 2e^{x - 1} - 2 \\implies f''(r_n) = $(d2f2(root2)) \\approx 0``

``f''(x) = 2e^{x - 1} \\implies f''(r_n) = $(d3f2(root2)) \\approx 2``

Multiplicity `` m = 3 ``

Comparing to results with Theorem 1.12.

``S = $(S) \\approx \\frac{2}{3} = \\frac{m-1}{m}``. Thus ``m = 3``. 

Root found with modified newton's Method ``r_m = $(modifiedRoot2)``

Forward error with normal newton's Method: ``| 1 - r_n | = $(abs(1 - root2))``

Backward error with normal Newton's Method = ``| f(r_n) | = $(abs(val2))``

Forward error with modified newton's Method: ``| 1 - r_m | = $(abs(1 - modifiedRoot2))``

Backward error with normal Newton's Method = ``| f(r_n) | = $(abs(modifiedVal2))``

""")

# ╔═╡ 6526fa31-afb3-4cb4-a12b-11d1dec210f9
begin
	g(r :: Float64) = pi * 10/3 * r^2 + 2/3 * pi * r^3 - 60
	dg(r :: Float64) = pi * 20/3 * r + 2 * pi * r^2'

	radius, value = newtons(g, dg, 2.0, 0.5*10^-4)

	Dict("radius" => radius, "value" => value)
end

# ╔═╡ 4785a987-d5ba-48d7-9518-997c61b1a202
Markdown.parse(""" # Section 1.4: Computer Problem 6:

A 10-cm-high cone contains ``60 cm^3`` of ice cream, including a hemispherical scoop on top. Find the radius of the scoop to four correct decimal places.


## Answer
``h = 10``

``V(r) = V_{cone}(r) + V_{hemisphere}(r) = \\frac{1}{3} \\pi r^2h + \\frac{1}{2}\\frac{4}{3} \\pi r^3 = \\frac{1}{3} \\pi r^2h + \\frac{2}{3} \\pi r^3 = \\frac{10}{3} \\pi r^2 + \\frac{2}{3} \\pi r^3``

``V(r) = 60``

``g(r) = V(r) - 60 = \\frac{10}{3} \\pi r^2 + \\frac{2}{3} \\pi r^3 - 60``

``x_0 = 2``

``g'(r) = \\frac{20}{3} \\pi r + 2 \\pi r^2``

The radius to 4 correct decimal places is $(radius) cm.
""")

# ╔═╡ Cell order:
# ╠═cc6788cc-5892-11ee-17d4-993f8bf833ca
# ╠═c1a7d640-dc94-4f20-b1c6-45676d3ae59b
# ╟─8b49909f-dba4-4c31-8224-2eb2b0983b10
# ╠═313e267b-85e8-4c1b-85b1-14e1d702fd39
# ╟─7e51800f-f443-4090-bc60-54f49af53df8
# ╠═38559c69-022d-4071-84b4-93bb18994406
# ╟─4785a987-d5ba-48d7-9518-997c61b1a202
# ╠═6526fa31-afb3-4cb4-a12b-11d1dec210f9
