"""
    PointCloud

A type to represent a finite subset of R^n. The definition is simple:

```
PointCloud = Matrix{<:Number}
```
"""
PointCloud = Matrix{<:Number}

"""
    n_points(X)

Returns the number of points of `X`.
"""
n_points(X::PointCloud) = size(X)[2]
n_points(X::Vector{<:Real}) = length(X)