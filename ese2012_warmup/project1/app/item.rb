class Item
	
	attr_accessor :name, :price , :active, :name_owner
	
	def self.new_item(name, price, name_owner)
		item = self.new
		item.name = name
		item.price = price
    item.name_owner= name_owner
		item
  end
	
	def initialize
		self.active = false
	end
	
	def change_stance 
		self.active = !active?
	end
	
	def active?
		self.active
	end

end