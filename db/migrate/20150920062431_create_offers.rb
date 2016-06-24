class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :offer_type, null: false, default: 0
      t.belongs_to :user, index: true
      t.string :company
      t.string :title, null: false
      t.text :content, null: false
      t.date :date_from
      t.date :date_to
      t.datetime :created_on
      t.datetime :updated_on

      t.timestamps
    end
  end
end
