module GeometricDatasets
using LinearAlgebra

"""
Create a sphere in R^(`dim`) with `n` points and radius `radius`.

# Arguments
- `n::Integer`: the number of points.
- `dim::Integer`: the dimension of the sphere (that is: in which R^dim it is).
- `radius::Number`: the radius of the sphere.
- `noise::Function`: a function such that `y = noise(dim)` is a `Vector{<:Number}` with `size(y) = (dim;)`.
"""
function sphere(n::Integer = 100; dim::Integer = 2, radius::Number = 1, noise::Function = zeros)
    X = rand(dim, n) .- 0.5
    X = mapslices(X, dims = 1) do x
        y = normalize(x) .* radius + noise(dim)
        return y
    end
        
    return X
end

"""
Create a cube in R^(`dim``) with `n` points and radius `radius`.

# Arguments
- `n::Integer`: the number of points.
- `dim::Integer`: the dimension of the cube (that is: in which R^dim it is).
- `radius::Number`: the "radius" of the cube, that is, the distance from the center to one of its sides..
- `noise::Function`: a function such that `y = noise(dim)` is a `Vector{<:Number}` with `size(y) = (dim;)`.
"""
function cube(n::Integer = 100; dim::Integer = 2, radius::Number = 1, noise::Function = zeros)
    X = rand(dim, n) .- 0.5
    X = mapslices(X, dims = 1) do x
        y = normalize(x, 1) .* radius + noise(dim)
        return y
    end
        
    return X
end

"""
    torus(n::Integer = 100; r::Number = 1, R::Number = 3)

# Arguments
- `n::Integer`: the number of points.
- `r::Number`: the inner radius.
- `R::Number`: the outer radius.
"""
function torus(n::Integer = 100; r::Number = 1, R::Number = 3)
    θ = rand(n) * 2π
    ϕ = rand(n) * 2π

    x = @. (R + r * cos(θ)) * cos(ϕ)
    y = @. (R + r * cos(θ)) * sin(ϕ)
    z = @. r * sin(θ)

    X = permutedims([x y z], [2, 1])
    return X    
end

export sphere, cube, torus

end # module GeometricDatasets