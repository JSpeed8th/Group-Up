class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
    	t.integer :event_id
    	t.integer :user_id
    	t.integer :location_id
    	t.string  :status
    	t.boolean :host
      t.timestamps
    end
  end
end
