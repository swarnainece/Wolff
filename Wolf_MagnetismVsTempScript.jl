root_Directory = pwd()

include(root_Directory * "\\Wolf\\createArray.jl")
include(root_Directory * "\\Wolf\\growCluster.jl")
include(root_Directory * "\\Wolf\\Wolff_MagnetismVsTempBody.jl")


arrayType = "positive" # positive, negative, both

#ENV["PYTHON"] = "C:\\Users\\swarn\\Anaconda3\\python.exe"
ENV["MPLBACKEND"]="tkagg"

using Pkg
using PyCall
using PyPlot
using Random
using Statistics
using Distributions

pygui(true)
plt = pyimport("matplotlib.pyplot")
animation = pyimport("matplotlib.animation")
np = pyimport("numpy")

#fig, ax = plt.subplots()

global rows = 10
global columns = 10
Energy = 0
global ArrayOfMagnetization = []
global NormalizedMagnetization = []

initial = 1 # initialize temperature
global Final = 30

MonteCarloSweeps = 100

imageArray = []

x = createArray(arrayType)
Wolf_MagnetizationVsTemp_Body(x, initial)
MagnetizationCurve(ArrayOfMagnetization)

#println(NormalizedMagnetization)

TemperatureAxis = np.linspace(1, 5, length(NormalizedMagnetization))
plt.plot(TemperatureAxis, NormalizedMagnetization ,".")
plt.xlabel("Temperature")
plt.ylabel("Magnetization")
plt.xlim(0, 5)
plt.ylim(0.05, 1.1)
plt.title("Wolff's Algorithm: Magnetization vs Temperature")
plt.show()
