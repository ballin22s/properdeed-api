class CreateListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :list_items do |t|
      t.integer :list_id, required: true
      
      t.string  :task
      t.string  :description
      t.string  :status
      t.text    :details
      t.date    :start_date
      t.date    :end_date

      t.timestamps
    end
  end
end
