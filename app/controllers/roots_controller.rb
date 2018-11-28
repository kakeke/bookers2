class RootsController < ApplicationController
	before_action :authenticate_user!
	def index
	  @book = Book.new
	  @users = User.all
	end

	def show
	end
end
