class TestrunAppsController < ApplicationController
	skip_before_action :verify_authenticity_token


    def index
      @a = params[:AppNativeCode]
      @testrun = Testrun.find( params[:testrun_id])
      if params[:AppClass]
        @apps = @testrun.apps.where(:AppClass => params[:AppClass])

      elsif params[:AppNativeCode]

        @apps = @testrun.apps.where("AppNativeCode LIKE ? "    , "#{params[:AppNativeCode]}%")

      elsif  params[:ApkResult] && params[:ApkResult] != "All"
        @apps = @testrun.apps.where(:ApkResult => params[:ApkResult])

      elsif params[:AppInstallResult]
        @apps = @testrun.apps.where(:AppInstallResult => params[:AppInstallResult])
      elsif params[:AppLaunchResult]
        @apps = @testrun.apps.where(:AppLaunchResult  => params[:AppLaunchResult])


      else
        @apps = @testrun.apps
      end
    end


    def show
    	@app =@testrun.apps.find(params[:id])
    end

    def new
    	@app = @testrun.apps.build
    end


    def create
    	@app = @testrun.apps.build(app_params)
    	if @app.save
    		redirect_to testrun_apps_url (@testrun)
    	else
    			render :action => :new
    	end
    end


    def edit
    	@app = @testrun.apps.find(params[:id])
    end

    def update
		@app = @testrun.apps.build(params[:id])
    	if @app.update(app_params)
    		redirect_to testrun_apps_url (@testrun)
    	else
    		render :action => :edit
    	end
    end

    def destroy
    	@app = @testrun.apps.find(params[:id])
    	@app.destroy
    	redirect_to testrun_apps_url(@testrun)
    end

  	protected
  	def find_testrun
  		@testrun = Testrun.find( params[:testrun_id])
  	end

  	def app_params
  		params.require(:app).permit(:AppPackageName)
  	end

    	
    

end
