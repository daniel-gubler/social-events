module ApplicationHelper
  def header str
    content_for(:header) { str }
  end

  def cancel_button
    @current_page_path ||= begin
      path = params.slice :controller, :mode, :path
      path[:action] = [:index, :show, :view].find { |action| controller.respond_to? action }
      url_for path rescue nil
    end
    content_tag :div, :class => "cancel" do
      link_to "Cancel", @current_page_path
    end
  end

  def timefield(form, resource, method)
    render :partial => '/layouts/timefield', :locals => { :form => form, :resource => resource, :method => method }
  end
end
