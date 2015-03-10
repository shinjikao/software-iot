
require 'json'
class TestrunsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def index
		@testruns = Testrun.all
	end

	def new
		
		@testrun_hash=params
		
		#file = File.read('report0310.json')
		tr = Testrun.new
		tr.TestRun_Time =params[:TestRun_Time]
		tr.TestRun_Time = params[:TestRun_Time]
		tr.Product      = params[:Product]
		tr.SerialNumber = params[:SerialNumber]
		tr.DeviceVersion = params[:DeviceVersion]
		tr.AndroidVersion = params[:AndroidVersion]
	    tr.save
		
		

    	redirect_to testruns_url
	end

	def create
		@testrun_hash=params
		
		#file = File.read('report0310.json')
		tr = Testrun.new
		tr.TestRun_Time =params[:TestRun_Time]
		tr.TestRun_Time = params[:TestRun_Time]
		tr.Product      = params[:Product]
		tr.SerialNumber = params[:SerialNumber]
		tr.DeviceVersion = params[:DeviceVersion]
		tr.AndroidVersion = params[:AndroidVersion]
		params[:TestRun_Apps].each_with_index {|val, index| 
			ap = App.new
			ap.AppName = val[:AppName]
			ap.testrun = tr
			#puts "#{val} => #{index}" 
		}


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
