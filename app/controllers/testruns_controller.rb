
require 'json'
class TestrunsController < ApplicationController
	
	def index
		@testruns = Testrun.all
	end

	def new
		
		@testrun_hash=params
		
		#file = File.read('report0310.json')
		tr = Testrun.new
		tr.TestRun_Time =params[:TestRun_Time]
	    tr.save
		#tr= Testrun.new
		#tr.TestRun_Time = hash[:TestRun_Time]
		#tr.save

		#params.collect { |k,v| "#{k} ,#{v}" }
	    #tr = Testrun.new
		#tr.TestRun_Time = testrun_hash[:TestRun_Time]
		#tr.Product      = testrun_hash[:Product]
		#tr.SerialNumber = testrun_hash[:SerialNumber]
		#tr.DeviceVersion = testrun_hash[:DeviceVersion]
		#tr.AndroidVersion = testrun_hash[:AndroidVersion]
		#tr.save
		#@t = tr 
    	#redirect_to testruns_url
	end

	def create
		@testrun_hash=params
		tr = Testrun.new
		tr.TestRun_Time =params[:TestRun_Time]
	    tr.save

      	
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
