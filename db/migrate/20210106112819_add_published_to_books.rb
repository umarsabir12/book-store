class AddPublishedToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :published, :boolean, default: false
  end
end
