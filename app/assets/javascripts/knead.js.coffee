#= require 'knead/modal'

class KneadWidget
  constructor: ->
    @name = ""
    @userId = ""

    if window._kneadUser
      @name = window._kneadUser['name']
      @userId = window._kneadUser['id']

    this.render()

  render: ->
    @el = $('<div id="knead-widget" />')
    @a = $('<a href="#" class="knead-toggle" />').html('Feedback')
    @el.append(@a)
    $('body').append(@el)
    @a.on 'click', (event) => this.toggle(event)

  renderModal: ->
    @modal = $('<div id="knead-modal" style="display:none;" />')
    @modal.html(JST["knead/modal"](name: @name))

    $('body').append(@modal)

    @modal.find('#knead-cancel-link').on 'click', (event) => this.toggle(event)
    @modal.find('form').on 'submit', (event) => this.submitBug(event)

  submitBug: (event) ->
    name = @modal.find('#knead-bug-name').val()
    msg = @modal.find('#knead-bug-message').val()

    if jQuery.trim(msg.toString()) is ''
      alert 'Please enter a message to continue.'
      @modal.find('#knead-bug-message').get(0).focus()
    else
      @a.html('Feedback sent. Thanks!')
      this.toggle()

      $.ajax
        url: '/_bugs'
        dataType: 'json'
        type: 'POST'
        data:
          'bug[user_id]':       @userId
          'bug[name]':          name
          'bug[message]':       msg
          'bug[user_agent]':    navigator.userAgent
          'bug[url]':           location.href

    event.preventDefault()

  toggle: (event) ->
    unless @modal
      this.renderModal()

    if @modal.is(':visible')
      @modal.hide()
      @el.show()
    else
      @modal.show().find('.knead-input').get(0).focus()
      @el.hide()

    event.preventDefault() if event

if typeof jQuery is 'function'
  jQuery ->
    new KneadWidget()