# -*- coding: utf-8 -*-
"""
Created on Tue Oct 23 22:54:33 2018

@author: Mike Go
"""

import numpy as np
import matplotlib.pyplot as plt

#Define the Logistic Equation. This will be used for most part of this algorithm
#Let us use this time the form of the logistic equation without any coefficient at the beginning
#compared to the previous exercise of using 4*r*x*(1-x)
def Log(x,r):
    return r*x*(1-x)

#1. Lyapunov Exponent
#The Lyapunov Exponent of a Logistic Map is given by the infinite lim of 1/n multiplied by the summation of ln(df(x_i)/dx) from
#zero to n-1.

#We begin by determining the derivative of the Logistic Map and getting it's natural logarithm
def Lyapunov (x,r):
    return np.log(abs(r - 2*r*x))

#We then define our parameter in order for us to iterate the summation function later
n = 10000
r = np.linspace(2.5,4.0,n)
iteration = 1000
lyp = np.zeros(n)
x = 1e-5*np.ones(n)

#The following code allows us to create a summation for the Lyapunov Exponent
for i in range (iteration):
    x = Log(x,r)
    lyp += Lyapunov(x,r)
fig, ax2 = plt.subplots(1,1, figsize=(8,9), sharex=True)
#Horizontal Line at y = 0
ax2.axhline(0,color='k',lw=0.5,alpha=0.5)
#Negative Values
ax2.plot(r[lyp < 0], lyp[lyp < 0] / iteration, '.k', alpha=0.5, ms=.5)
#Positive Values
ax2.plot(r[lyp >= 0], lyp[lyp >= 0] / iteration, '.r', alpha=0.5, ms=0.5)
ax2.set_xlim(2.5,4)
ax2.set_ylim(-2,1)
ax2.set_xlabel('r')
ax2.set_ylabel('Lambda')
ax2.set_title('Liapunov Exponents of the Logistic Map')

#2. Bifurcation Diagram
#The bifurcation diagram is a simple iteration of the logisitc map. It's simply a plot of all the possible r values and their corresponding X values
rs = np.linspace(2.5,4,1000) #We define the range of values our paramter r will range. In this case we want it to iterate from 0 to 4 10,000 times
x_n = [] #We place our (x,r) values
for r in rs: #We iterate across all the r values from 0 to 4 
    x = 0.00001 #We Set an Initial X value
    for i in range (900):
        x = Log(x,r)
    for i in range (100):
        x = Log(x,r)
        x_n.append([x,r])

x_n = np.array(x_n)
fig, ax1 = plt.subplots(1, 1, figsize=(8,9), sharey=True)
ax1.plot(x_n[:,1], x_n[:,0],',k',alpha=0.25)
ax1.set_xlim(2.5,4)
ax1.set_ylim(0,1)
ax1.set_xlabel('r')
ax1.set_ylabel('x_n')
ax1.set_title('Bifurcation Diagram of the Logistic Map')
   

#3. Time Series
#A way to determine if a function is chaotic is by checking it's Time Series to see if a distict pattern is visible
#The time series is simply the values of our population at different time steps

x = 0.5 #We define the an initial x population. I
r = 3.828427125 #We Set an initial r condition first
x_n = [] #We let this be a list in which all the iterated values of x will be placed
t = [] #We let this be the iteration step. We define our iteration step to be the "time" component of our time series
#Iterate the Logistic Map
for i in range(50):
    x = Log(x,r)
    x_n.append(x)
    t.append(i)
    yaxis = np.array(x_n)
    xaxis = np.array(t)
    
# Plot    
fig, ax0 = plt.subplots(1, 1, figsize=(8, 9), sharey=True)
plt.plot(xaxis,yaxis)
plt.xlabel('t')
plt.ylabel('x_n')
plt.title('Time series of Logistic map with r = 3.828427125')

#4. Cycles of the Logistic Map
#An alternative way of determining if the logistic map is chaotic is by checking it's 

#The function first defines the range and the logistic map as a function if it's parameter r. We then set an initial x value then
#iterate the logistic map again while plotting values along the x and y coordinate
def plot_system(x0, r, n, ax=None):
    t = np.linspace(0, 1)
    ax.plot(t, Log(t, r), 'k', lw=2)
    ax.plot([0, 1], [0, 1], 'k', lw=2)

    x = x0
    for i in range(n):
        y = Log(x, r)
        # Plot the two lines.
        ax.plot([x, x], [x, y], 'k', lw=1)
        ax.plot([x, y], [y, y], 'k', lw=1)
        # Position is plot with increasing opacity every time it overlaps itself
        ax.plot([x], [y], 'ok', ms=10,
                alpha=(i + 1) / n)
        x = y

    ax.set_xlim(0, 1)
    ax.set_ylim(0, 1)

#Plots
fig, ax = plt.subplots(1, 1, figsize=(8, 9), sharey=True)
plot_system(0.5, 3.828427125, 100, ax)
plt.xlabel ('x')
plt.ylabel('x_n')
plt.title('x vs x_n of the Logistic map with r = 3.828427125')












