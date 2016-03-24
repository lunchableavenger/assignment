class CreateSmsSends < ActiveRecord::Migration
  def change
    create_table :sms_sends do |t|
      t.string :phone
      t.string :message

      t.timestamps null: false
    end
  end
end
