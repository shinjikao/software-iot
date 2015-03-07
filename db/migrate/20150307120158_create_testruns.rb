class CreateTestruns < ActiveRecord::Migration
  def change
    create_table :testruns do |t|
      t.string :TestRun_Time
      t.string :TestRun_Path
      t.string :Product
      t.string :SerialNumber
      t.string :DeviceVersion
      t.string :AndroidVersion

      t.timestamps null: false
    end
  end
end
