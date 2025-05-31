mutable struct Node
    data::Int
    next::Union{Node, Nothing}
    prev::Union{Node, Nothing}

    function Node(data::Int)
        new(data, nothing, nothing)
    end
end

mutable struct DoublyLinkedList
    head::Union{Node, Nothing}
    tail::Union{Node, Nothing}
end

function DoublyLinkedList()
    DoublyLinkedList(nothing, nothing)
end

#method for inserting data
function insert!(list::DoublyLinkedList, data::Int)
    # Initializing the node
    new_node = Node(data)
    if list.head === nothing
        list.head = new_node
        list.tail = new_node
        return
    end
    new_node.next = list.head
    list.head.prev = new_node
    list.head = new_node
end

function showList(list::DoublyLinkedList)
    println("(HEAD -> TAIL):")
    temp = list.head

    while temp !== nothing
        print("$(temp.data) <-> ")

        temp = temp.next
    end
    print("nothing")

    println("\n(TAIL -> HEAD):")
    temp = list.tail

    while temp !== nothing
        print("$(temp.data) <-> ")
        temp = temp.prev
    end

    print("nothing")

end

function main()
    list = DoublyLinkedList()

    insert!(list, 10)
    insert!(list, 12)
    insert!(list, 9)
    insert!(list, 1)
    insert!(list, 2)
    insert!(list, 3)
    insert!(list, 4)
    insert!(list, 5)
    insert!(list, 0)

    showList(list)
end

main()