class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :content, null: false
      t.string :title, null: false
      t.string :description, null: false
      t.datetime :created_on
      t.datetime :updated_on
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
