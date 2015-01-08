require_relative 'spec_helper'
require_relative '../lib/Book'

describe Book do

  before(:context) do
    @book = Book.new("Book Title",5.50)
  end

  describe "Initialization" do
  	
  	it "is an instance of Book class" do 
  		expect(@book).to be_instance_of(Book)
  	end

  	it "is an instance of the Item class" do
      expect(@book).to be_kind_of(Item)
    end

  	it "is assigned a name" do
  		expect(@book.name).to eq("Book Title")
  	end

  	it "is assigned a price" do
  		expect(@book.price).to eq(5.50)
  	end

    it "should be able to be initalized with a weight" do
      item2 = Book.new("Generic Item2",2.99,2.2)
      expect(item2.name).to eq("Generic Item2")
      expect(item2.price).to eq(2.99)
      expect(item2.weight).to eq(2.2)
    end

  end

  describe "Accessors" do 

  	it "should be able to get and set name" do
  		@book.name = "New Book Title"
  		expect(@book.name).to eq("New Book Title")
  	end

  	it "should be able to get and set price" do
  		@book.price = 10.50
  		expect(@book.price).to eq(10.50)
  	end

  	it "should be able to get and set pages" do
  		expect(@book.pages).to eq(0)
  		@book.pages = 60
  		expect(@book.pages).to eq(60)
  	end

  	it "should be able to get and set author" do
  		expect(@book.author).to eq("")
  		@book.author = "some author"
  		expect(@book.author).to eq("some author")
  	end

    it "should be able to get and set weight" do
      expect(@book.weight).to eq(0)
      @book.weight = 5
      expect(@book.weight).to eq(5)
    end 

  end

  describe "Methods" do
    it "should be able to stock" do
      result = @book.stock 5
      expect(result).to eq(true)
      expect(@book.quantity).to eq(5)
    end
    it "should not be able to sell more books than we have" do
      result = @book.sell 6
      expect(result).to eq(false)
      expect(@book.quantity).to eq(5)
    end
    it "should be able to sell books and update quantity" do
      result = @book.sell 2
      expect(result).to eq(true)
      expect(@book.quantity).to eq(3)
    end  

    it "should be able to return books and update quantity" do
      result = @book.return 6
      expect(result).to eq(true)
      expect(@book.quantity).to eq(9)
    end

    it "should be able to calculate ship price based on weight with ship_price" do
      expect(@book.ship_price).to eq(5 * 1.2)
    end

  end

end



 