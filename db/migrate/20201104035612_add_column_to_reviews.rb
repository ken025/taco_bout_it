class AddColumnToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :message, :string
    add_column :reviews, :stars, :float
  end
end
