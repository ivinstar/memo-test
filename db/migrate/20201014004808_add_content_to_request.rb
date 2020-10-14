class AddContentToRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :content, :string
  end
end
