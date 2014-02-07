
class Book
  attr_accessor :title, :author, :id, :status, :borrower

  def initialize(title, author)
    @author = author
    @title = title
    @id = nil
    @status = "available"
  end

  def check_out
    if @status == "available"
      @status = "checked_out"
      true
    else
      false
    end
  end

  def check_in
    @status == "checked_out" ? @status = "available" : false
  end

end

class Borrower
  attr_reader :name
  def initialize(name)
    @name = name
  end

end

class Library
  attr_accessor :books
  def initialize(name)
    @books = []
    @id_counter = 100
  end

  def register_new_book(title, author)
    new_book = Book.new(title, author)
    new_book.id = @id_counter
    @books << new_book
    @id_counter += 1
  end

  # def add_book(title, author)
  # end

  def check_out_book(book_id, borrower)
    # book = ""
    @books.each do |x|
      if x.id == book_id
        x.check_out
        x.borrower = borrower
        return x
      else
        puts "Book not available"
      end
    end
    # book
  end

  def get_borrower(book_id)
    @books.each do |book|
     if book.id == book_id
      return book.borrower.name
      else
        false
      end
    end
  end

  def check_in_book(book)
  end

  def available_books
  end

  def borrowed_books
  end
end
