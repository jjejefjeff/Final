class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :grade
      t.integer :points
      t.integer :naqt_att
      t.integer :oac_att
      t.integer :pract_att
      t.boolean :dues_paid

      t.timestamps null: false
    end
  end
end
