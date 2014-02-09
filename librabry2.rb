
class Book
  attr_accessor :title, :author, :id, :status, :borrower

  def initialize(title="some_title", author="some_author")
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
  attr_accessor :borrowed_count, :borrowed_books
  def initialize(name)
    @name = name
    @borrowed_count = 0
    @borrowed_books = []
  end

end

class Library
  attr_accessor :books
  def initialize(name="FAC")
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
    @books.each do |x|
      if (x.id == book_id) && (x.status == "available")
        x.check_out
        x.borrower = borrower
        return x
      else
        return nil
      end
    end

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
    book.status = "available"
  end

  def available_books
    @books.each do |book|
      if book.status == "available"
         puts "#{book.title}"
      end
    end
  end

  def borrowed_books
  end
end
