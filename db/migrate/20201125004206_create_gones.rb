class CreateGones < ActiveRecord::Migration[5.2]
  def change
    create_table :gones do |t|
      t.string :name
      t.string :address
      t.text :url
      t.string :tel
      t.text :opentime
      t.string :holiday
      t.string :image
      t.text :comment
      t.integer :budget

      t.timestamps
    end
  end
end
