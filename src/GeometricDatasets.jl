module GeometricDatasets
using LinearAlgebra

include("types.jl");
export PointCloud;[

include("maps");
export immersion;

include("manifolds.jl");
export sphere, cube, torus;

end # module GeometricDatasets