class CreateKanmusus < ActiveRecord::Migration
  def change
    create_table :kanmusus do |t|
      t.string :name

      t.timestamps
    end
  end
end
