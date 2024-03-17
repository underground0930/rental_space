class AddRatingToSpaces < ActiveRecord::Migration[7.0]
  def change
    add_column :spaces, :rating, :integer, default: 2
  end
end
