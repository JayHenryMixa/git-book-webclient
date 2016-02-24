class BooksController < ApplicationController


  
  def index
    @books = Book.all
  end

  def new

  end

  def create
    @book = Unirest.post("http://localhost:3000/books", headers:{ "Accept" => "application/json"}, 
      parameters:{title: params[:title], 
      author: params[:author], 
      publisher: params[:publisher],
      genre: params[:genre],
      isbn: params[:isbn]}).body

    render :show
  end

  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Unirest.get("http://localhost:3000/books/#{params[:id]}").body
  end

  def update
    @book = Unirest.post("http://localhost:3000/books", headers:{ "Accept" => "application/json"}, 
      parameters:{title: params[:title], 
      author: params[:author], 
      publisher: params[:publisher],
      genre: params[:genre],
      isbn: params[:isbn]}).body

    render :edit
  end

  def destroy 
    @book = Book.find(params[:id])
    message = @book.destroy

    flash[:message] = message["message"]
    redirect_to '/books'
  end

end
