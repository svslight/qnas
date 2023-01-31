class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.integer :value
      t.references :user, foreign_key: true
      t.belongs_to :voteable, polymorphic: true

      t.timestamps
    end
  end
end
