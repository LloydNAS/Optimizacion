using Calculus
using GLMakie

f(x) = sin(x)

image = lines(range(0,10,length=100),f, color = :blue)
pointa = scatter!([0],[0],color="red")
pointb = scatter!([0],[0],color="red")

function graph(a,b)
    delete!(image.axis, pointa)
    delete!(image.axis, pointb)

    global pointa = scatter!([a],[f(a)],color="red")
    global pointb = scatter!([b],[f(b)],color="red")

    sleep(0.5)
    display(image)
end

function BSC()
    a = π
    b = 2π
    error = 0.001
    needGraph = true

    while abs(a-b)>error
        alpha = (a+b)/2

        if needGraph
            graph(a,b)
        end

        if derivative(f,a)*derivative(f,alpha) <= 0
            b = alpha
        else
            a = alpha
        end
    end

    print("x = ",a," f(x) = ",f(a))
end

BSC()