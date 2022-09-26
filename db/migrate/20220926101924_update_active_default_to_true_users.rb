class UpdateActiveDefaultToTrueUsers < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :active, :boolean, default: true
  end
  def down
    change_column :users, :active, :boolean, default: true
  end
end
