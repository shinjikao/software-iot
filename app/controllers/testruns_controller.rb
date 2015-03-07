class TestrunsController < ApplicationController
	
	def index
		@testruns = Testrun.all
	end

	def new
		testrun_hash=params


		#file = File.read('report.json')
	   # testrun_hash = JSON.parse(file)
	    #@testrun_hash = testrun_hash


		tr = Testrun.new

		tr.TestRun_Time = params['TestRun_Time']
		tr.TestRun_Path = params['TestRun_Path']
		tr.Product      = params['Product']
		tr.SerialNumber = params['SerialNumber']
		tr.DeviceVersion = params['DeviceVersion']
		tr.AndroidVersion = params['AndroidVersion']
		

		ap = App.new
		ap.AppNumber = params['TestRun_Apps']['AppNumber']
		ap.AppName = params['TestRun_Apps']['AppName']
		ap.AppVersion = params['TestRun_Apps']['AppVersion']
		ap.AppSKU = params['TestRun_Apps']['AppSKU']
		ap.AppClass = params['TestRun_Apps']['AppClass']
		ap.AppCategory = params['TestRun_Apps']['AppCategory']
		ap.AppPackageName = params['TestRun_Apps']['AppPackageName']
		ap.ApkStatus = params['TestRun_Apps']['ApkStatus']
		ap.ApkResult = params['TestRun_Apps']['ApkResult']
		ap.AppInstallResult = params['TestRun_Apps']['AppInstallResult']
		ap.AppLaunchResult = params['TestRun_Apps']['AppLaunchResult']
		ap.testrun = tr
		ap.save	
    	tr.save
      
       redirect_to testruns_url
	end

	def create
	    
	end



	def edit

	end


	def show
		redirect_to testruns_url
	end

	def destroy
		@testrun = Testrun.find(params[:id])
		@testrun.destroy
		flash[:alert] = "event was successfully deleted"
		redirect_to testruns_url
	end

	def testrun_params
		params.require(:testrun).permit(:TestRun_Time)
	end

end
