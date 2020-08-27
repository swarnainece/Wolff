root_Directory = pwd()

include(root_Directory * "\\Wolf\\DetermineCoordinates.jl")
include(root_Directory * "\\Wolf\\growCluster.jl")
include(root_Directory * "\\Wolf\\spinFlip.jl")

using Random
using Statistics

function Wolf_MagnetizationVsTemp_Body(x, initial)

    increment = initial

    while increment <= Final

        ArrayMagnetization = []

        #println("***********************************")
        #println("temperature", increment)
        #println("***********************************")

        p = 1 - exp(-2/increment)
        #p = p/(temperature*2.5)
        #p = p/(temperature*2)
        #println("p = ", p)

        for iCount = 1:MonteCarloSweeps

            listOfCoordinates = []
            perimeter_Spin_coordinates = []

            # Randomly select a site
            random_site = 0
            randomList = []

            for i in 1:2

                random_site =  Random.rand(1:rows)
                push!(randomList, random_site)
            end

            #println("***********************************")
            #println("Random List", randomList)
            #println("***********************************")

            row = randomList[1]
            col = randomList[2]

            #seed site
            push!(listOfCoordinates, [row, col])

            #println("First Cluster", x)

            listOfCoordinates = growCluster(x, listOfCoordinates, p)

            x = spinFlip(x, listOfCoordinates)
            count_positiveOnes = count(i->(i == 1), x)
            count_negativeOnes = count(i->(i == -1), x)
            diff = count_positiveOnes - count_negativeOnes
            diff = abs(diff)
            push!(ArrayMagnetization, diff)
        end

        mean_of_Array = Statistics.mean(ArrayMagnetization)
        push!(ArrayOfMagnetization, mean_of_Array)

        increment += 0.1
    end
end


function MagnetizationCurve(x)

    for iCount in 1:length(x)
        k = (x[iCount] - minimum(x))/(maximum(x) - minimum(x))
        k = round(k, digits=3)
        push!(NormalizedMagnetization, k)
    end
end
