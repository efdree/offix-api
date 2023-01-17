class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.text :body
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
