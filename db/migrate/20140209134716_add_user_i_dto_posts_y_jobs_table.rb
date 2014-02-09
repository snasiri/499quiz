class AddUserIDtoPostsYJobsTable < ActiveRecord::Migration
  def change
  	change_table :jobs do |t|
  		t.integer :user_id
  	end
  end
end
