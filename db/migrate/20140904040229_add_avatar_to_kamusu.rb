class AddAvatarToKamusu < ActiveRecord::Migration
  def change
    add_attachment :kanmusus, :image
  end
end
