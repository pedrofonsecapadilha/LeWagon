class CreateNewColumn < ActiveRecord::Migration[7.0]
  def up
    add_column :posts, :votes, :integer, default: 0, null: false
  end
end
