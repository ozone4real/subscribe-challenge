class Order
  def initialize(items)
    @items = items.map do |item|
      name, unit_price, quantity, imported =
       item.values_at(:name, :unit_price, :quantity, :imported)
      Item.new(name, unit_price, quantity, imported: imported)
    end
  end

  def total_price
    @items.reduce(0) {|prev, curr| prev + curr.total_price }.round(2)
  end

  def total_tax
    @items.reduce(0) {|prev, curr| prev + curr.total_tax }.round(2)
  end

  def receipt
    @items.map do |item|
      "#{item.quantity}#{" imported" if item.imported} #{item.name}: #{item.total_price}"
    end + ["Sales Taxes: #{total_tax}", "Total: #{total_price}"]
  end
end
