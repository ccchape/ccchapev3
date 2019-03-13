class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :year
      t.string :handle
      t.string :inst
      t.string :telegram
      t.string :email
      t.text :ratings

      t.timestamps
    end
  end
end
