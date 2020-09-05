module InputTransformer
  # transforms input text to Array of Hashes
  def self.transform(input)
    File.readlines(input).map do |line|
      product, _, unit_price = line.chomp.rpartition(" at ")
      quantity, imported, name = product.partition(/\simported\s|\s/)
      {
        quantity: quantity.to_i,
        imported: !!imported["imported"],
        name: name,
        unit_price: unit_price.to_f
      }
    end
  end
end