require 'rails/generators'

module TemplatorChabz
  module Generators
    class TemplateGenerator < Rails::Generators::Base
      ZB_TEMPLATES = ['banded','blog', 'feed', 'grid', 'orbit', 'banner-home', 'sidebar']

      class_option :haml, type: :boolean, desc: "Generate HAML layout"
      class_option :framework, type: :string, default: "foundation"
      class_option :template, type: :string, default: "blog"

      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), 'templates')
      end

      def create_template
        if ZB_TEMPLATES.include?(options.template) && options.framework == "foundation"
          if options.haml?
            remove_file "app/views/layouts/application.html.erb"
            template "foundation/haml/#{options.template}.html.haml", "app/views/layouts/application.html.haml"
          else
            remove_file "app/views/layouts/application.html.haml"
            template "foundation/erb/#{options.template}.html.erb", "app/views/layouts/application.html.erb"
          end
        else
          raise "template not found."
        end
      end
    end
  end
end
