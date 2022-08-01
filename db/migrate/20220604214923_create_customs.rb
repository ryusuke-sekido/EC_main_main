class CreateCustoms < ActiveRecord::Migration[6.1]
  def change
    create_table :customs do |t|
      t.timestamps
    end
  end
end
