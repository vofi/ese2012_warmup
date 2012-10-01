
require 'test/unit'
require 'app/item'
require 'app/user'
require 'app/item'

class MyTest < Test::Unit::TestCase

  def test_item
    user = User.named('Klaus')
    item = user.create_item('Umbrella', 60)
    assert_equal(item.name, 'Umbrella')
    assert_equal(item.price, 60)
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

end