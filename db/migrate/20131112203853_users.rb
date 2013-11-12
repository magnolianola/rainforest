class Users < ActiveRecord::Migration
  def change
  	add_column :users, :profile, :text

  	create_table :products do |t|
      t.text :description
  end
end
