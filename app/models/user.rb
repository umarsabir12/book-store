class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :books, -> { where(orders: { status: :approved }) }, through: :orders
  def name
    "#{first_name} #{last_name}"
  end

  def book_ordered?(book_id)
    order_book_ids.include?(book_id)
  end

  def order_book_ids
    orders.pluck(:book_id)
  end
end
