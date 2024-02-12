class Api::V1::ConnectionsController < Api::V1::BaseController

  before_action :fetch_records

  def create
    @company.people << @person
    render json: @company.people
  end

  def destroy
    connection = @company.person_company_connections.find_by(person_id: @person.id)
    if connection
      connection.destroy
      render json: @company.people, status: :ok
    else
      # Handle the case where the connection does not exist
      render json: { error: 'Connection not found' }, status: :not_found
    end
  end


  private

  def fetch_records
    @person = Person.find(params[:person]) if params[:person_id]
    @company = Company.find(params[:company_id])
  end

end