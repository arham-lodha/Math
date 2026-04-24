### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 42c00976-24da-4e76-a105-5c8331ae78fc
using LinearAlgebra

# ╔═╡ 488524bf-ef96-4d6f-96c0-95c5ed0e43de
begin
	n = 100
	x_actual :: Vector{Float64} = [(-1)^(i - 1) for i in 1:n]
	A :: Matrix{Float64} = zeros(n, n)

	for i in 1:n
		A[i, i] = 2

		if i != 1
			A[i, i - 1] = 1
		end

		if i != n
			A[i, i + 1] = 1
		end
	end

	guess = ones(n)
	
	b = zeros(n)
	b[1] = 1
	b[n] = -1

	"Setup"
	
end

# ╔═╡ 5e3253ee-ba14-4187-8602-7765dde71f7e
function applyA(x)
	if length(x) != n
		throw("Size Mismatch")
	end
	
	Ax = 2x
	for i in 1:n
		if i != 1
			Ax[i] += x[i - 1]
		end

		if i != n
			Ax[i] += x[i + 1]
		end
	end
	return Ax
end

# ╔═╡ 27f3863c-b8a8-4611-a092-9d9736879541
function jacobi(A :: Matrix{Float64}, b::Vector{Float64}, x0 :: Vector{Float64}, x_actual::Vector{Float64}, tolerance::Float64)
	x = x0
	iterations = 0
	
	while norm(x_actual - x, Inf) > tolerance
		x1 = copy(b)
		
		for i = 1:n
			for j = 1:n
				if i != j
					x1[i] -= A[i, j] * x[j]
				end
			end

			x1[i] /= A[i, i]
		end


		x = x1
		iterations += 1
	end

	return (x, iterations)
end

# ╔═╡ e5985eb0-e379-44ac-8f79-3a655e3f314a
function gauss_sidel(A :: Matrix{Float64}, b::Vector{Float64}, x0 :: Vector{Float64}, x_actual::Vector{Float64}, tolerance::Float64)
	x = x0
	iterations = 0
	
	while norm(x_actual - x, Inf) > tolerance
		x1 = copy(b)
		
		for i = 1:n
			for j = 1:n
				if i < j
					x1[i] -= A[i, j] * x1[j]
				elseif i > j
					x1[i] -= A[i, j] * x[j]
				end
			end

			x1[i] /= A[i, i]
		end


		x = x1
		iterations += 1
	end

	return (x, iterations)
end

# ╔═╡ c9388fe0-8e08-4a62-93ad-a4ceb7b836d4
function sor(A :: Matrix{Float64}, b::Vector{Float64}, w::Float64, x0 :: Vector{Float64}, x_actual::Vector{Float64}, tolerance::Float64)
	x = x0
	iterations = 0
	
	while norm(x_actual - x, Inf) > tolerance
		x1 = copy(b)
		
		for i = 1:n
			for j = 1:n
				if i < j
					x1[i] -= A[i, j] * x1[j]
				elseif i > j
					x1[i] -= A[i, j] * x[j]
				end
			end

			x1[i] /= A[i, i]
		end


		x = w * x1 + x * (1 - w)
		iterations += 1
	end

	return (x, iterations)
end

# ╔═╡ 11f0ab40-d299-4985-803e-7649cbd645bf
begin
	x_jacobi, jacobi_iterations  = jacobi(A, b, guess, x_actual, 0.5 * 10^(-3)) 

	Markdown.parse("""
	## 2.5 Computer problem 2
	Number of steps: $(jacobi_iterations)
	
	Backward Error: $(norm(b - applyA(x_jacobi), Inf))

	Approximate solution: $(x_jacobi)
	""")
end

# ╔═╡ 5e257133-be16-46fe-9737-646f57cee70b
begin
	x_gs, gs_iterations = gauss_sidel(A, b, guess, x_actual, 0.5 * 10^-3)
	Markdown.parse("""
	## 2.5 Computer problem 6
	Number of steps: $(gs_iterations)
	
	Backward Error: $(norm(b - applyA(x_gs), Inf))

	Approximate solution: $(x_gs)
	""")
end

# ╔═╡ 90c08455-2f31-4f91-8a93-76c3f4c079de
begin
	x_sor, sor_iterations = sor(A, b, 1.2, guess, x_actual, 0.5 * 10^-3)

	Markdown.parse("""
	## 2.5 Computer problem 6b
	Number of steps: $(sor_iterations)
	
	Backward Error: $(norm(b - applyA(x_sor), Inf))

	Approximate solution: $(x_sor)
	""")
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.3"
manifest_format = "2.0"
project_hash = "ac1187e548c6ab173ac57d4e72da1620216bce54"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.5+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.21+4"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+0"
"""

# ╔═╡ Cell order:
# ╠═42c00976-24da-4e76-a105-5c8331ae78fc
# ╠═488524bf-ef96-4d6f-96c0-95c5ed0e43de
# ╠═5e3253ee-ba14-4187-8602-7765dde71f7e
# ╠═27f3863c-b8a8-4611-a092-9d9736879541
# ╠═e5985eb0-e379-44ac-8f79-3a655e3f314a
# ╠═c9388fe0-8e08-4a62-93ad-a4ceb7b836d4
# ╠═11f0ab40-d299-4985-803e-7649cbd645bf
# ╠═5e257133-be16-46fe-9737-646f57cee70b
# ╠═90c08455-2f31-4f91-8a93-76c3f4c079de
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
