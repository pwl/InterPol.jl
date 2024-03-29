# InterPol

Given values of a function y=y(x) `y=[...]` at points `x=[...]` we can
generate an interpolating polynomial p(x).  This package provides two
functions: `interpolateAt` and
`interpolateDerivativeAt`.  `interpolateAt[x,y,x0]` gives the value of
the interpolating polynomial p at the point
x0.  `interpolateDerivativeAt[x,y,x0]` evaluates p' at the point x0.  For example
```
julia> interpolateAt([0,1,2],[0,1,4],1)
1.0
julia> interpolateDerivativeAt([0,1,2],[0,1,4],1)
2.0
```


[![Build Status](https://travis-ci.org/pwl/InterPol.jl.svg)](https://travis-ci.org/pwl/InterPol.jl)
