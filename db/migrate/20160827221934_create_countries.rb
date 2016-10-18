class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string :code
      t.float :discount
      t.timestamps
    end
  end
end
