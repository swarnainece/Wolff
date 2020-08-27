root_Directory = pwd()
include(root_Directory * "\\Wolf\\NearestNeighbours\\GenerateRandomNumber.jl")

using Distributions

function General_findNearestNeighbours(x, row, col, p, listOfCoordinates) # in a 2D-Ising model there are 4 nearest neighbours

    #println("p = ", p)

    if x[row, col] == x[row, col-1]

        #Parallel spin
        r = GenerateRandomNumber()
        #r = rand()
        #println("r = ", r)
        #println("***********************************")
        if r < p
            #bond Exist
            if ([row, col-1] in listOfCoordinates) == false

                push!(listOfCoordinates, [row, col-1])
            end
        end

    end

    if x[row, col] == x[row-1, col]

        #Parallel spin
        r = GenerateRandomNumber()
        #r = rand()
        #println("r = ", r)
        #println("***********************************")
        if r < p
            #bond Exist
            if ([row-1, col] in listOfCoordinates) == false

                push!(listOfCoordinates, [row-1, col])
            end
        end

    end

    if x[row, col] == x[row, col+1]

        #Parallel spin
        r = GenerateRandomNumber()
        #r = rand()
        #println("r = ", r)
        #println("***********************************")
        if r < p
            #bond Exist
            if ([row, col+1] in listOfCoordinates) == false

                push!(listOfCoordinates, [row, col+1])
            end
        end

    end

    if x[row, col] == x[row+1, col]

        #Parallel spin
        r = GenerateRandomNumber()
        #r = rand()
        #println("r = ", r)
        #println("***********************************")
        if r < p
            #bond Exist
            if ([row+1, col] in listOfCoordinates) == false

                push!(listOfCoordinates, [row+1, col])
            end
        end
    end

    return listOfCoordinates
end
