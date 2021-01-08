class Order <  ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum status: [:pending, :approved, :rejected]

end
