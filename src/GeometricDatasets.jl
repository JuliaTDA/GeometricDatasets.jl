module GeometricDatasets
using LinearAlgebra
using Distances
using NearestNeighbors
using Distances
using Base.Threads
using StatsBase: mean
export @threads

include("types.jl");
export PointCloud;

include("maps.jl");
export include_space, 
    translate_space;

include("sampling.jl");
export epsilon_net, 
    farthest_points_sample;

include("manifolds.jl");
export sphere, cube, torus;

include("density.jl");
export pairwise_distance_summary, density_estimation, excentricity;

include("distance to measure.jl");
export distance_to_measure;

end # module GeometricDatasets