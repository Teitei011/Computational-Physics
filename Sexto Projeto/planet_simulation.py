import math as m

N = 1000
Ms = 2. * 10.**30.
G = (4. * m.pi**2.) / Ms

r = float(input("Coloque o valor de r: "))
voy = float(input("Coloque a velocidade inicial Vo: "))
dt = float(input("Coloque o intervalo de tempo dt: "))


x0 = r
x = 0
y = 0
y0 = 0
x1 = 0

for i in range(N):
    if (i == 0):
        y1 = voy * dt
        
    ay = - (G * Ms * y) / (r**3.)
    ax = - (G * Ms * x) / (r**3.)

    r = m.sqrt(x**2. + y**2.)
    print(r)

    y = 2. * y1 - y0 + ay * dt**2.
    x = 2. * x1 - x0 + ax * dt**2.

    y0 = y1
    y1 = y

    x0 = x1
    x1 = x

    print(str(i) + " x--> " + str(x) + " y-->", str(y))
