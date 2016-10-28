class CreateBlogCommentReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :blog_comment_replies do |t|
      t.string :name
      t.string :email
      t.text :reply
      t.references :blog_comment, foreign_key: true

      t.timestamps
    end
  end
end
