class RenameFollowedColumnToRelationships < ActiveRecord::Migration[6.1]
  def change
    rename_column :relationships, :followed, :followed_id
  end
end
