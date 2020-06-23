my_f(x,y) = x^2 + 3y^2

derivate_of_my_f(x, y) = ForwardDiff.derivate(x->my_f(x,y), x)
