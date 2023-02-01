class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.integer :state
      t.references :author, foreign_key: { to_table: :users }
      t.belongs_to :votable, polymorphic: true

      t.timestamps
    end
  end
end
