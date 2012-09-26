require 'app/user'
require 'app/item'

class Market

  attr_accessor :user_list, :items_to_sell, :item_to_trade
	
	def self.new_market()
		market = self.new
    market
  end

  def initialize
    self.user_list = Array.new
    self.items_to_sell = Array.new
  end

  def add_user(user)
		user_list.push(user)
  end

  def print_users
    puts user_list
  end

  def get_items_to_sell
    items_to_sell=[]
    for user in self.user_list do
       items_to_sell = items_to_sell + user.get_active_items
    end
    items_to_sell
  end

  def trade(index, user)
    items_to_sell=get_items_to_sell


    item_to_trade = items_to_sell.at(index)


    a = item_to_trade.price
    b = user.credits
    if a > b

        else
      item_trade(item_to_trade, user)
    end
  end

    def item_trade(item, user)
      buyer = user
      name_seller = item.name_owner
      seller= nil
      for user in self.user_list
        if user.name.match(name_seller)
          seller=user
        end
      end
      buyer.add_item(item)
      price=item.price

      buyer.transaction(-(price))
      seller.transaction(price)
      seller.remove_item(item)
      item.change_stance
      get_items_to_sell

    end


end

