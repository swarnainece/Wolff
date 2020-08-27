root_Directory = pwd()


include(root_Directory * "\\Wolf\\DetermineCoordinates.jl")
include(root_Directory * "\\Wolf\\growCluster.jl")
include(root_Directory * "\\Wolf\\spinFlip.jl")

using Random

function Wolf_Algo_Body(x, temperature, ax)                   #x, plt, temperature, ax)

    imageArray = []

    #props = Dict("boxstyle"=>"round", "facecolor"=>"wheat", "alpha"=>0.5)

    while temperature <= FinalTemp

        if temperature <= 2.5

            MonteCarloSweeps = 10
        else
            MonteCarloSweeps = 200

        end

        #println("***********************************")
        #println("temperature", temperature)
        #println("MonteCarloSweeps", MonteCarloSweeps)
        #println("***********************************")

        p = 1 - exp(-2/temperature)
        #p = p/(2)
        #println("p = ", p)

        for iCount = 1:MonteCarloSweeps
            #println("MonteCarloSweeps", iCount)

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
            #println(listOfCoordinates)
            #println(length(listOfCoordinates))

            x = spinFlip(x, listOfCoordinates)
            #println("Second Cluster", x)

            # Create the pre-Compiled Images
            ax.set_title("Wolff's Algorithm of a 2D Ising Lattice")
            im = ax.imshow(x, animated=true)
            push!(imageArray, [im])
        end

        #println(x)
        temperature += 0.5
    end

    return imageArray
end
