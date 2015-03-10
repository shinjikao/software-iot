
class TestrunsController < ApplicationController
	
	def index
		@testruns = Testrun.all
	end

	def new
		
		#testrun_hash=params
		
		#file = File.read('report0310.json')
		@pa = params
		hash=  JSON.parse(value)
	    @h = params.to_h
	    
		@s = params.to_s
		@pa_inspect = params.inspect
		tr= Testrun.new
		tr.TestRun_Time = hash[:var1]
		tr.save

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

		@pa = params
	    @h = params.to_h
	    @a = params.to_a
		@s = params.to_s
		@pa_inspect = params.inspect
		tr= Testrun.new
		tr.TestRun_Time = params[:TestRun_Time]
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
