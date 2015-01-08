require_relative 'Item.rb'
class Cd < Item

	attr_accessor :tracks, :artist, :run_time

	def initialize name, price, weight=0
		super(name, price, weight)
		@tracks = 0
		@artist = ""
		@run_time = 0
	end

end