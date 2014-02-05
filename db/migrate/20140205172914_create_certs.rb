class CreateCerts < ActiveRecord::Migration
  def change
    create_table :certs do |t|
      t.string :title
      t.integer :user_id
      t.date :date

      t.timestamps
    end
  end
end
