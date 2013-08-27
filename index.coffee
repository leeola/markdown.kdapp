# 
# # App Index
#
# The App Index is our *main* file. This is entirely a personal
# convention, but it makes sense since our entire app compiles down into
# `index.js`, which is the actual file that is run.
#
# So, for convention, we will run our App from this file. All logic
# is being put into `./app`, but again this is entirely personal convention.
#
# Remember that all of the files, including this one, that are defined
# in your `manifest.json` file are included in some type of global scope.
# For a larger example of this, see `./app/core.coffee`.

# Our App variable is global, defined in `./app/core.coffee`
{MainView} = App.Views

# `do ->` calls the function with the global variables in a closure,
# creating a new scope and ensuring nothing leaks, namely our view
# instance.
do ->
  # Our MainView instance, which is assigned in `./app/views.coffee`.
  main_view = new MainView()
  
  # Now assign it to appView.
  #
  # As far as i can tell appView is the view instance of the tab for your
  # app. Assigning your mainview to it, allows your app to be a subview
  # of the tab view, and thus, allowing your app to exist.
  appView.addSubView main_view
