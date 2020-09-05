require_relative "./item.rb"
require_relative "./order.rb"
require_relative "./input_transformer.rb"

TAXED_PRODUCTS = [
  "bottle of perfume",
  "music CD"
]
BASIC_SALES_TAX = 10
IMPORT_DUTY = 5

input = ARGV.first
items = InputTransformer.transform(input)

order = Order.new(items)
puts order.receipt

