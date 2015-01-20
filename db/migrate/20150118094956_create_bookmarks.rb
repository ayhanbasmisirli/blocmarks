class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
    	t.string :url
    	t.reference :topic, index: true
      t.timestamps
    end
  end
end
