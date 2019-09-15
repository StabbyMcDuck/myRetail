class ProductPrice
  include Cequel::Record

  CURRENCY_CODES = %w[USD]

  key :product_id, :int
  column :value, :decimal
  column :currency_code, :text

  validates :value, numericality: { greater_than_or_equal_to: 0.0 }
  validates :currency_code, inclusion: { in: CURRENCY_CODES }
end