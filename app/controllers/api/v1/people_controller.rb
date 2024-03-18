class Api::V1::PeopleController < Api::V1::BaseController


  def index
    render json: paginate_and_render(Note, params)
  end

  def show
    render json: Person.find(params[:id])
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