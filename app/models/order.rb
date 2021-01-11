class Order <  ApplicationRecord
  belongs_to :user
  belongs_to :book

  enum status: [:pending, :approved, :rejected]

  # def self.approved
  #   where(status: 'approved')
  # end
end
