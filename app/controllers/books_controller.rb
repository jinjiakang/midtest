class BooksController < ApplicationController
  
  def index
      @books = Book.all
  end
  
  def new
      @book = Book.new  
  end
      
  def create
      @book = Book.new(book_params)

      if @book.save
        redirect_to books_path, notice: "新增書本成功!"
      else
        render :new
      end
   
  end
  
  def edit
  
    @book = Book.find_by(id: params[:id])
  
  end
   
  private
  
  def book_params
      params.require(:book).permit(:name, :intro, :author, :price)
  
  end
  
end
