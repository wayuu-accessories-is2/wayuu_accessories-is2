class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.text :title
      t.text :description
      t.string :content
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
