# app/helpers/api_helper.rb
module ApiHelper
  def paginate_and_render(model, params)
    # Create a Ransack search object with the provided model and params
    search = model.ransack(params[:q])

    # Limit sorting to ransortable attributes
    sort_attribute = params[:sort_attribute]
    sort_direction = %w[asc desc].include?(params[:sort_direction]) ? params[:sort_direction] : 'asc'

    if model.ransortable_attributes.include?(sort_attribute)
      search.sorts = "#{sort_attribute} #{sort_direction}"
    end

    # Perform the query with pagination
    records = search.result.includes(:notes)
                    .page(params[:page]).per(params[:count])

    # Format the response with pagination details
    {
      page: params[:page],
      count: params[:count],
      total_count: records.total_count,
      total_pages: records.total_pages,
      data: records
    }
  end
end
