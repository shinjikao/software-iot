
require 'json'
class TestrunsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def index
		@testruns = Testrun.all
	end

	def new
    file = File.read('report0320.json')
    data_hash = JSON.parse(file)

    tr = Testrun.new

    tr.TestRun_Time = data_hash["TestRun_Time"]
    tr.Product      = data_hash["Product"]
    tr.SerialNumber = data_hash["SerialNumber"]
    tr.DeviceVersion = data_hash["DeviceVersion"]
    tr.AndroidVersion = data_hash["AndroidVersion"]
    data_hash["TestRun_Apps"].each_with_index { |app,index|
      ap = App.new
      ap.AppNumber = app["AppNumber"]
      ap.AppName = app["AppName"]
      ap.AppVersion =app["AppVersion"]
      ap.AppSKU = app["AppSKU"]
      ap.AppClass =app["AppClass"]
      ap.AppCategory =app["AppCategory"]
      ap.AppPackageName = app["AppPackageName"]
      ap.AppNativeCode = app["AppNativeCode"]
      ap.AppComment = app["AppComment"]
      ap.ApkStatus = app["ApkStatus"]
      ap.ApkResult = app["ApkResult"]
      ap.AppInstallResult = app["AppInstallResult"]
      ap.AppInstallFailReason = app["AppInstallReason"]
      ap.AppLaunchResult =app["AppLaunchResult"]
      ap.AppLaunchFailReason  =app["AppLaunchReason"]
      ap.testrun = tr
      ap.save

    }
    tr.save
    redirect_to testruns_url

	end





	def create
		#POST
		tr = Testrun.new
		tr.TestRun_Time =params[:TestRun_Time]
		tr.TestRun_Time = params[:TestRun_Time]
		tr.Product      = params[:Product]
		tr.SerialNumber = params[:SerialNumber]
		tr.DeviceVersion = params[:DeviceVersion]
		tr.AndroidVersion = params[:AndroidVersion]
    params[:TestRun_Apps].each_with_index {|app, index|
			ap = App.new
			ap.AppNumber = app[:AppNumber]
			ap.AppName = app[:AppName]
			ap.AppVersion =app[:AppVersion]
			ap.AppSKU = app[:AppSKU]
      ap.AppClass =app[:AppClass]
      ap.AppCategory =app[:AppCategory]
      ap.AppPackageName = app[:AppPackageName]
      ap.AppNativeCode = app[:AppNativeCode]
      ap.AppComment = app[:AppComment]

      ap.ApkStatus = app[:ApkStatus]
      ap.ApkResult = app[:ApkResult]
      ap.AppInstallResult = app[:AppInstallResult]
      ap.AppInstallFailReason = app[:AppInstallReason]
      ap.AppLaunchResult =app[:AppLaunchResult]
      ap.AppLaunchFailReason  =app[:AppLaunchReason]
			ap.testrun = tr
			ap.save

		}
	    tr.save

		redirect_to testruns_url
	end



	def edit

	end


	def show
		redirect_to testruns_url
	end

	def destroy
		@testrun = Testrun.find(params[:id])

    @testrun.apps.delete_all
    @testrun.destroy
		flash[:alert] = "event was successfully deleted"
		redirect_to testruns_url
	end

	def testrun_params
		params.require(:testrun).permit(:TestRun_Time)
	end

end
