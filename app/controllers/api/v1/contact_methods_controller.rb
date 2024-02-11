class Api::V1::ContactMethodsController < Api::V1::BaseController

  before_action :set_person

  def create
    method = ContactMethod.new(contact_method_params)
    if method.save
      render json: method, status: :created
    else
      render json: method.errors, status: :unprocessable_entity
    end
  end

  def update
    method = ContactMethod.update(contact_method_params)
    if method.save
      render json: method, status: :updated
    else
      render json: method.errors, status: :unprocessable_entity
    end
  end

  private

  def contact_method_params
    params.require(:contact_method).permit(:kind, :body)
  end

  def set_person
    @person = Person.find(params[:person_id])
  end
end