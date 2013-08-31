# 
# # Easy Compile
#
# Easy compile is an experimental View which will allow for easy
# easy previewing of your app during Development.
#
# It should be removed for production.
# 




# A few global vars to make sense of the world.
# !CRAPPY CODE WARNING! For the time being, these "variables" are hard coded.
DEBUG       = true
APP_NAME    = 'markdown.kdapp'
VM_NAME     = 'vm-0.leeolayvar.koding.kd.io'
APP_DIR     = "~/Applications/#{APP_NAME}"



# ## Easy Compile
#
# Our Easy Compile view should be added *first*. It will add a header
# to the top with debugging options, as well as enable for fast compile
# and refresh.
class EasyCompile extends KDView
  constructor: (options={}, data) ->
    # ### Option: Auto Disable
    # Currently Meaningless.
    # Autodisable will automatically disable this view if no detectable
    # debug mode can be found. Meaning that it can be used in production.
    # This may be removed if it is found to be unreliable.
    options.autoDisable ?= true
    
    # Recursive Kill
    if __easycompile_running is true
      return

    # Call Super, Always.
    super

    # Create our FSHelper for our index.js file.
    # !CRAPPY CODE! We have hardcoded this with default vm, and app name. This
    # needs to change.
    fshelper_path = "[#{VM_NAME}]#{APP_DIR}/index.js"
    @indexjsHelper = FSHelper.createFileFromPath fshelper_path

    headerView = new KDHeaderView
      title     : 'Easy Compile Enabled'

    refreshBtnView = new KDButtonView
      title     : 'Compile and Preview'
      callback  : =>
        @compileApp => @previewApp -> new KDNotification title: 'Success!'


    splitView = new KDSplitView
      type      : 'vertical'
      resizable : false
      sizes     : ['30%', '40%', '30%']
      views     : [headerView, null, refreshBtnView]

    @previewView = new KDView()

    @addSubView splitView
    @addSubView @previewView
    
    # Let the hacks begin.
    _appView = window.appView
    window.appView = @previewView

    __easycompile_running = true


  # ### Compile App
  #
  compileApp: (callback) ->
    new KDNotificationView
      title: 'Compiling...'

    KD.singletons.vmController.run
      vmName    : VM_NAME
      withArgs  : "kdc #{APP_DIR}"
      (err, res) ->
        # Currently ignoring the response of kdc.
        callback err


  # ### Preview
  #
  previewApp: ->
    new KDNotificationView
      title: 'Loading preview...'

    @indexjsHelper.fetchContents (err, res) =>
      if err? then new KDNotificationView title: err.message
      console.log 'Fetched! '+ res?.length

      # By destroying the subviews, we ensure (or try to) that the newly
      # compiled code is applied to a fresh view.
      @previewView.destroySubViews()
      
      # We're just using a simple eval on the loaded JS code, 
      # this may be a bit unsafe, but it should be this clients
      # code anyway.
      eval res





