class CreateKlasses < ActiveRecord::Migration[7.1]
  def change
    create_table :klasses do |t|
      t.integer :number, null: false
      t.string :letter, null: false
      t.integer :students_count, null: false

      t.timestamps
    end
  end
end
