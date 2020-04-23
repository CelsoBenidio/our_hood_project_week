class PreferencesController < ApplicationController
  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new preference_params
    @preference.user = current_user

    if @preference.save
      redirect_to boxes_path
    end
  end

  private

  def preference_params
    params.require(:preference).permit(
      :name,
      :age => [],
      :gender => [],
      :favorite_product => [],
      :visit_frequency => [],
      :issue => [],
      :needed_product => []
    )
  end
end
