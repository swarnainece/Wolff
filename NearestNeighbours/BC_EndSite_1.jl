root_Directory = pwd()
include(root_Directory * "\\Wolf\\NearestNeighbours\\GenerateRandomNumber.jl")

function BC_EndSite_1(x, row, col, p, listOfCoordinates) # 5,1

    #println("p = ", p)

    if x[row, col] == x[row, columns]

        #Parallel spin
        r = GenerateRandomNumber()
        #r = rand()
        #println("r = ", r)
        #println("***********************************")
        if r < p
            #bond Exist
            if ( [row, columns] in listOfCoordinates) == false

                push!(listOfCoordinates, [row, columns])
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

                push!( listOfCoordinates, [row, col+1] )
            end
        end

    end

    if x[row, col] == x[1, col]

        #Parallel spin
        r = GenerateRandomNumber()
        #r = rand()
        #println("r = ", r)
        #println("***********************************")
        if r < p
            #bond Exist
            if ([1, col] in listOfCoordinates) == false

                push!(listOfCoordinates, [1, col])
            end
        end
    end

    return listOfCoordinates

end
