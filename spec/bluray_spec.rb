require_relative 'spec_helper'
require_relative '../lib/Bluray'

describe Bluray do

  before(:context) do
    @bluray = Bluray.new("Bluray Title", 25.50)
  end

  describe "Initialization" do

  	it "is an instance of Bluray class" do
  		expect(@bluray).to be_instance_of(Bluray)
  	end

  	it "is an instance of the Item class" do
  		expect(@bluray).to be_kind_of(Item)
  	end

  	it "is assigned a name" do
  		expect(@bluray.name).to eq("Bluray Title") 
  	end

  	it "is assigned a price" do
  		expect(@bluray.price).to eq(25.50)
  	end

    it "should be able to be initalized with a weight" do
      item2 = Bluray.new("Generic Item2",2.99,2.2)
      expect(item2.name).to eq("Generic Item2")
      expect(item2.price).to eq(2.99)
      expect(item2.weight).to eq(2.2)
    end

  end

  describe "Accessors" do

  	it "should be able to get and set name" do
  		@bluray.name = "New Bluray title"
  		expect(@bluray.name).to eq("New Bluray title")
  	end

  	it "should be able to get and set price" do
  		@bluray.price = 35.99
  		expect(@bluray.price).to eq(35.99)
  	end

  	it "should be able to get and set run time" do 
  		expect(@bluray.run_time).to eq(0)
  		@bluray.run_time = 50
  		expect(@bluray.run_time).to eq(50)
  	end

  	it "should be able to get and set director" do 
  		expect(@bluray.director).to eq("")
  		@bluray.director = "some director"
  		expect(@bluray.director).to eq("some director")
  	end

  	it "should be able to get and set producer" do 
  		expect(@bluray.producer).to eq("")
  		@bluray.producer = "some producer"
  		expect(@bluray.producer).to eq("some producer")
  	end

    it "should be able to get and set weight" do
      expect(@bluray.weight).to eq(0)
      @bluray.weight = 5
      expect(@bluray.weight).to eq(5)
    end 

  end

  describe "Methods" do
    it "should be able to stock" do
      result = @bluray.stock 5
      expect(result).to eq(true)
      expect(@bluray.quantity).to eq(5)
    end

    it "should not be able to sell more blurays than we have" do
      result = @bluray.sell 6
      expect(result).to eq(false)
      expect(@bluray.quantity).to eq(5)
    end

    it "should be able to sell blurays and update quantity" do
      result = @bluray.sell 2
      expect(result).to eq(true)
      expect(@bluray.quantity).to eq(3)
    end  

    it "should be able to return blurays and update quantity" do
      result = @bluray.return 6
      expect(result).to eq(true)
      expect(@bluray.quantity).to eq(9)
    end

    it "should be able to calculate ship price based on weight with ship_price" do
      expect(@bluray.ship_price).to eq(5 * 1.2)
    end

  end



end