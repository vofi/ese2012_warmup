
require 'app/market'

class User
	attr_accessor :name, :item_list, :credits

	def self.named(name, market)
		user=self.new
		user.name=name
    market = market
    user
  end

  def self.named(name)  #for testing only
    user=self.new
    user.name=name
    user
  end

	def initialize
		self.item_list= Array.new
		self.credits = 100

	end

	def transaction(price)
		self.credits = credits + price
	end

  def create_item(name_i, price_i)
    name= name_i
    price= price_i
    owner=self.name
    item = Item.new_item(name, price, owner)
    add_item(item)
    item                 #for testing only
  end

  def add_item(item)
		self.item_list.push(item)
  end

  def remove_item(item)

    r=0
    index=r
    for i in item_list do
      if i.name.match(item.name)
          index=r
      end
      r=r+1
    end
		self.item_list.delete_at(index)

  end

  def offer_item(index)
    item = self.item_list.at(index)
    item.change_stance
    item
  end

  def buy(index, market)
    market.trade(index, self)
  end

  def get_active_items
   active_items= Array.new
   self.item_list.each {|item| if item.active?; active_items.push(item);  end}
   active_items
  end


end








	





