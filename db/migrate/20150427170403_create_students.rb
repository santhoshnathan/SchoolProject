class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :class
      t.text :description
      t.references :school, index: true

      t.timestamps null: false
    end
    add_foreign_key :students, :schools
  end
end
