class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :edition
      t.integer :isbn
      t.string :publisher
      t.date :relesed_on
      t.integer :number_of_pages
      t.string :language
      t.text :synopsis

      t.timestamps
    end
  end
end
