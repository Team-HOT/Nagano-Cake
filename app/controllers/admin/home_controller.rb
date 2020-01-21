class Admin::HomeController < ApplicationController
  def top
  	@order = Order.all
  end
end
