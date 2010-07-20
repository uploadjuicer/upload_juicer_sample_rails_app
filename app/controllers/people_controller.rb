class PeopleController < ApplicationController
  helper :uploads
  respond_to :html
  
  before_filter :build_person, :only => [ :new, :create ]
  
  def create
    @person.save
    respond_with(@person)
  end
  
  def show
    @person = Person.find(params[:id])
  end
  
  protected
  
    def build_person
      @person = Person.new(params[:person])
    end
end
