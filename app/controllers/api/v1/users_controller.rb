class Api::V1::UsersController < Api::V1::ApiV1Controller
  before_action :set_api_v1_user, only: [:show, :update, :destroy]

  # GET /api/v1/users
  def index
    authorize User
    @api_v1_users = policy_scope(User)
    @pagy, @api_v1_users = pagy(@api_v1_users)
    options = { meta: pagy_metadata(@pagy) }
    render json: Api::V1::UserSerializer.new(@api_v1_users, options).serialized_json
  end

  # GET /api/v1/users/1
  def show
    render json: Api::V1::UserSerializer.new(@api_v1_user).serialized_json
  end

  # POST /api/v1/users
  def create
    @api_v1_user = User.new(api_v1_user_params)

    if @api_v1_user.save
      render json: Api::V1::UserSerializer.new(@api_v1_user).serialized_json, status: :created
    else
      render json: { errors: @api_v1_user.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/users/1
  def update
    if @api_v1_user.update(api_v1_user_params)
      render json: Api::V1::UserSerializer.new(@api_v1_user).serialized_json
    else
      render json: { errors: @api_v1_user.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/1
  def destroy
    @api_v1_user.soft_delete!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api_v1_user
    @api_v1_user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def api_v1_user_params
    params.require(:api_v1_user).permit(:name, :email, :password, :password_confirmation)
  end
end
