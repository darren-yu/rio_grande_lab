require_relative "spec_helper"
require_relative "../lib/DigitalItem"

describe DigitalItem do

  before(:context) do
    @digitalitem = DigitalItem.new("Digital Media",20.00)
  end

  describe "Initialization" do

  	it "is an instance of Digital Item class" do
  		expect(@digitalitem).to be_instance_of(DigitalItem)
  	end

  	it "is an instance of the Item class" do
  		expect(@digitalitem).to be_kind_of(Item)
  	end

    it "is assigned a name" do
      expect(@digitalitem.name).to eq("Digital Media")
    end

    it "is assigned a price" do
      expect(@digitalitem.price).to eq(20.00)
    end

    it "should be able to be initalized with a download_size" do
      item2 = DigitalItem.new("Generic Item2",2.99,5)
      expect(item2.name).to eq("Generic Item2")
      expect(item2.price).to eq(2.99)
      expect(item2.download_size).to eq(5)
    end


  end

  describe "Accessor" do

    it "should be able to get quantity" do
      expect(@digitalitem.quantity).to eq(1)
    end

    it "should be able to get and set weight even though its digital" do
      expect(@digitalitem.weight).to eq(-1)
      @digitalitem.weight = 0
      expect(@digitalitem.weight).to eq(0)
    end

    it "should be able to get and set download_size" do
      expect(@digitalitem.download_size).to eq(0)
      @digitalitem.download_size = 5
      expect(@digitalitem.download_size).to eq(5)
    end

  end

  describe "Methods" do

    it "should not be able to increase item stock quantity" do
      result = @digitalitem.stock 2
      expect(result).to eq(true)
      expect(@digitalitem.quantity).to eq(1)
    end

    it "should not be able to decrease item quantity when sold" do
      result = @digitalitem.sell 1
      expect(result).to eq(true)
      expect(@digitalitem.quantity).to eq(1)
    end

    it "should not be able to sell negative quantity of item" do
      result = @digitalitem.sell -1
      expect(result).to eq(false)
      expect(@digitalitem.quantity).to eq(1)
    end

    it "should be able to return items and not update quantity" do
      result = @digitalitem.return 5
      expect(result).to eq(true)
      expect(@digitalitem.quantity).to eq(1)
    end

    it "should not be able to ship because it's digital" do 
      expect(@digitalitem.ship_price).to eq(false)
    end


  end





end



