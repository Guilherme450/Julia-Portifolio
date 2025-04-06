function binarySearch(array::Vector{Int}, target::Int)
    start::Int = 1
    length_array::Int = length(array)

    while start <= length_array
        mid::Int = start + (length_array - start) ÷ 2

        if array[mid] > target
            length_array = mid - 1
        elseif array[mid] < target
            start = mid + 1
        else
            return mid
        end
    end
    return -1
end

my_array::Vector{Int} = [2, 5, 9, 10, 23, 24, 34, 37, 39, 44, 45, 50]

my_target::Int = 50

@time println(binarySearch(my_array, my_target))