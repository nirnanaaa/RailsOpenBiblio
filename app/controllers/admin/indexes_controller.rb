class Admin::IndexesController < ApplicationController
  def index
    render 'index', :layout => 'admin'
  end
end
