require_relative "spec_helper"
require_relative "../lib/Ebook"

describe Ebook do

  before(:context) do
    @ebook = Ebook.new("Ebook title",10.00)
  end

  describe "Initialization" do

  	it "is an instance of Ebook class" do
  		expect(@ebook).to be_instance_of(Ebook)
  	end

  	it "is an instance of the Digital Item class" do
  		expect(@ebook).to be_kind_of(DigitalItem)
  	end

    it "is an instance of the Item class" do
      expect(@ebook).to be_kind_of(Item)
    end

    it "is assigned a name" do
      expect(@ebook.name).to eq("Ebook title")
    end

    it "is assigned a price" do
      expect(@ebook.price).to eq(10.00)
    end

    it "should be able to be initalized with a download_size" do
      item2 = Ebook.new("Generic Item2",2.99,5)
      expect(item2.name).to eq("Generic Item2")
      expect(item2.price).to eq(2.99)
      expect(item2.download_size).to eq(5)
    end

  end

  describe "Accessor" do

    it "should be able to get and set name" do
      @ebook.name = "New ebook title"
      expect(@ebook.name).to eq("New ebook title")
    end

    it "should be able to get and set price" do
      @ebook.price = 20.00
      expect(@ebook.price).to eq(20.00)
    end

    it "should be able to get and set pages" do
      expect(@ebook.pages).to eq(0)
      @ebook.pages = 100
      expect(@ebook.pages).to eq(100)
    end

     it "should be able to get and set author" do
      expect(@ebook.author).to eq("")
      @ebook.author = "some author"
      expect(@ebook.author).to eq("some author")
    end

    it "should be able to get and set weight even though its digital" do
      expect(@ebook.weight).to eq(-1)
      @ebook.weight = 0
      expect(@ebook.weight).to eq(0)
    end

    it "should be able to get and set download_size" do
      expect(@ebook.download_size).to eq(0)
      @ebook.download_size = 5
      expect(@ebook.download_size).to eq(5)
    end

  end

  describe "Methods" do

    it "should not be able to increase ebook stock quantity" do
      result = @ebook.stock 2
      expect(result).to eq(true)
      expect(@ebook.quantity).to eq(1)
    end

    it "should not be able to decrease ebook quantity when sold" do
      result = @ebook.sell 1
      expect(result).to eq(true)
      expect(@ebook.quantity).to eq(1)
    end

    it "should not be able to sell negative quantity of ebooks" do
      result = @ebook.sell -1
      expect(result).to eq(false)
      expect(@ebook.quantity).to eq(1)
    end

    it "should be able to return ebooks and not update quantity" do
      result = @ebook.return 5
      expect(result).to eq(true)
      expect(@ebook.quantity).to eq(1)
    end

    it "should not be able to ship because it's digital" do 
      expect(@ebook.ship_price).to eq(false)
    end


  end

end



