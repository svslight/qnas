class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :correct
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end

    change_column_null(:questions, :title, false)
    change_column_null(:questions, :body, false)
  end
end
