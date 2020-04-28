class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :how_it_works, :about_us, :stores]

  def home
  end

  def how_it_works
  end

  def about_us
  end

  def stores
  end
end
