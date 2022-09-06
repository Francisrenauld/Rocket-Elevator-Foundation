class AddKeypointsToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :keypoints, :json
  end
end
