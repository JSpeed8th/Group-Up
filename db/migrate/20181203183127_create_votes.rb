class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
    	t.integer :invite_id
    	t.integer :recommendation_id
    	t.integer :rank
      t.timestamps
    end
  end
end
