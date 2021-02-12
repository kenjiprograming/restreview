class AddColumnToRest < ActiveRecord::Migration[5.2]
  def change
    add_column :rests, :tel, :string
    add_column :rests, :opentime, :string
    add_column :rests, :holiday, :string
    add_column :rests, :budget, :integer
  end
end
