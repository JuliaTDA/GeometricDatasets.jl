module GeometricDatasets
using LinearAlgebra

function sphere(n::Integer = 100; dim::Integer = 2, radius::Number = 1)
    X = rand(dim, n) .- 0.5
    for x ∈ eachcol(X)
        normalize!(x) .* radius
    end
    X
end

export sphere

end # module GeometricDatasets