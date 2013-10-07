module ManifoldMock
  module Utils
    attr_reader :installed_gems

    def installed_gems(gems)
      @installed_gems ||= gems 
    end

    def install_framework(options={})
      case options[:framework]
      when "bootstrap"
        say "Installing Bootstrap..."
        unless @installed_gems.include?("twitter-bootstrap-rails")
          say "Adding bootstrap-rails gem to your Gemfile:"
          install_gems "therubyracer", "less-rails", "twitter-bootstrap-rails"
        end
        create_layout options
      when "foundation"
        say "Installing Foundation..."
        unless @installed_gems.include?("zurb-foundation")
          say "Adding foundation-rails gem to your Gemfile:"
          install_gems 'zurb-foundation'
        end
        create_layout options
      else
        say "Framework not found. Please choose froom either 'foundation' or 'bootstrap'"
      end
    end


  private
    def install_gems(*gems)
      append_file "Gemfile", "\n", :force => true
      gems.each {|gem| gem "#{gem}" unless @installed_gems.include? "#{gem}"}
      begin
        Bundler.with_clean_env do
          run "bundle install"
        end
      rescue RuntimeError => e
        raise "There was an error occurred", e.message
      end
    end

    def create_layout(options={})
      Bundler.with_clean_env do
        run "rails g #{options[:framework]}:install #{'--haml' if options[:haml]}"
      end
    end

    #def create_layout
      #if options.framework == "foundation"
        #Bundler.with_clean_env do
          #if options.haml?
            #run "rails g foundation:install --haml"
          #else
            #run "rails g foundation:install"
          #end
        #end
      #elsif options.framework == "bootstrap"
        #option_bs = ("fluid" if options.fluid) || ( "fixed" if options.fixed) || ""
        #Bundler.with_clean_env do
          #run "rails g bootstrap:layout application #{option_bs}"
        #end
      #else
        #say "Framework not found. Please choose froom either 'foundation' or 'bootstrap'"
      #end
    #end
  end
end
