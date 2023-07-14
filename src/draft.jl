using GeometricDatasets
using Plots
X = sphere(1000)
scatter(X[1, :], X[2, :])

X = sphere(1000, dim = 3)
scatter(X[1, :], X[2, :], X[3, :])