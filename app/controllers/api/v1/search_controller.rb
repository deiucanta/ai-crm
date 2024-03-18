class Api::V1::SearchController < Api::V1::BaseController

  before_action :set_model
  def index
    render json: paginate_and_render(@model, params)
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