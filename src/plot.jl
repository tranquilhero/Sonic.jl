using Plots

x = 0:0.1:2π
y = cos.(x)

plot(x, y)

function foo(x, y)
    z = 22(x + y)
    return sin(z)
end