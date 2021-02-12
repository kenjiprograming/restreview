class AddUserRefToGones < ActiveRecord::Migration[5.2]
  def change
    add_reference :gones, :user, foreign_key: true
  end
end
