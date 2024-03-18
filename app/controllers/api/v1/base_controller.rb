class Api::V1::BaseController < ApplicationController
  include ApiAuthenticationHelper
  include ApiHelper

  def valid_model_name?(model_name)
    # Ensures that the model name corresponds to a valid ActiveRecord model
    ActiveRecord::Base.descendants.map(&:name).include?(model_name)
  end
end