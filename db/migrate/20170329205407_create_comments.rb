class CreateComments < ActiveRecord::Migration[5.0]
  def change
      create_table :Comments do |t|
          t.text :commentary
          t.text :username
          t.timestamps
      end
  end
end
