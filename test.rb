require "test/unit"
require_relative "./app/item.rb"
require_relative "./app/order.rb"
require_relative "./app/input_transformer.rb"

TAXED_PRODUCTS = [
  "bottle of perfume",
  "music CD"
]
BASIC_SALES_TAX = 10
IMPORT_DUTY = 5

class ItemTest < Test::Unit::TestCase
  def test_imported_item
    item = Item.new("box of chocolates", 10.00, 1, imported: true)
    assert_equal(item.total_tax, 0.5)
    assert_equal(item.total_price, 10.5)
  end

  def test_taxed_item
    item = Item.new("music CD", 14.99, 1)
    assert_equal(item.total_price, 16.49)
    assert_equal(item.total_tax, 1.5)
  end

  def test_imported_and_taxed_item
    item = Item.new("bottle of perfume", 27.99, 1, imported: true)
    assert_equal(item.total_price, 32.19)
    assert_equal(item.total_tax, 4.2)
  end
end

class InputTransformerTest < Test::Unit::TestCase
  def test_transformer
    input = InputTransformer.transform("input/third_input")
    expected = [
      {:quantity => 1, :imported => true, :name=>"bottle of perfume", :unit_price=>27.99},
      {:quantity=>1, :imported=>false, :name=>"bottle of perfume", :unit_price=>18.99},
      {:quantity=>1, :imported=>false, :name=>"packet of headache pills", :unit_price=>9.75},
      {:quantity=>3, :imported=>true, :name=>"boxes of chocolates", :unit_price=>11.25}
    ]
    assert_equal(input, expected)
  end
end

class OrderTest < Test::Unit::TestCase
  def test_first_input
    order = order("input/first_input")
    expected_receipt = [
      "2 book: 24.98",
      "1 music CD: 16.49",
      "1 chocolate bar: 0.85",
      "Sales Taxes: 1.5",
      "Total: 42.32"
    ]
    assert_equal(expected_receipt, order.receipt)
  end

  def test_second_input
    order = order("input/second_input")
    expected_receipt = [
      "1 imported box of chocolates: 10.5",
      "1 imported bottle of perfume: 54.65",
      "Sales Taxes: 7.65",
      "Total: 65.15"
    ]
    assert_equal(expected_receipt, order.receipt)
  end

  def test_third_input
    order = order("input/third_input")
    expected_receipt = [
      "1 imported bottle of perfume: 32.19",
      "1 bottle of perfume: 20.89",
      "1 packet of headache pills: 9.75",
      "3 imported boxes of chocolates: 35.55",
      "Sales Taxes: 7.9",
      "Total: 98.38"
    ]
    assert_equal(expected_receipt, order.receipt)
  end

  private

  def order(input)
    items = InputTransformer.transform(input)
    Order.new(items)
  end
end