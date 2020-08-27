root_Directory = pwd()
include(root_Directory * "\\Wolf\\NearestNeighbours\\GenerateRandomNumber.jl")


function BC_1_EndSite(x, row, col, p, listOfCoordinates) # 1,5

    #println("p = ", p)

    if x[row, col] == x[row, col-1]
        #Parallel spin
        r = GenerateRandomNumber()
        #println("r = ", r)
        #println("***********************************")
        if r < p
            #bond Exist
            if ([row, col-1] in listOfCoordinates) == false

                push!(listOfCoordinates, [row, col-1])
            end
        end

    end

    if x[row, col] == x[rows, col]

        #Parallel spin
        r = GenerateRandomNumber()
        #println("r = ", r)
        #println("***********************************")
        if r < p

            if ([rows, col] in listOfCoordinates) == false

                push!(listOfCoordinates, [rows, col])
            end
        end

    end

    if x[row, col] == x[row, 1]

        #Parallel spin
        r = GenerateRandomNumber()
        #println("r = ", r)
        #println("***********************************")
        if r < p
            if ([row, 1] in listOfCoordinates) == false

                push!(listOfCoordinates, [row, 1])
            end
        end
    end

    if x[row, col] == x[row+1, col]

        #Parallel spin
        r = GenerateRandomNumber()
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
