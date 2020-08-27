root_Directory = pwd()
include(root_Directory * "\\Wolf\\NearestNeighbours\\GenerateRandomNumber.jl")

function BC_RightRow(x, row, col, p, listOfCoordinates) # 2,5 ,  3,5 ,  4,5

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

    if x[row, col] == x[row, 1]

        #Parallel spin
        r = GenerateRandomNumber()
        #r = rand()
        #println("r = ", r)
        #println("***********************************")
        if r < p
            #bond Exist
            if ( [row, 1] in listOfCoordinates) == false

                push!(listOfCoordinates, [row, 1])
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
