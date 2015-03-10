class TestrunsController < ApplicationController
	
	def index
		@testruns = Testrun.all
	end

	def new
		
		#testrun_hash=params
		
		testrun_hash = params.to_h

		#file = File.read('report0310.json')
	    #testrun_hash = JSON.parse(file)

	    tr = Testrun.new
		tr.TestRun_Time = testrun_hash['TestRun_Time']
		tr.Product      = testrun_hash['Product']
		tr.SerialNumber = testrun_hash['SerialNumber']
		tr.DeviceVersion = testrun_hash['DeviceVersion']
		tr.AndroidVersion = testrun_hash['AndroidVersion']
		tr.save
		
      	
    	#redirect_to testruns_url
	end

	def create
	    #testrun_hash=params
		@json_obj2=params

		file = File.read('report.json')
	    testrun_hash = JSON.parse(file)
	    
	    
		testrun_hash.each do |hash|
	    #params.each do |hash|
		tr = Testrun.new
		
		tr.TestRun_Time = hash['TestRun_Time']
		tr.TestRun_Path = hash['TestRun_Path']
		tr.Product      = hash['Product']
		tr.SerialNumber = hash['SerialNumber']
		tr.DeviceVersion = hash['DeviceVersion']
		tr.AndroidVersion = hash['AndroidVersion']
		hash['TestRun_Apps'].each do | app|
	    	
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
		end
      	
    	#redirect_to testruns_url
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
