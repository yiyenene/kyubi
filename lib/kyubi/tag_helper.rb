module Kyubi
  module TagHelper
    extend ActiveSupport::Concern

    def kyubi_stylesheet_link_tag(options = {})
      sources = []
      controller_name = options[:controller] || controller.controller_name
      action_name = options[:action] || controller.action_name
      sources << "#{controller_name}/shared" if Catalog.stylesheet_exist?(controller_name, "shared")
      sources << "#{controller_name}/#{action_name}" if Catalog.stylesheet_exist?(controller_name, action_name)
      return if sources.empty?

      sources << options.except(:controller, :action)
      stylesheet_link_tag(*sources)
    end

    def kyubi_javascript_include_tag(options = {})
      sources = []
      controller_name = options[:controller] || controller.controller_name
      action_name = options[:action] || controller.action_name
      sources << "#{controller_name}/shared" if Catalog.javascript_exist?(controller_name, "shared")
      sources << "#{controller_name}/#{action_name}" if Catalog.javascript_exist?(controller_name, action_name)
      return if sources.empty?

      sources << options.except(:controller, :action)
      javascript_include_tag(*sources)
    end
  end
end
