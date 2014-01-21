class CreateWeibos < ActiveRecord::Migration
  def change
    create_table :weibos do |t|
      t.text :weibo
      t.string :image

      t.timestamps
    end
  end
end
