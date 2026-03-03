using DifferentialEquations, Plots

r = 12.3

R0 = 2.277
R0_2 = 3.618


theta_0 = 3*pi/4
theta_1 = (-pi, pi)
using DifferentialEquations, Plots

# расстояние от лодки до катера

k = 12.3

# начальные условия для 1 и 2 случаев

R0 = 2.277 
R1 = 3.618 
theta0 = (0.0, 2*pi) 
theta0_1 = (-pi, pi)

# данные для движения лодки браконьеров

fi = 3*pi/4;
t = (0, 50);

# функция, описывающая движение лодки браконьеров

x(t) = tan(fi)*t;

# функция, описывающая движение катера береговой охраны

f(r, p, t) = r/sqrt(18.36)

# постановка проблемы и решение ДУ для 1 случая

prob = ODEProblem(f, R0, theta0)

sol = solve(prob, saveat = 0.01)
                              

# отрисовка траектории движения катера

plot(sol.t, sol.u, proj=:polar, lims=(0, 15), label = "Траекория движения катера")

                
## необходимые действия для построения траектории движения лодки

ugol = [fi for i in range(0,15)]

x_lims = [x(i) for i in range(0,15)]

# отрисовка траектории движения лодки вместе с катером

plot!(ugol, x_lims, proj=:polar, lims=(0, 15), label = "Траекория движения лодки")

savefig("resultat_exo_2.png")
