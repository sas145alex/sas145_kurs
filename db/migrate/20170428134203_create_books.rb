class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.string :isbn, null: false, unique: true
      t.integer :quantity, null: false
      t.integer :volume

      t.timestamps null: false
    end

    reversible do |dir|
      dir.up do
        execute "ALTER TABLE books ADD CONSTRAINT chk_quantity
          CHECK (quantity >= 0)"

        execute "ALTER TABLE books ADD CONSTRAINT chk_volume
          CHECK ((volume = NULL) or (volume > 0))"
      end
    end

  end
end
