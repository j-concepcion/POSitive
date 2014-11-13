class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_index, only: [:index]
  before_action :build_user, only: [:create]
  load_and_authorize_resource
  # GET /users
  # GET /users.json
  def index
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    generated_password = Devise.friendly_token.first(8)
    @user.password = generated_password

    respond_to do |format|
      if @user.save
        @user.create_activity key: 'user.create', owner: current_user
        UserMailer.welcome_email(@user, generated_password).deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        @user.create_activity key: 'user.update', owner: current_user
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # GET /
  def dashboard
    # @user = current_user
    authorize! :dashboard, current_user
    @activities = PublicActivity::Activity.accessible_by(current_ability).order('created_at DESC').limit(10)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :status, :birthday, :age, :address, :contact_number, :roles =>[])
    end
    
    def user_search_params
      params[:q].assert_valid_keys('s', 'first_name_cont', 'last_name_cont', 'email_cont', 'status', 'roles') unless params[:q].blank?
      params[:q]
    end
    
    def set_index
      @q = User.search(user_search_params, auth_object: current_user)
      @users = @q.result(distinct: true).accessible_by(current_ability).page params[:page]
    end
    
    def build_user
      @user = User.new(user_params)
    end
      
end
