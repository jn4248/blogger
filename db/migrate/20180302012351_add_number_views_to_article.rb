class AddNumberViewsToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :number_of_views, :integer
  end
end
