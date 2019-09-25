class CreateJudicialProcesses < ActiveRecord::Migration[6.0]
  def change
    create_table :judicial_processes do |t|
      t.string :number, null: false, index: { unique: true }
      t.string :kind, null: false
      t.string :area, null: false
      t.string :subject, null: false
      t.string :distribution_date, null: false
      t.string :judge, null: false
      t.string :action_value, null: false
      t.datetime :crawler_updated_at, null: false

      t.timestamps
    end
  end
end
