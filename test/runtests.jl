using InterPol
using Base.Test

@test interpolateAt([0], [0], 1) == 0

@test interpolateAt([0], [1], 1) == 1

@test interpolateAt([0,1,2,3], [0,1,2,3], 0) == 0

@test interpolateAt([0,1,2,3], [0,1,2,3], 4) == 4

@test interpolateAt([0,1,2], [0,1,4], 0) == 0

@test interpolateAt([0,1,2], [0,1,4], 1) == 1

@test interpolateAt([0,1,2], [0,1,4], 3) == 9



@test interpolateDerivativeAt([0], [0], 1) == 0

@test interpolateDerivativeAt([0], [1], 1) == 0

@test interpolateDerivativeAt([0,1,2,3], [0,1,2,3], 0) == 1

@test interpolateDerivativeAt([0,1,2,3], [0,1,2,3], 4) == 1

@test interpolateDerivativeAt([0,1,2], [0,1,4], 0) == 0

@test interpolateDerivativeAt([0,1,2], [0,1,4], 1) == 2

@test interpolateDerivativeAt([0,1,2], [0,1,4], 3) == 6
