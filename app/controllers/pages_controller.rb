class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_before_action :authenticate_user!, only: [:how_it_works]
  skip_before_action :authenticate_user!, only: [:about_us]

  def home
  end

  def how_it_works
  end

  def about_us
  end
end
