module GeometricDatasets
using LinearAlgebra
using Distances
using NearestNeighbors

include("types.jl");
export PointCloud;

include("maps.jl");
export immersion, 
    translation;

include("sampling.jl");
export epsilon_net;

include("manifolds.jl");
export sphere, cube, torus;

end # module GeometricDatasets