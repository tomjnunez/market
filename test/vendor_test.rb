require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'

class VendorTest < Minitest::Test
  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_instance_of Vendor, vendor
  end

  def test_it_has_name
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal ("Rocky Mountain Fresh"), vendor.name
  end

  def test_its_inventory_starts_empty
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal ({}), vendor.inventory
  end

  def test_items_not_in_stock_equal_zero
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal 0, vendor.check_stock("Peaches")
  end

  def test_it_can_stock_items
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal 30, vendor.stock("Peaches", 30)
  end

  def test_it_can_print_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    vendor.stock("Peaches", 25)
    vendor.stock("Tomatoes", 12)

    expected = {"Peaches"=>55, "Tomatoes"=>12}
    assert_equal expected, vendor.inventory
  end
end
