$(document).ready ->
  form = $('form')
  form.on 'ajax:success', (event, data) ->
    request = data.request
    result = '<p>' + 'ID[' + request.id + ']: ' + new Date(request.created_at).toString('yyyy-MM-dd HH:mm:ss') + '</p>'
    $('#info').append result
    $('textarea').val ''
    #console.log(data);

  form.on 'ajax:error', (event, data) ->
    $('#info').append data
