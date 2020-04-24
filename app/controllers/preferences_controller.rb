class PreferencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new preference_params
    @preference.user = current_or_guest_user

    if @preference.save
      redirect_to boxes_path
    end
  end

  private

  def preference_params
    params.require(:preference).permit(
      :name,
      :age,
      :gender,
      :visit_frequency,
      :needed_product,
      :favorite_product => [],
      :issue => []
    )
  end
end
