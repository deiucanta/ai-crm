class Api::V1::PeopleController < Api::V1::BaseController

  def index
    render json: Person.all
                       .order_by(params[:sort_attribute], params[:sort_direction])
                       .page(params[:page]).per(params[:count])
  end

  def show
    render json: Person.find(params[:id])
  end

  def search
    # ransack methods
    # created_at and updated_at greater_than or less_than
    # first or last name contains
    render json: Person.ransack(params[:q])
                       .result
                       .order_by(params[:sort_attribute], params[:sort_direction])
                       .page(params[:page])
                       .per(params[:count])
  end

  def create
    person = Person.new(person_params)
    if person.save
      render json: person, status: :created
    else
      render json: person.errors, status: :unprocessable_entity
    end
  end

  def update
    person = Person.find(params[:id])
    if person.update(person_params)
      render json: person, status: :ok
    else
      render json: person.errors, status: :unprocessable_entity
    end
  end

  def companies
    person = Person.find(params[:id])
    render json: person.companies
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :status)
  end

end