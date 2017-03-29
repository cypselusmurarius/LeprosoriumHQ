class CreatePosts < ActiveRecord::Migration[5.0]
  def change
      create_table :Posts do |t|
          t.text :message
          t.text :username
          t.timestamps
      end
  end
end
