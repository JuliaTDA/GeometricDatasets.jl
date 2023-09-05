"""
    PointCloud

A type to represent a finite subset of R^n. The definition is simple:

```
PointCloud = Matrix{<:Number}
```
"""
PointCloud = Matrix{<:Number}