class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
    	t.string   :name
    	t.string   :description
    	t.string   :type
    	t.datetime :start
    	t.datetime :finish
    	t.datetime :response
      t.timestamps
    end
  end
end
