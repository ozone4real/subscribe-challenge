class Item
  attr_reader :name, :quantity, :imported

  def initialize(name, unit_price, quantity, imported: false)
    @name = name
    @unit_price = unit_price
    @quantity = quantity
    @imported = imported

  end

  def price_per_item
    (@unit_price + total_tax_per_item).round(2)
  end

  def total_tax
    total_tax_per_item * quantity
  end

  def total_price
    price_per_item * quantity
  end

  def basic_sales_tax_rate
    return BASIC_SALES_TAX if TAXED_PRODUCTS.include?(name)
    0
  end

  def import_duty_rate
    return IMPORT_DUTY if imported
    0
  end

  def total_tax_per_item
    round_tax (basic_sales_tax_rate + import_duty_rate)/100.to_f * @unit_price
  end

  private

  def round_tax(value)
   (value * 20).ceil / 20.to_f
  end
end
