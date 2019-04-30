class CreateNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :numbers do |t|
      t.string :phonenumber
      t.string :country

      t.timestamps
    end
  end
end
