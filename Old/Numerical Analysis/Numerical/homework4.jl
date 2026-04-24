### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ c5ea859b-f7b6-47ed-98f6-b871a9a3132a
using LinearAlgebra

# ╔═╡ 4fc2cea3-5cc6-43de-9252-8d037268a431
md"""
# Section 2.3 Problem 4
"""

# ╔═╡ 6caefa12-5e61-11ee-021e-2b70021858f5
begin

	result = ""

	for i in 1:5
		n = 100 * i
		M = [sqrt((i - j)^2 + n/10) for i in 1:n, j in 1:n]
		Minv = inv(M)
		x = ones(n, 1)
		b = M * x

		x_c = M\b

		FE = norm(x - x_c, Inf)
		rFE = FE/norm(x, Inf)
		BE = norm(b - M*x_c, Inf)
		rBE = BE/norm(b, Inf)

		global result *= """**If n = $(n)**:
		The forward error is **$(FE)**. The backward error is **$(BE)**. The relative forward error is **$(rFE)**. The relative backward error is **$(rBE)**. the error magnification factor is **$(rFE/rBE)**. Finally the condition number is **$(opnorm(M, Inf) * opnorm(Minv, Inf))**.
	
		"""
	end

	Markdown.parse(result)
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
# ╠═c5ea859b-f7b6-47ed-98f6-b871a9a3132a
# ╟─4fc2cea3-5cc6-43de-9252-8d037268a431
# ╠═6caefa12-5e61-11ee-021e-2b70021858f5
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
