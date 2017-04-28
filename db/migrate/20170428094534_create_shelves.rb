class CreateShelves < ActiveRecord::Migration
  def change
    create_table :shelves do |t|
      t.string :shelf_index, null: false
      t.references :hall, index: true, foreign_key: true, null: false

      t.timestamps null: false

    end

    add_index(:shelves, [:hall_id, :shelf_index], unique: true)

    reversible do |dir|
      dir.up do
        execute "ALTER TABLE shelves ADD CONSTRAINT chk_shelf_ind_length
          CHECK (length(shelf_index) >= 2)"
      end
    end

  end
end
