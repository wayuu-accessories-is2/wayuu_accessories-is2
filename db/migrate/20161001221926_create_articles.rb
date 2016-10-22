class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.integer :by
      t.text    :title
      t.text    :description, array: true, default: []
      t.text    :content
      t.text    :img_reference

      t.timestamps
    end
  end
end
