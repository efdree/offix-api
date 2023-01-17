class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :nationality
      t.string :email
      t.string :position
      t.date :birth_date
      t.references :department, null: false, foreign_key: true
      t.references :manager, null: true, foreign_key: {to_table: :employees}
      t.integer :role

      t.timestamps
    end
  end
end
