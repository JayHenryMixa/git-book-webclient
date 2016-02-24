class Book 

  attr_reader :id
  attr_accessor :title, :author, :publisher, :genre, :isbn

  def initialize(hash)
      @id = hash["id"]
      @title = hash["title"]
      @author = hash["author"]
      @publisher = hash["publisher"]
      @genre = hash["genre"]
      @isbn = hash["isbn"]
  end

  def self.find(id)
    Book.new(Unirest.get("#{ENV['API_BASE_URL']}/books/#{id}", headers:{ "Accept" => "application/json", "X-User-Email" => "joe@gmail.com", 
    "Authorization" => "Token token-infonomnom" }).body
  end 

  def self.all
    api_books_array = (Unirest.get("#{ENV['API_BASE_URL']}/books", headers:{ "Accept" => "application/json"}).body
    books = []
    api_books_array.each { |api_book| books << Book.new(api_book) }
    books  
    
  end
      
  def destroy
    Unirest.delete("#{ENV['API_BASE_URL']}/books/#{id}", headers:{ "Accept" => "application/json"}).body
    
  end

end
