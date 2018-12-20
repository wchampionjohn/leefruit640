class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
