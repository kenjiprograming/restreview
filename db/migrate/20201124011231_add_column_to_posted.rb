class AddColumnToPosted < ActiveRecord::Migration[5.2]
  def change
    add_column :posteds, :tel, :string
    add_column :posteds, :opentime, :string
    add_column :posteds, :holiday, :string
    add_column :posteds, :budget, :integer
  end
end
