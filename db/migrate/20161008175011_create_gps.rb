class CreateGps < ActiveRecord::Migration
  def change
    create_table :gps do |t|
      t.string :location

      t.timestamps null: false
    end
  end
end
