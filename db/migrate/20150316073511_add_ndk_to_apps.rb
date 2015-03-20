class AddNdkToApps < ActiveRecord::Migration
  def change
  	add_column :apps,:AppNativeCode ,:string
  	add_column :apps, :AppComment , :string

  	add_column :apps, :AppInstallFailReason , :string
  	add_column :apps, :AppLaunchFailReason , :string
  	add_column :apps, :LogPath , :string
  end
end
