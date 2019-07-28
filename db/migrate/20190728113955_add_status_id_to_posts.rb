class AddStatusIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :status, foreign_key: true
  end
end
