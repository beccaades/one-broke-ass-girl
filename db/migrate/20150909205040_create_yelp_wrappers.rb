class CreateYelpWrappers < ActiveRecord::Migration
  def change
    create_table :yelp_wrappers do |t|

      t.timestamps null: false
    end
  end
end
