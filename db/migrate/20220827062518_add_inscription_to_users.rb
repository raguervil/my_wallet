class AddInscriptionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :inscription, :string
  end
end
