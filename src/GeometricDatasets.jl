module GeometricDatasets
using LinearAlgebra
using Distances
using NearestNeighbors
using Distances
using Base.Threads
export @threads

include("types.jl");
export PointCloud;

include("maps.jl");
export immersion, 
    translation;

include("sampling.jl");
export epsilon_net, 
    farthest_points_sample;

include("manifolds.jl");
export sphere, cube, torus;

include("Filters/Filters.jl")
using .Filters;

end # module GeometricDatasets