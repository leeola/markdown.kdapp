# 
# # App Core
#
# Our core file defines our global `App` object, and any
# settings we want to set.
#
# ## File Order
#
# To understand what this file does, in relation to the rest of the app,
# lets go over the file ordering and globals.
#
# All coffee files that are included in the manifest `files:[]` list, 
# are loaded in a global context. This global context has access to all
# other variables in this global context. With this in mind, we have to
# design our apps to avoid global pollution, but also have important
# objects *(MainView)* accessible from other files.
#
# How you do this is up to you. In this project, i have created an `App`
# object which is global, and holds various instances, references, and
# settings.
#
# Remember though, that these files objects are accessible in order. If
# Core was executed 2nd, then the first file wouldn't have access to
# these global variables. So keep that in mind when defining global
# objects that you intend to share.
#

# Globals
USER      = KD.nick()
HOME      = "/home/#{USER}"

# Define our App Object 
App =
  Core      : {}
  Utilities : {}
  Views     : {}
  Settings  :
    defaultIcon: "https://koding.com/images/default.app.thumb.png"

