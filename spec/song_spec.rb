require_relative "spec_helper"
require_relative "../lib/Song"

describe Song do

  before(:context) do
    @song = Song.new("Song title",5.50)
  end

  describe "Initialization" do

  	it "is an instance of song class" do
  		expect(@song).to be_instance_of(Song)
  	end

  	it "is an instance of the Digital Item class" do
  		expect(@song).to be_kind_of(DigitalItem)
  	end

    it "is an instance of the Item class" do
      expect(@song).to be_kind_of(Item)
    end

    it "is assigned a name" do
      expect(@song.name).to eq("Song title")
    end

    it "is assigned a price" do
      expect(@song.price).to eq(5.50)
    end

    it "should be able to be initalized with a download_size" do
      item2 = Song.new("Generic Item2",2.99,5)
      expect(item2.name).to eq("Generic Item2")
      expect(item2.price).to eq(2.99)
      expect(item2.download_size).to eq(5)
    end

  end

  describe "Accessor" do

    it "should be able to get and set name" do
      @song.name = "New song title"
      expect(@song.name).to eq("New song title")
    end

    it "should be able to get and set price" do
      @song.price = 1.50
      expect(@song.price).to eq(1.50)
    end

    it "should be able to get and set run time" do
      expect(@song.run_time).to eq(0)
      @song.run_time = 100
      expect(@song.run_time).to eq(100)
    end

    it "should be able to get and set artist" do
      expect(@song.artist).to eq("")
      @song.artist = "some artist"
      expect(@song.artist).to eq("some artist")
    end

    it "should be able to get and set weight even though its digital" do
      expect(@song.weight).to eq(-1)
      @song.weight = 0
      expect(@song.weight).to eq(0)
    end

    it "should be able to get and set download_size" do
      expect(@song.download_size).to eq(0)
      @song.download_size = 5
      expect(@song.download_size).to eq(5)
    end

  end

  describe "Methods" do

    it "should not be able to increase song stock quantity" do
      result = @song.stock 2
      expect(result).to eq(true)
      expect(@song.quantity).to eq(1)
    end

    it "should not be able to decrease song quantity when sold" do
      result = @song.sell 1
      expect(result).to eq(true)
      expect(@song.quantity).to eq(1)
    end

    it "should not be able to sell negative quantity of song" do
      result = @song.sell -1
      expect(result).to eq(false)
      expect(@song.quantity).to eq(1)
    end

    it "should be able to return songs and not update quantity" do
      result = @song.return 5
      expect(result).to eq(true)
      expect(@song.quantity).to eq(1)
    end

    it "should not be able to ship because it's digital" do 
      expect(@song.ship_price).to eq(false)
    end


  end

end



