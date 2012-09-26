require 'test/unit'
require 'app/item'
require 'app/user'
require 'app/market'

class MyTest < Test::Unit::TestCase

  def test_market
    market = Market.new_market
    user = User.named('Klaus')
    item = user.create_item('Umbrella', 60)
    market.add_user(user)
    market.user_list.at(0).offer_item(0)

    assert_equal(user.item_list.at(0).name, "Umbrella")
    assert_equal(market.get_items_to_sell.length, 1)
    assert_equal(market.user_list.at(0).name , "Klaus")
  end

  def test_initialize
    user = User.named('Klaus')
    item = user.create_item('Umbrella', 60)
    assert_equal(item.active?, false)
  end

  def test_change_stance
    user = User.named('Klaus')
    item = user.create_item('Umbrella', 60)
    item.change_stance
    assert_equal(item.active?, true)
  end

  def test_get_items_to_sell
    market = Market.new_market
    user = User.named('Klaus')
    item1 = user.create_item('Umbrella', 60)
    item2 = user.create_item('Hat', 90)
    market.add_user(user)
    user.offer_item(0)
    user.offer_item(1)

    assert_equal(item1.active?, true)
    assert_equal(item2.active?, true)
    assert_equal(market.get_items_to_sell.size, 2)
  end

  def test_item_trade
    market =Market.new_market
    user1 =User.named('Iron Man')
    user2 =User.named('Captain America')
    user3 =User.named('Hawk-eye')
    market.add_user(user1)
    market.add_user(user2)
    market.add_user(user3)
    user1.create_item('Mark I', 20)
    user1.create_item('Mark II', 150)
    user1.create_item('Mark III', 110)
    user2.create_item('Shield', 70)
    user2.create_item('Cape', 10)
    user3.create_item('Bow', 40)
    user3.create_item('Arrow', 5)
    user1.offer_item(0)
    user1.offer_item(1)
    user3.offer_item(0)
    user3.offer_item(1)
    market.get_items_to_sell
    user1.buy(2, market)   #buying bow
    market.get_items_to_sell
    user2.buy(0, market)  # buying Mark I
    market.get_items_to_sell
    user2.buy(0, market)  # buying Mark II
    user3.buy(0, market)  # buying Arrow

    assert_equal(user1.credits, 80)
    assert_equal(user2.credits, 80)
    assert_equal(user3.credits, 140)

  end
end