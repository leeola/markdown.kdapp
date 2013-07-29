{Settings}  = Installer
{Recipe}    = Installer.Core

class AppInstaller extends Recipe

  # Chose a name for your install recipe.
  name: "Markdown"
  icon: "http://#{USER}.kd.io/.applications/markdown/resources/icon.128.png" # Settings.defaultIcon
  desc: """
        Installer Description will be here.
        """
  path: "#{HOME}/Applications/markdown.kdapp"
  
  ###
  Your installation recipe.
  ###
  install: (terminal)->
    terminal.open()
    terminal.runCommand "clear; cd #{@path}; cd recipe; make;"
    # You can use KD Framework here.
  
  ###
  Your application's shell manage recipe. (e.g. "mysql -s" for MySQL, or "python manage.py shell" for Django applications.)
  ###
  shell: (terminal)->
    terminal.open()
    terminal.runCommand "clear; markdown"
  
  ###
  The web view of the manage. Can be used for different cases.
  ###
  manage: ->
    appManager.open "Viewer", ->
      appManager.getFrontApp().open "http://#{USER}.kd.io/.applications/markdown/resources/manager"