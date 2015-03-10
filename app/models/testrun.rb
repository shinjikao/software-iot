class Testrun < ActiveRecord::Base
	has_many :apps
	skip_before_action :verify_authenticity_token
end
