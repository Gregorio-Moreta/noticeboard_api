class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.string :title
      t.string :author
      t.string :phone

      t.timestamps
    end
  end
end
