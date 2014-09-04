class Admin::KanmususController < AdminController
  before_action :set_kanmusu, only: [:edit, :update, :destroy]

  def index
    @kanmusus = Kanmusu.all
  end

  def new
    @kanmusu = Kanmusu.new

    render 'form'
  end

  def edit
    render 'form'
  end

  def create
    @kanmusu = Kanmusu.new(kanmusu_params)
    if @kanmusu.save
      redirect_to action: :index
    else
      render json: @kanmusu.errors
    end
  end

  def update
    if @kanmusu.update_attributes(kanmusu_params)
      redirect_to action: :index
    else
      render json: @kanmusu.errors
    end
  end

  def destroy

  end

  private
  def kanmusu_params
    params.require(:kanmusu).permit(:name, :avatar, :image)
  end

  def set_kanmusu
    @kanmusu = Kanmusu.find(params[:id])
  end
end