class RemoveContentFromRequest < ActiveRecord::Migration[6.0]
  def change
    remove_column :requests, :content, :text
  end
end
