class AddForeignKeyUserIdToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference(:articles, :user)
  end
end
