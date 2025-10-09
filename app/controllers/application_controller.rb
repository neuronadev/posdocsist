class ApplicationController < ActionController::Base
    before_action :authenticate_usuario!
    add_flash_types :info, :error, :warning, :success
end
