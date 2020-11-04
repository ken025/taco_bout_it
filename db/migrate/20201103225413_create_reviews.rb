class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
