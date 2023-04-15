class BooksController < ApplicationController

def new
 @book = Book.new
end

def create
 @books = Book.all
 @book = Book.new(book_params)
  if@book.save
   redirect_to book_path(@book.id)
   flash[:notice] = "Book was successfully created."
  else
   render :index
  end
end

def index
 @books = Book.all
  @book = Book.new

end

def show
 @book = Book.find(params[:id])

end

def edit
 @book = Book.find(params[:id])

end


def update
  book = Book.find(params[:id])
  book.update(book_params)
  if book.save
    flash[:notice] = "Book was successfully updated."
   redirect_to book_path(book.id)
  else
    flash[:notice] ="update fail"
   render :edit
  end
end

def destroy
  book = Book.find(params[:id])
  book.destroy
  flash[:notice] = "Book was successfully destroyed."
  redirect_to books_path(book.id)

end


 private
 def book_params
 params.require(:book).permit(:title,:body)
 end
end