$(document).ready ->
  setCookie('request_counter', 0)
  build_counter()

  form = $('form')
  form.on 'ajax:success', (event, data) ->
    request = data.request
    result = '<p>' + 'ID[' + request.id + ']: ' + new Date(request.created_at).toString('yyyy-MM-dd HH:mm:ss') + '</p>'
    $('.request-info').append result
    $('input[type=text]').val('')
    #console.log(data);

  form.on 'ajax:error', (data, errorThrown) ->
    result = '<p>' + errorThrown.responseJSON.error + '</p>'
    $('.request-info').append result

  form.on 'ajax:complete', (event, data) ->
    counter = increase_counter()
    show_counter counter


build_counter = ->
  c = getCookie('request_counter')
  if (c == undefined)
    setCookie('request_counter', 0)
    build_counter()
  show_counter c


increase_counter = ->
  c = parseInt(getCookie('request_counter'))
  c += 1
  setCookie('request_counter', c)
  c

show_counter = (c) ->
  res = c + " " + declOfNum(c, ['запись', 'записи', 'записей'])
  $('.counter').html(res)


getCookie = (name) ->
  matches = document.cookie.match(new RegExp('(?:^|; )' + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + '=([^;]*)'))
  if matches then decodeURIComponent(matches[1]) else undefined

setCookie = (name, value, options = {}) ->
  options = path: '/'
  if options.expires instanceof Date
    options.expires = options.expires.toUTCString()
  updatedCookie = encodeURIComponent(name) + '=' + encodeURIComponent(value)
  for optionKey of options
    updatedCookie += '; ' + optionKey
    optionValue = options[optionKey]
    if optionValue != true
      updatedCookie += '=' + optionValue
  document.cookie = updatedCookie

declOfNum = (n, titles) ->
  titles[if n % 10 == 1 and n % 100 != 11 then 0 else if n % 10 >= 2 and n % 10 <= 4 and (n % 100 < 10 or n % 100 >= 20) then 1 else 2]

