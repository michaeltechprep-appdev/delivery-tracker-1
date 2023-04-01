class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.string :description
      t.date :arrival
      t.text :details

      t.timestamps
    end
  end
end
