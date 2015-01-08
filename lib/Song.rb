 require_relative "DigitalItem.rb"
class Song < DigitalItem

	attr_accessor :run_time, :artist

	def initialize name, price, download_size=0
		super(name, price, download_size)
		@run_time = 0
		@artist = ""
	end

end


