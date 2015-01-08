require_relative "Item.rb"
class DigitalItem < Item

	attr_reader :quantity
    attr_accessor :download_size

	def initialize name, price, download_size=0
		super(name, price)
		@quantity = 1
        @download_size = download_size
        @weight = -1
	end


	def sell amount
        if @quantity <= amount
            true
        else
            false
        end
    end

    def stock amount
        amount
        true
    end

    def return amount
        amount
        true
    end

    def ship_price 
        false
    end



end




