class AddCaptionToPosteds < ActiveRecord::Migration[5.2]
  def change
    add_column :posteds, :caption, :string
  end
end
