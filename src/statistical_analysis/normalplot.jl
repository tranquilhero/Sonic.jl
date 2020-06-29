# File: normalplot.jl
# Author:
# Date: 29-June-2020

# import XL file
[~,dates,returns] = getXLData('hfma_matlab_data.xlsx','CTA Index');

figure; # create figure
normplot(returns); # plot normal probability



#Plotting univariate distributions
using Distributions
using StatsPlots

norm = fit(Normal, rand(100))
plot(norm)

# plotting a multivariate normal Distribution

mvnorm = fit(MvNormal, [rand(0.0:100.0, 100) rand(0.0:100.0, 100)]')

Z = [pdf(mvnorm,[i,j]) for i in 0:100, j in 0:100]
plot(0:100,0:100,Z,st=:surface)

# I was able to hack together something that looks decent.
# Below is the code as well as the output for some data I’m working with:
X = 3
Y = 5
x = 0:maximum(X)
y = 0:(maximum(Y)/length(x))+1:maximum(Y) # because x and y are of different lengths
z = [pdf(mvnorm, [i, j]) for i in x, j in y]
using PyPlot
pyplot()

plot(x, y, z, linetype=:surface, legend=false, color=:blues)
plot!(x, y, z, linetype=:wireframe, legend=false, color=:black, width=0.1)
