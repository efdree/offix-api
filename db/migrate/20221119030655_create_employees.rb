class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :nationality
      t.string :email
      t.string :position
      t.references :department, null: false, foreign_key: true
      t.date :birth_date
      t.string :manager
      t.integer :role

      t.timestamps
    end
  end
end
