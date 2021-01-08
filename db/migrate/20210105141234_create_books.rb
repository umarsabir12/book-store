class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.belongs_to :admin
      t.string :title
      t.string :description
      t.string :author
      t.integer :amount
      t.attachment :picture
      t.timestamps
    end
  end
end
