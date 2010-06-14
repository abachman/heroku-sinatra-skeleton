A simple web app skeleton. Works with:

    haml --version 3.0.12
    sinatra --version 1.0
    dm-core --version 0.10.2
    data_objects --version 0.10.2
    do_postgres --version 0.10.2

    # test only
    cucumber --version 0.7.2
    capybara --version 0.3.8
    rspec --version 1.3.0

    # development only
    thin --version 1.2.7

Hosted at: [http://node-sinatra-example.heroku.com/](http://node-sinatra-example.heroku.com/)

Source at: [http://github.com/abachman/heroku-sinatra-skeleton](http://github.com/abachman/heroku-sinatra-skeleton)

This is *not* the simplest possible sinatra app. I left enough loose threads
dangling that getting moderately complex sinatra apps up to speed quickly won't
be difficult.

To run the application locally, make sure thin is installed (`gem install
thin`), `cd` into the working directory and run the following command:

    $ thin start -R config.ru

The application should startup at http://0.0.0.0:3000. You can refer to [thin's
documentation](http://code.macournoyer.com/thin/usage/) for more configuration
options.

# Folders

## config/

Right now it's just database configuration. You'll have to make sure postgres is
installed and active on your personal machine for it to run locally.

Because this is a skeleton for me, I want it, if you don't want it, you can safely
delete the whole folder.

## features/

It's safe to ignore the features folder since it's only concerned with testing.

## public/

Static files. Simple enough.

When you're including files from this directory in your html files, you don't
need to preface the path with /public. For example, to include a javascript
source file that's at `public/js/my_source_file.js`, you would say:

    <script src="/js/my_source_file.js"></script>

`public/images/myimg.png` would look like:

    <img src="/images/myimg.png" />

etc.

## views/

These are haml templates. Check out
[http://haml-lang.com/](http://haml-lang.com/) for documentation. Erb would
also work here if the html style is more to your liking.

To get at the templates, pass the view path relative to the views folder to 
the haml method in your `get` block. 

    get '/' do
      haml :index
    end

If you created a folder inside of views and had a file in it (e.g., `views/users/show.haml`), 
it would look like:

    get '/users' do
      haml :"users/show"
    end

That's the colon character in front of a string (symbol with a slash in Ruby).

To render a view inside a layout, pass the layout option in:

    get '/' do
      haml :index, :layout => :'layouts/default'
    end

# Other Files

## application.rb

the source. Define new URL handlers with get or post (delete and put should also work):

    get '/form' do
      %{ <form action="/name" method="post">
            <input name="person" type="text">
            <input type="submit">
         </form> }
    end

(the `%{ }` block returns a string)

For form params, use `:variable` for the field name and get at them with `params[:variable]`:

    post "/name" do
      "Hello #{ params[:person] }"
    end

To add params to paths, use `:whatever` in the url string:

    get "/user/:id" do
      "You're looking for user with id #{ params[:id] }"
    end

---

That should be enough to get you started.
