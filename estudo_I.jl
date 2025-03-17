# Book é uma estrutura imutável que armazena as caracteristicas de um livro
struct Book
    title::String
    authorName::String
    price::Float16
    pages::Int16

    # iniciando um construtor personalizado
    function Book(title::String, authorName::String, price::Float16, pages::Int16)
        if price < 0 || pages <= 0
            error("Price cannot be negative and the number of pages 
            need to be greater than zero")
        end
        return new(title, authorName, price, pages)
    end
end

array_books = Book[]

# estrutura mutável que armazena os livros e a quantidade
mutable struct Stock
    books::Dict{Book, Int16}

    function Stock()
        new(Dict{Book, Int16}())
    end
end

function addBookData(arr_book::Vector{Book}, bookTitle::String, authorName::String,
    bookPrice::Float16, n_pages::Int16)
    
    push!(arr_book, Book(bookTitle, authorName, bookPrice, n_pages))
end

# criar métodos para inserção, remoção, pesquisa e atualização de dados
function addNewBook(stock::Stock, book::Book, quantity::Int=1)
    if quantity < 0
        error("quantity must be greater or equal to zero")
    end

    # verificar se o livro já existe no inventário
    if haskey(stock.books, book)
        stock.books[book] += quantity
    else
        stock.books[book] = quantity
    end
end

function main()
    addBookData(array_books, "O Senhor dos Anéis", "J.R.R. Tolkien", convert(Float16, 50.9),
    convert(Int16, 1200))

    addBookData(array_books, "Naruto", "Masashi Kishimoto", convert(Float16, 30.9),
    convert(Int16, 60))

    println(array_books[1])

    stock = Stock()

    addNewBook(stock, array_books[1], 5)
    addNewBook(stock, array_books[2], 20)

    println(stock.books)
end

main()