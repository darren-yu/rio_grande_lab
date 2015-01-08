require_relative 'spec_helper'
require_relative '../lib/Cd'

describe Cd do

  before(:context) do
    @cd = Cd.new("CD title",15.99)
  end

  describe "Initialization" do
  	
	  it "is an instance of Cd class" do 
	    expect(@cd).to be_instance_of(Cd)
	  end

    it "is an instance of the Item class" do
      expect(@cd).to be_kind_of(Item)
    end

  	it "is assigned a name" do
  		expect(@cd.name).to eq("CD title")
  	end

  	it "is assigned a price" do
  		expect(@cd.price).to eq(15.99)
  	end

    it "should be able to be initalized with a weight" do
      item2 = Cd.new("Generic Item2",2.99,2.2)
      expect(item2.name).to eq("Generic Item2")
      expect(item2.price).to eq(2.99)
      expect(item2.weight).to eq(2.2)
    end

  end

  describe "Accessors" do 

  	it "should be able to get and set name" do
  		@cd.name = "New CD name"
  		expect(@cd.name).to eq("New CD name")
  	end

  	it "should be able to get and set price" do
  		@cd.price = 20.50
  		expect(@cd.price).to eq(20.50)
  	end

  	it "should be able to get and set tracks" do
  		expect(@cd.tracks).to eq(0)
  		@cd.tracks = 15
  		expect(@cd.tracks).to eq(15)
  	end

  	it "should be able to get and set artist" do
  		expect(@cd.artist).to eq("")
  		@cd.artist = "some artist"
  		expect(@cd.artist).to eq("some artist")
  	end

  	it "should be able to get and set run time" do
  		expect(@cd.run_time).to eq(0)
  		@cd.run_time = 100
  		expect(@cd.run_time).to eq(100)
  	end

    it "should be able to get and set weight" do
      expect(@cd.weight).to eq(0)
      @cd.weight = 5
      expect(@cd.weight).to eq(5)
    end 

  end

  describe "Methods" do
    it "should be able to stock" do
      result = @cd.stock 5
      expect(result).to eq(true)
      expect(@cd.quantity).to eq(5)
    end
    it "should not be able to sell more cds than we have" do
      result = @cd.sell 6
      expect(result).to eq(false)
      expect(@cd.quantity).to eq(5)
    end
    it "should be able to sell cds and update quantity" do
      result = @cd.sell 2
      expect(result).to eq(true)
      expect(@cd.quantity).to eq(3)
    end  

    it "should be able to return cds and update quantity" do
      result = @cd.return 6
      expect(result).to eq(true)
      expect(@cd.quantity).to eq(9)
    end

    it "should be able to calculate ship price based on weight with ship_price" do
      expect(@cd.ship_price).to eq(5 * 1.2)
    end

  end

end
