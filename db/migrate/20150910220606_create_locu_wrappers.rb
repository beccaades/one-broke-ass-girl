class CreateLocuWrappers < ActiveRecord::Migration
  def change
    create_table :locu_wrappers do |t|

      t.timestamps null: false
    end
  end
end
