class AddDateToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :publish_date, :date
  end
end
