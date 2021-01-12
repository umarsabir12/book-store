class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :books, -> { where(orders: { status: :approved }) }, through: :orders
  def name
    "#{self.first_name} #{self.last_name  }"
  end
end
