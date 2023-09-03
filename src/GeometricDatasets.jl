module GeometricDatasets
using LinearAlgebra
using Distances
using NearestNeighbors
using Distances
using Base.Threads
export @threads

using Quartomenter;
export @qdoc;

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

include("Filters/Filters.jl")
using .Filters;

end # module GeometricDatasets