class PagesController < ApplicationController
  def home
    @routes = Rails.application.routes.named_routes.send(:routes).values.map do |route|
      next if route.defaults[:controller].include? "action"
      next if route.defaults[:controller].include? "rails"
      next if route.defaults[:controller].include? "active"
      next if route.defaults[:controller].include? "turbo"

      controller = route.defaults[:controller]
      action = route.defaults[:action] unless route.defaults[:action] == "index"

      "#{controller}/#{action}"
    end

    @routes = @routes.reject { |r| r == "/" }.reject { |r| r.nil? }

    render template: "pages/home"
  end
end
