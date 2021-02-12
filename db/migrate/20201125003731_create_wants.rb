class CreateWants < ActiveRecord::Migration[5.2]
  def change
    create_table :wants do |t|
      t.string :name
      t.string :address
      t.text :url
      t.string :caption
      t.string :tel
      t.text :opentime
      t.string :holiday
      t.string :listname
      t.integer :budget

      t.timestamps
    end
  end
end
