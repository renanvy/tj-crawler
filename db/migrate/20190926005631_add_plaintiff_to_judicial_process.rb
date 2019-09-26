class AddPlaintiffToJudicialProcess < ActiveRecord::Migration[6.0]
  def change
    add_column :judicial_processes, :plaintiff, :string
  end
end
