class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      t.string :name
      t.integer :pricing
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
