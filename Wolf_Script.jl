root_Directory = pwd()

include(root_Directory * "\\Wolf\\createArray.jl")
include(root_Directory * "\\Wolf\\growCluster.jl")
include(root_Directory * "\\Wolf\\WolfBody.jl")


arrayType = "positive" # positive, negative, both

#ENV["PYTHON"] = "C:\\Users\\swarn\\Anaconda3\\python.exe"
ENV["MPLBACKEND"]="tkagg"

using Pkg
using PyCall
using PyPlot
using Random
using Statistics

pygui(true)
plt = pyimport("matplotlib.pyplot")
animation = pyimport("matplotlib.animation")
np = pyimport("numpy")

path = "C:\\Users\\swarn\\Desktop\\Apply Academic\\Wolf\\im.gif"

fig, ax = plt.subplots()

global rows = 20
global columns = 20
Energy = 0

temperature = 1 # initialize temperature
global FinalTemp = 50

#MonteCarloSweeps = 50

x = createArray(arrayType)
AnimationArray = Wolf_Algo_Body(x, temperature, ax)

ani = animation.ArtistAnimation(fig, AnimationArray, interval=50, blit=true, repeat_delay=1000)
ani.save(path)  #Location to save
plt.show()
