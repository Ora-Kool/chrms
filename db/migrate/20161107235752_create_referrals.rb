class CreateReferrals < ActiveRecord::Migration[5.0]
  def change
    create_table :referrals do |t|

      t.timestamps
    end
  end
end
