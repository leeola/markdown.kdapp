# 
# # Markdown App Index
#
# This file is the main file run by the KD Framework.
# As far as i can tell, the KDFramework is exposed globally, as well
# as various instances *(like `appView`)*.
#
# Your entire app can be here, or spreadout to all of the files
# included in the files:[] definition in your manifest file.
#
{Recipe}    = Installer.Core
{notify}    = Installer.Utilities
{MainView}  = Installer.Views

do ->
  try
    appView.addSubView new MainView
  catch error
    # KD.enableLogs()
    console.log error
    notify error
