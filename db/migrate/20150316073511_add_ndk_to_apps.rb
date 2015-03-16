class AddNdkToApps < ActiveRecord::Migration
  def change
  	add_column :apps , :AppNativeCode ,:string
  	add_column :apps, :AppComment , :string
  end
end
