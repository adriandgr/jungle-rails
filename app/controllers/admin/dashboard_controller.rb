class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_USER_PW']

  def show
  end
end
