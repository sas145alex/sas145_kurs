class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.string :short_name, null: false, unique: true
      t.text :full_name, null: false

      t.timestamps null: false
    end

  end
end
