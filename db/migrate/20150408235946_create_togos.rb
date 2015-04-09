class CreateTogos < ActiveRecord::Migration
  def change
    create_table :togos do |t|
      t.string :place
      t.string :memo
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
