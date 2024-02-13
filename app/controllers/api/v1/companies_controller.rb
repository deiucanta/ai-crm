class Api::V1::CompaniesController < Api::V1::BaseController

  # allowed sortable attributes:
  # :id, :created_at, :updated_at, :name, :status
  def index
    render json: Company
                   .includes(:notes)
                   .all
                   .order_by(params[:sort_attribute], params[:sort_direction])
                   .page(params[:page]).per(params[:count])
  end

  def show
    render json: Company.includes(:notes).find(params[:id])
  end

  def create
    company = Company.new(company_params)
    if company.save
      render json: company, status: :created
    else
      render json: company.errors, status: :unprocessable_entity
    end
  end

  def update
    company = Company.find(params[:id])
    if company.update(company_params)
      render json: company, status: :ok
    else
      render json: company.errors, status: :unprocessable_entity
    end
  end

  def people
    company = Company.find(params[:id])
    render json: company.people
  end

  private

  def company_params
    params.require(:company).permit(:name, :status)
  end
end