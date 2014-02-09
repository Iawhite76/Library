
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
  attr_accessor :borrowed_count #, :borrowed_books
  def initialize(name)
    @name = name
    @borrowed_count = 0
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

  # def check_out_book(book_id, borrower)
  #   book = @books.find { |book| book.id == book_id }
  #   if book.status == "checked_out"
  #     return nil
  #   else
  #     book = @books.find { |book| book.id == book_id }
  #     book.status = "checked_out"
  #     @library[book.id] = borrower.anme
  #     book
  #   end
  # end

  def check_out_book(book_id, borrower)
    @books.find do |x|
      if (x.id == book_id) && (x.status == "available") && (borrower.borrowed_count < 2)
        x.check_out
        x.borrower = borrower
        borrower.borrowed_count += 1
        x
      else
        nil
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
    @books.select do |book|
      book.status == "available"
    end
    # @books.delete_if do |book|
    #   book.status != "available"
    # end
  end

  def borrowed_books
    @books.select do |book|
      book.status != "available"
    end

    # @books.each do |book|
    #  if book.status != "available"
    #   return @borrowed_books += 1
    # end
  # end
  end
end
