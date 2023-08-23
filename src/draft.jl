using GeometricDatasets
using Plots
using LinearAlgebra
using BenchmarkTools

@benchmark sphere(1000; radius = 100, noise = x -> randn(x) * 10)
X = sphere(100000; radius = 100, noise = x -> randn(x) * 10)
scatter(X[1, :], X[2, :], alpha = 0.2)

X = sphere(100000, dim = 3, radius = 10, noise = randn)
scatter(X[1, :], X[2, :], X[3, :])

X = cube(1000, dim = 2, radius = 10, noise = randn)
scatter(X[1, :], X[2, :])

X = cube(1000, dim = 2, radius = 10, noise = rand)
scatter(X[1, :], X[2, :])

X = hcat(cube(1000), cube(1000) .+ [1, 0], sphere(1000, radius = 0.4))
[X ; zeros(size(X)[2])]

[1:10 1:10]

scatter(X[1, :], X[2, :])

X = torus(1000, r = 1, R = 5)
scatter(X[1, :], X[2, :])
scatter(X[1, :], X[3, :])
scatter(X[2, :], X[3, :])
scatter(X[1, :], X[2, :], X[3, :], aspect_ratio = :equal)

X = torus(1000)
X .+ [1, 2, 3]

reshape(1:9, (3, 3)) .+ (1, 2, 3)

epsilon_net(X, 0.3)


using GeometricDatasets
import GeometricDatasets.Filters as gd_f

X = randn(2, 5000)

k = x -> exp(-x^2)
k = identity
dens = gd_f.density(X, kernel_function = X -> X .|> k |> sum)

using Makie
using GLMakie
scatter(X, color = dens)

ids = farthest_points_sample(X, 200)
Y = X[:, ids]
dens = gd_f.density(Y, kernel_function = X -> X .|> k |> sum)
scatter(Y, color = dens)