class BooksController < ApplicationController
before_action :authenticate_user!

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = 'book create successfully'
       		redirect_to book_path(@book)   
        else
        	redirect_to books_path,alert: t('book create error') 
        end
    end

	def index
        @books = Book.all
        @book = Book.new
        @user = current_user
	end

	def show
		@book = Book.new
		@books = Book.find(params[:id])
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		puts @book.errors.full_messages
		redirect_to books_path
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user_id != current_user.id
        flash[:alert] = "Authority error"
        redirect_to books_path
	    end
	end

	def update
		book = Book.find(params[:id])
		if book.update(book_params)
			flash[:notice] = 'book update successfully'
       		redirect_to book_path(book)
        else
        	redirect_to books_path,alert: t('book update error') 
        end
	end

	private

	def book_params
		params.require(:book).permit(:title, :opinion)
	end

end
