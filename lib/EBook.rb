require_relative "DigitalItem.rb"
class Ebook < DigitalItem

	attr_accessor :pages, :author

	def initialize name, price, download_size=0
		super(name, price, download_size)
		@pages = 0 
        @author = ""
	end

end


