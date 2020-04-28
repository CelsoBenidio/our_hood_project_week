class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :current_or_guest_user

  helper_method :current_or_guest_user

    include Pundit

    # Pundit: white-list approach.
    after_action :verify_authorized, except: :index, unless: :skip_pundit?
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

    # Uncomment when you *really understand* Pundit!
    # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    # def user_not_authorized
    #   flash[:alert] = "You are not authorized to perform this action."
    #   redirect_to(root_path)
    # end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def current_or_guest_user(is_new = false)
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        logging_in if is_new
        # reload guest_user to prevent caching problems before destruction
        guest_user(with_retry = false).try(:reload).try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user(with_retry = true)
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

    rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
    session[:guest_user_id] = nil
    guest_user if with_retry
  end

  private

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  def logging_in
    # For example:
    # guest_comments = guest_user.comments.all
    # guest_comments.each do |comment|
      # comment.user_id = current_user.id
      # comment.save!
    # end
    guest_user.preference.update user_id: current_user.id if guest_user.preference
    guest_cart_box_id = guest_user.cart.box_id
    guest_cart_products = guest_user.cart.products
    current_cart = current_user.cart
    current_cart.box_id = guest_cart_box_id
    current_cart.products = guest_cart_products
    current_cart.save
    guest_user.cart.destroy

  end

    def create_guest_user
      u = User.new(:name => "guest", :email => "guest_#{Time.now.to_i}#{rand(100)}@example.com")
      u.save!(:validate => false)
      session[:guest_user_id] = u.id
      u
    end

    def skip_pundit?
      devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)|(^omniauth$)/
    end
end

# 1. User add product to cart
# 2. Click the proceed to checkout button
    # a. Order is created on DB. By default the order is pending
    # b. Create a new Stripe payment session and link it to the order
# 3. In the payments/new page we click the button to redirect to stripe
# 4. Process the payment on Stripe website (not ours!)
  # a. Once the payment is processed, stripe sends a webook request to us
  # b. When we receive the webhook request we update the order to "paid" and we empty the cart
# 5. Stripe redirects us back to ourhood
