class Api::V1::CagnottesController < Api::V1::BaseController
  before_action :set_cagnotte, only: [ :show, :update ]

  def index
    user = User.where(messenger_id: params["messenger user id"])
    @cagnottes = policy_scope(Cagnotte).where(user: user)
  end

  def show
  end

  def update
    if @cagnotte.update(cagnotte_params)
      render :show
    else
      render_error
    end
  end

  def create
    @cagnotte = current_user.cagnottes.build(

      )
    authorize @cagnotte
    if @cagnotte.save
      render :show
    else
      render_error
    end
  end

  private

  def set_cagnotte
    @cagnotte = Cagnotte.find(params[:id])
    authorize @cagnotte # For Pundit
  end

  def cagnotte_params
    params.require(:cagnotte).permit(:genre, :date, :montant, :objectif)
  end

  def render_error
    render json: { errors: @cagnotte.errors.full_messages },
      status: :unprocessable_entity
  end
end
