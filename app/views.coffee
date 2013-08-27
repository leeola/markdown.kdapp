# 
# # App Views
#
# This is our Views Definition.
#
# Views are Kodings way of programatically modifying your DOM. Remember that
# Koding Apps are just WebApps, built with a framework to allow tight
# integration to your VM. The entire app runs in the clients browser as
# javascript, html, and css, just like any webapp.
#
{Views}     = App
{
  notify
  render_md
}           = Installer.Utilities



# # Base View
#
# Our base view is a plain base view. Not really needed in this
# simple example, but it's here incase we want to add something
# globally to all of our views.
#
# It inherits from JView, which is a type of KD View which provides
# us with the `pastachio` method. This method allows us to return a
# string of Pastachio Template, which will be compiled into HTML and
# easily inject our views.
class Views.BaseView extends JView
  constructor: -> super


# # MainView
#
# Our MainView is the view we put into the tab itself. It is added to
# the tab, or `appView`, in the `index.coffee` file.
#
# In this view we are adding a vertical split, and a view to each split.
# One view, is the Ace view we loaded earlier *(in `index.coffee`)*,
# the other view is a view to inject html. This html is compiled from
# the markdown loaded into the Ace editor.
class Views.MainView extends BaseView
  constructor: (options={}, data)->
    options.cssClass ?= "installer-container"
    super options, data


