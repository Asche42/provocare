class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :article, index: true
      t.belongs_to :user, index: true
      t.text :content, null: false
      t.datetime :created_on
      t.datetime :updated_on

      t.timestamps
    end
  end
end
