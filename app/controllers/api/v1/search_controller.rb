class Api::V1::SearchController < Api::V1::BaseController

  before_action :set_model
  def index
    @q = @model.ransack(search_params)
    @results = @q.result(distinct: true)
                 .order_by(params[:sort_attribute], params[:sort_direction])
                 .page(params[:page])
                 .per(params[:count])

    render json: @results
  end


  private

  def search_params
    params.require(:q).permit!
  end

  def set_model
    @model = params[:model].classify.constantize
    if valid_model_name?(model_name)
      @model = model_name.constantize
    else
      render json: { error: 'Invalid model name' }, status: :bad_request
    end
  end

end