class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.references :team, foreign_key: true
      t.date :date
      t.datetime :time
      t.string :field

      t.timestamps
    end
  end
end
