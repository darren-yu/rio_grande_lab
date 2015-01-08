require_relative "spec_helper"
require_relative "../lib/Movie"

describe Movie do

  before(:context) do
    @movie = Movie.new("Movie title",5.50)
  end

  describe "Initialization" do

  	it "is an instance of Movie class" do
  		expect(@movie).to be_instance_of(Movie)
  	end

  	it "is an instance of the Digital Item class" do
  		expect(@movie).to be_kind_of(DigitalItem)
  	end

    it "is an instance of the Item class" do
      expect(@movie).to be_kind_of(Item)
    end

    it "is assigned a name" do
      expect(@movie.name).to eq("Movie title")
    end

    it "is assigned a price" do
      expect(@movie.price).to eq(5.50)
    end

    it "should be able to be initalized with a download_size" do
      item2 = Movie.new("Generic Item2",2.99,5)
      expect(item2.name).to eq("Generic Item2")
      expect(item2.price).to eq(2.99)
      expect(item2.download_size).to eq(5)
    end

  end

  describe "Accessor" do

    it "should be able to get and set name" do
      @movie.name = "New movie title"
      expect(@movie.name).to eq("New movie title")
    end

    it "should be able to get and set price" do
      @movie.price = 1.50
      expect(@movie.price).to eq(1.50)
    end

    it "should be able to get and set run time" do
      expect(@movie.run_time).to eq(0)
      @movie.run_time = 100
      expect(@movie.run_time).to eq(100)
    end

    it "should be able to get and set director" do
      expect(@movie.director).to eq("")
      @movie.director = "some director"
      expect(@movie.director).to eq("some director")
    end

    it "should be able to get and set producer" do
      expect(@movie.producer).to eq("")
      @movie.producer = "some producer"
      expect(@movie.producer).to eq("some producer")
    end

    it "should be able to get and set weight even though its digital" do
      expect(@movie.weight).to eq(-1)
      @movie.weight = 0
      expect(@movie.weight).to eq(0)
    end

    it "should be able to get and set download_size" do
      expect(@movie.download_size).to eq(0)
      @movie.download_size = 5
      expect(@movie.download_size).to eq(5)
    end

  end

  describe "Methods" do

    it "should not be able to increase movie stock quantity" do
      result = @movie.stock 2
      expect(result).to eq(true)
      expect(@movie.quantity).to eq(1)
    end

    it "should not be able to decrease movie quantity when sold" do
      result = @movie.sell 1
      expect(result).to eq(true)
      expect(@movie.quantity).to eq(1)
    end

    it "should not be able to sell negative quantity of movie" do
      result = @movie.sell -1
      expect(result).to eq(false)
      expect(@movie.quantity).to eq(1)
    end

    it "should be able to return movies and not update quantity" do
      result = @movie.return 5
      expect(result).to eq(true)
      expect(@movie.quantity).to eq(1)
    end

    it "should not be able to ship because it's digital" do 
      expect(@movie.ship_price).to eq(false)
    end


  end

end



