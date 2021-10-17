class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uid, optional: true, unique: true
      t.string :pass, optional: true

      t.timestamps
    end
  end
end
