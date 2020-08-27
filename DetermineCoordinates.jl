root_Directory = pwd()

include(root_Directory * "\\Wolf\\NearestNeighbours\\BC_1_EndSite.jl")
include(root_Directory * "\\Wolf\\NearestNeighbours\\BC_1_LatticeStart.jl")
include(root_Directory * "\\Wolf\\NearestNeighbours\\BC_1_TopRow.jl")
include(root_Directory * "\\Wolf\\NearestNeighbours\\BC_Bottom_Row.jl")
include(root_Directory * "\\Wolf\\NearestNeighbours\\BC_EndSite_1.jl")
include(root_Directory * "\\Wolf\\NearestNeighbours\\BC_Last_Site.jl")
include(root_Directory * "\\Wolf\\NearestNeighbours\\BC_LeftRow.jl")
include(root_Directory * "\\Wolf\\NearestNeighbours\\BC_RightRow.jl")
include(root_Directory * "\\Wolf\\NearestNeighbours\\General_findNearestNeighbours.jl")

function DetermineCoordinates(x, row, col, p, listOfCoordinates)

    perimeter_Spin_coordinates = []

    if (row-1) == 0
        if (col-1) == 0

            #1,1
            #println(row, "," , col)
            perimeter_Spin_coordinates = BC_1_LatticeStart(x, row, col, p, listOfCoordinates)

        elseif (col+1) == columns + 1

            # 1,5
            #println(row, "," , col)
            perimeter_Spin_coordinates = BC_1_EndSite(x, row, col, p, listOfCoordinates)

        else

            # 1,2  ;   1,3   ;   1,4
            #println(row, "," , col)
            perimeter_Spin_coordinates = BC_1_TopRow(x, row, col, p, listOfCoordinates)
        end

    elseif (col - 1)  == 0    &&    (row-1) != 0

        if (row+1) == rows + 1

            # 5,1
            #println(row, "," , col)
            perimeter_Spin_coordinates = BC_EndSite_1(x, row, col, p, listOfCoordinates)

        else

            # 2,1  ;   3,1    ;    4,1
            #println(row, "," , col)
            perimeter_Spin_coordinates = BC_LeftRow(x, row, col, p, listOfCoordinates)

        end

    elseif (row + 1)   == rows + 1  &&    (col - 1) != 0

        if (col + 1) == columns + 1
            # 5,5
            #println(row, "," , col)
            perimeter_Spin_coordinates = BC_Last_Site(x, row, col, p, listOfCoordinates)

        else
            # 5,2  ; 5,3  ;   5,4
            #println(row, "," , col)
            perimeter_Spin_coordinates = BC_Bottom_Row(x, row, col, p, listOfCoordinates)

        end

    elseif (col+1)   == columns + 1    &&   (row - 1) != 0   &&   (row + 1) != rows + 1

        # 2,5 ,   3,5 , 4,5
        #println(row, "," , col)
        perimeter_Spin_coordinates = BC_RightRow(x, row, col, p, listOfCoordinates)

    else

        #println(row, "," , col)
        perimeter_Spin_coordinates = General_findNearestNeighbours(x, row, col, p, listOfCoordinates)

    end

    return perimeter_Spin_coordinates

end
