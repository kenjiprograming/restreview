class AddUsersRefToWants < ActiveRecord::Migration[5.2]
  def change
    add_reference :wants, :user, foreign_key: true
  end
end
