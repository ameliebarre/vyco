class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :title
    end
  end
end
