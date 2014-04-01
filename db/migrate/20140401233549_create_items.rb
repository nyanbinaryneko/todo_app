class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.integer :status
      t.integer :list_id
      t.timestamps
    end

    add_index :items, :list_id
    add_index :items, :status
  end
end
