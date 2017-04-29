class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :book, index: true, foreign_key: true, null: false
      t.references :shelf, index: true, foreign_key: true, null: false
      t.integer :rack_number, null: false

      t.timestamps null: false
    end

    reversible do |dir|
      dir.up do
        # execute "ALTER TABLE locations ADD PRIMARY KEY (book_id, shelf_id, rack_number)"

        execute "ALTER TABLE locations ADD CONSTRAINT chk_rack_number
          CHECK (rack_number >= 0)"
      end
    end

  end
end
