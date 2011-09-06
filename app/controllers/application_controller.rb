class ApplicationController < ActionController::Base
  protect_from_forgery
  #test
  
  def mark_required(object, attribute)
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
  end
end
