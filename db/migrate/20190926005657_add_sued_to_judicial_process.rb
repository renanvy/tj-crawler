class AddSuedToJudicialProcess < ActiveRecord::Migration[6.0]
  def change
    add_column :judicial_processes, :sued, :string
  end
end
