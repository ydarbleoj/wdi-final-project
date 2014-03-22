class AddNamesToUser < ActiveRecord::Migration
  def change
    add_column :users, :f_name, :string
    add_column :users, :l_name, :string
    add_column :users, :username, :string, unique: true
  end
end
