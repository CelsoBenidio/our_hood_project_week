class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :how_it_works, :about_us]

  def home
  end

  def how_it_works
  end

  def about_us
  end

  def stores_page
  end
end
