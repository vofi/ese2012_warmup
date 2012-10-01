require 'test/unit'
require 'app/user'
require 'app/item'

class UserTest < Test::Unit::TestCase

  def test_named
    user = User.named('Hans')
    assert_equal(user.name, 'Hans')
  end

  def test_initialize
    user = User.named('Hans')
    assert_equal(user.credits, 100)
    assert_equal(user.item_list.length, 0)
  end

  def test_transaction
    user = User.named('Max')
    user.transaction(80)
    assert_equal(user.credits, 180)
  end


  def test_add_item
    user = User.named('Hans')
    user.add_item(1)
    assert_equal(user.item_list.length, 1)
  end

  def test_remove_item
    user = User.named('Hans')
    item1=user.create_item('Umbrella', 80)
    item2=user.create_item('Hat', 60)
    user.remove_item(item2)
    assert_equal(user.item_list.length, 1)
    user.remove_item(item1)
    assert_equal(user.item_list.length, 0)
  end

  def test_add_item
    user = User.named('Hans')
    user.add_item('Umbrella')
    assert_equal(user.item_list.length, 1)

  end

  def test_offer_item
    user = User.named('Peter')
    item1 = Item.new_item('penis', 80, user.name)
    item2 = Item.new_item('vagina', 88, user.name)
    user.item_list= [item1, item2]
    user.offer_item(0)
    assert_equal(user.item_list.at(0).active?, true)
  end

  def test_get_active_items
    user = User.named('Peter')
    item1 = Item.new_item('penis', 80, user.name)
    item2 = Item.new_item('vagina', 88, user.name)
    user.item_list= [item1, item2]
    user.offer_item(0)
    assert_equal(user.get_active_items.length, 1)
  end


end