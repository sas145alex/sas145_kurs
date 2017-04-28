class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :fn, null: false
      t.string :ln, null: false
      t.string :sn
      t.string :author_index, null: false

      t.timestamps null: false
    end

    add_index(:authors, [:ln, :author_index], unique: true)

    reversible do |dir|
      dir.up do
        execute "ALTER TABLE authors ADD CONSTRAINT chk_author_ind_length
          CHECK (length(author_index) >= 3)"
      end
    end

  end
end
