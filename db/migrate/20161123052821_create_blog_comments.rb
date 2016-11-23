class CreateBlogComments < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_comments do |t|
      t.string :name
      t.string :email
      t.text :comment
      t.references :article, foreign_key: true
      t.timestamps
    end
  end
end
