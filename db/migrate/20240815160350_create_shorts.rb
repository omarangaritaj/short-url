class CreateShorts < ActiveRecord::Migration[7.1]
  def change
    create_table :shorts do |t|
      t.string :short_url
      t.string :long_url
      t.integer :counter, default: 0

      t.timestamps
    end

    add_index :shorts, :short_url, unique: true
    add_index :shorts, :long_url, unique: true
  end
end
