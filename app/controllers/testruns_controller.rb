class TestrunsController < ApplicationController
	
	def index
		@testruns = Testrun.all
	end

	def new
		
		testrun_hash=params
		

		#file = File.read('report.json')
	    #@testrun_hash = JSON.parse(file)
	    
	    
		
	    
		tr = Testrun.new
		tr.TestRun_Time = params['TestRun_Time']
		tr.TestRun_Path = params['TestRun_Path']
		tr.Product      = params['Product']
		tr.SerialNumber = params['SerialNumber']
		tr.DeviceVersion = params['DeviceVersion']
		tr.AndroidVersion = params['AndroidVersion']
		params['TestRun_Apps'].each do | app|
	    	
			ap = App.new
			ap.AppNumber = app['AppNumber']
			ap.AppName = app['AppName']
			ap.AppVersion =app['AppVersion']
			ap.AppSKU = app['AppSKU']
			ap.AppClass = app['AppClass']
			ap.AppCategory = app['AppCategory']
			ap.AppPackageName = app['AppPackageName']
			ap.ApkStatus = app['ApkStatus']
			ap.ApkResult = app['ApkResult']
			ap.AppInstallResult = app['AppInstallResult']
			ap.AppLaunchResult = app['AppLaunchResult']
			ap.testrun = tr
			ap.save	
			end
			
			tr.save
		
      	
    	#redirect_to testruns_url
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
