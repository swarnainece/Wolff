root_Directory = pwd()
include(root_Directory * "\\Wolf\\DetermineCoordinates.jl")

function growCluster(x, listOfCoordinates, p)

    #println("length(listOfCoordinates)", length(listOfCoordinates))
    #println(x)

    LastCount = length(listOfCoordinates)
    #println("LastCount",LastCount)

    for iCount = 1:length(listOfCoordinates)  # Ignore the first as it has been already called

        #println(listOfCoordinates[iCount])
        row = listOfCoordinates[iCount][1]
        col = listOfCoordinates[iCount][2]
        listOfCoordinates = DetermineCoordinates(x, row, col, p, listOfCoordinates)
    end

    newCount = length(listOfCoordinates)
    #println("newCount",newCount)
    #println("Updated Cluster", listOfCoordinates)

    if newCount > LastCount

        #recursion
        growCluster(x, listOfCoordinates, p)
    end

    return listOfCoordinates
end
