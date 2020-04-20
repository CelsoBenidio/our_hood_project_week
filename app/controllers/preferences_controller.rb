class PreferencesController < ApplicationController
  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new preference_params
    @preference.user = current_user

    if @preference.save
      redirect_to root_path
    end
  end

  private

  def preference_params
    params.require(:preference).permit(:age, :gender)
  end
end
