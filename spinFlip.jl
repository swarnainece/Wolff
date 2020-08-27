

function spinFlip(x, listOfCoordinates)

    #println(x)

    for i in 1:length(listOfCoordinates)

        value = x[listOfCoordinates[i][1], listOfCoordinates[i][2]]
        x[ listOfCoordinates[i][1], listOfCoordinates[i][2] ] = value*(-1)
    end

    return x
end
