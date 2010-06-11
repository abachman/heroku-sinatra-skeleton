# require 'haml'
gem 'sinatra', '= 1.0'
require 'sinatra/base'
require 'config/database'
require 'haml'
require 'sass'

class SkeletonApp < Sinatra::Base
  set :session, true
  set :haml, {:format => :html5 }
  set :root, File.dirname(__FILE__)
  set :public, Proc.new { File.join(root, "public") }

  helpers do
    def link_to text, url=nil
      haml "%a{:href => '#{ url || text }'} #{ text }"
    end

    def link_to_unless_current text, url=nil
      if url == request.path_info
        text
      else
        link_to text, url
      end
    end
  end

  # SASS stylesheet
  get '/style.css' do
    headers 'Content-Type' => 'text/css; charset=utf-8'
    sass :style
  end

  get '/' do
    haml :index, :layout => 'layouts/default'.to_sym
  end

  get '/about' do
    haml :about, :layout => 'layouts/default'.to_sym
  end
end

