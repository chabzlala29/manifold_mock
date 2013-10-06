#lib/generators/gemname/install_generator.rb
require 'rails/generators'
require File.expand_path('../template_generator', __FILE__) 

module TemplatorChabz
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Install TemplatorChabz"
      class_option :framework, :type => :string, :default => "foundation", 
        :desc => "Specify Front-End framework"
      class_option :haml, :type => :boolean
      class_option :fluid, :type => :boolean
      class_option :fixed, :type => :boolean

      def self.source_root
        @source_root ||= File.join(File.dirname(__FILE__), 'templates')
      end

      def install
        say "Hello, Templator Chabz will help you set up your template"
        installed_gems = Gem::Specification.map { |g| g.name }
        if options[:framework] == "bootstrap"
          unless installed_gems.include?("twitter-bootstrap-rails")
            say "Adding bootstrap-rails gem to your Gemfile:"
            append_file "Gemfile", "\n", :force => true
            gem 'therubyracer' unless installed_gems.include?("therubyracer")
            gem 'less-rails' unless installed_gems.include?("less-rails")
            gem 'twitter-bootstrap-rails', git: 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
            begin
              Bundler.with_clean_env do
                run "bundle install"
                run "rails g bootstrap:install"
              end
            rescue RuntimeError => e
              raise "There was an error occurred", e.message
            end
          end
          say "Installing Bootstrap..."
        elsif options[:framework] == "foundation"
          unless installed_gems.include?("zurb-foundation")
            say "Adding foundation-rails gem to your Gemfile:"
            append_file "Gemfile", "\n", :force => true
            gem 'zurb-foundation'
            say "Installing Foundation..."
            begin
              Bundler.with_clean_env do
                run "bundle install"
                run "rails g foundation:install"
              end
            rescue RuntimeError => e
              raise "There was an error occurred", e.message
            end
          end
        else
          say "Framework not found. Please choose froom either 'foundation' or 'bootstrap'"
        end
        create_layout
      end

    private
      def create_layout
        if options.framework == "foundation"
          Bundler.with_clean_env do
            if options.haml?
              run "rails g foundation:install --haml"
            else
              run "rails g foundation:install"
            end
          end
        elsif options.framework == "bootstrap"
          option_bs = ("fluid" if options.fluid) || ( "fixed" if options.fixed) || ""
          Bundler.with_clean_env do
            run "rails g bootstrap:layout application #{option_bs}"
          end
        else
          say "Framework not found. Please choose froom either 'foundation' or 'bootstrap'"
        end
      end
    end
  end
end
