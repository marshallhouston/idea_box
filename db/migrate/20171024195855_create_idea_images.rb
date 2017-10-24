class CreateIdeaImages < ActiveRecord::Migration[5.1]
  def change
    create_table :idea_images do |t|
      t.belongs_to :idea, index: true
      t.belongs_to :image, index: true
    end
  end
end
