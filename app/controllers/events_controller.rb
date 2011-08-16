class EventsController < InheritedResources::Base
  before_filter :authenticate_user!, :except => :show
end
