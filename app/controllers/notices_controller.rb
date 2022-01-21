class NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :update, :destroy]

  # GET /notices
  def index
    render json: get_notices # send back all the notices
  end

  # GET /notices/1
  def show
    render json: @notice
  end

  # POST /notices
  def create
    @notice = Notice.new(notice_params)

    if @notice.save
      # send back all the notices
      render json: get_notices, status: :created, location: @notice
    else
      render json: @notice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notices/1
  def update
    if @notice.update(notice_params)
      # Send back all the notices
      render json: get_notices 
    else
      render json: @notice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notices/1
  def destroy
    @notice.destroy
    # Send back all the notices
    render json: get_notices #
  end

  private
    # private controller class method we can reuse inside of index, create, update & destroy.
    
    # This will allow us to render our entire collection of notices as a response.
    
    # so we can up our component state in react with a fresh array
    def get_notices
      Notice.order('created_at DESC')
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notice_params
      params.require(:notice).permit(:title, :author, :phone)
    end
end
