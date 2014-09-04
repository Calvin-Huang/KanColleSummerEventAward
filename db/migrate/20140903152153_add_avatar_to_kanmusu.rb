class AddAvatarToKanmusu < ActiveRecord::Migration
  def change
    add_attachment :kanmusus, :avatar
  end
end
