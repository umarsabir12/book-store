class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :book
      t.references :user
      t.integer :status, default: 0

      # t.belongs_to :admin
      # t.belongs_to :user
      # t.string :title
      t.timestamps
    end
  end
end
