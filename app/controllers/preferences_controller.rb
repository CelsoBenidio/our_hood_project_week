class PreferencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    @preference = Preference.new
    authorize @preference
  end

  def create
    @preference = Preference.find_or_initialize_by(user_id: current_or_guest_user.id)
    @preference.update preference_params

    if @preference.save
      redirect_to boxes_path
    end
    authorize @preference
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
