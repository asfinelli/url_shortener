class CreateShortenedUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.text :original_url
      t.string :random_id
      t.timestamps
    end
  end
end
