# 
# # Utilities
#
# Our utilities module defines an external Markdown compiler that we have,
# as well as any other utilities we might want.
#
{Utilities} = App



# # Notify
#
# Not entirely sure about this yet, usage of notify is unknown.
Utilities.notify = (message)->
  new KDNotificationView
    title: message


# # Render Markdown
#
# Take a string of markdown, and render it.
Utilities.render_md = (markdown) ->
  console.log 'Markdown not loaded.'
  markdown

