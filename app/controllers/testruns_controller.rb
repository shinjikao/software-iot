class TestrunsController < ApplicationController
	
	def index
		@testruns = Testrun.all
	end

	def new
		file = File.read('report.json')
	    testrun_hash = JSON.parse(file)
	    @testrun_hash = testrun_hash
    
    	testrun_hash.each do |testrun|
			tr = Testrun.new

			tr.TestRun_Time = testrun['TestRun_Time']
			tr.TestRun_Path = testrun['TestRun_Path']
			tr.Product      = testrun['Product']
			tr.SerialNumber = testrun['SerialNumber']
			tr.DeviceVersion = testrun['DeviceVersion']
			tr.AndroidVersion = testrun['AndroidVersion']

			ap = App.new
			ap.AppNumber = testrun['TestRun_Apps']['AppNumber']
			ap.AppName = testrun['TestRun_Apps']['AppName']
			ap.AppVersion = testrun['TestRun_Apps']['AppVersion']
			ap.AppSKU = testrun['TestRun_Apps']['AppSKU']
			ap.AppClass = testrun['TestRun_Apps']['AppClass']
			ap.AppCategory = testrun['TestRun_Apps']['AppCategory']
			ap.AppPackageName = testrun['TestRun_Apps']['AppPackageName']
			ap.ApkStatus = testrun['TestRun_Apps']['ApkStatus']
			ap.ApkResult = testrun['TestRun_Apps']['ApkResult']
			ap.AppInstallResult = testrun['TestRun_Apps']['AppInstallResult']
			ap.AppLaunchResult = testrun['TestRun_Apps']['AppLaunchResult']
			ap.testrun = tr
			ap.save	
        	tr.save
      end
       redirect_to testruns_url
	end

	def create
	    file = File.read('report.json')
		    testrun_hash = JSON.parse(file)
		    @testrun_hash = testrun_hash
	    
	    	testrun_hash.each do |testrun|
				tr = Testrun.new

				tr.TestRun_Time = testrun['TestRun_Time']
				tr.TestRun_Path = testrun['TestRun_Path']
				tr.Product      = testrun['Product']
				tr.SerialNumber = testrun['SerialNumber']
				tr.DeviceVersion = testrun['DeviceVersion']
				tr.AndroidVersion = testrun['AndroidVersion']

				ap = App.new
				ap.AppNumber = testrun['TestRun_Apps']['AppNumber']
				ap.AppName = testrun['TestRun_Apps']['AppName']
				ap.AppVersion = testrun['TestRun_Apps']['AppVersion']
				ap.AppSKU = testrun['TestRun_Apps']['AppSKU']
				ap.AppClass = testrun['TestRun_Apps']['AppClass']
				ap.AppCategory = testrun['TestRun_Apps']['AppCategory']
				ap.AppPackageName = testrun['TestRun_Apps']['AppPackageName']
				ap.ApkStatus = testrun['TestRun_Apps']['ApkStatus']
				ap.ApkResult = testrun['TestRun_Apps']['ApkResult']
				ap.AppInstallResult = testrun['TestRun_Apps']['AppInstallResult']
				ap.AppLaunchResult = testrun['TestRun_Apps']['AppLaunchResult']
				ap.testrun = tr
				ap.save	
	        	tr.save
	      end
	       redirect_to testruns_url
	end



	def edit

	end


	def show
		redirect_to testruns_url
	end

	def destroy
	end

	

end
