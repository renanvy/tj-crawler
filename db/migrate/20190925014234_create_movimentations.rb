class CreateMovimentations < ActiveRecord::Migration[6.0]
  def change
    create_table :movimentations do |t|
      t.date :date, null: false
      t.text :description, null: false
      t.references :judicial_process, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
