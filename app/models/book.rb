class Book <  ApplicationRecord
  has_one_attached :picture

  belongs_to :admin
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders

  def self.published
    where(published: true)
  end
end
