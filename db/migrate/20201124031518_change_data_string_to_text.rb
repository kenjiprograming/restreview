class ChangeDataStringToText < ActiveRecord::Migration[5.2]
  def change
    change_column :rests, :opentime, :text
    change_column :posteds, :opentime, :text
  end
end
