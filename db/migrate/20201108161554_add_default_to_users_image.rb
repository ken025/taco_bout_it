class AddDefaultToUsersImage < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :image, "https://www.freelogodesign.org/file/app/client/thumb/879046d9-da95-4431-b9f4-12aa26e6e1a3_200x200.png?1604852352065"
  end
end
