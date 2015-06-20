def calendars
  google_api_client = Google::APIClient.new({
    application_name: 'Example Ruby application',
    application_version: '1.0.0'
  })

  google_api_client.authorization = Signet::OAuth2::Client.new({
    client_id: ENV.fetch('GOOGLE_API_CLIENT_ID'),
    client_secret: ENV.fetch('GOOGLE_API_CLIENT_SECRET'),
    access_token: session[:access_token]
  })

  google_calendar_api = google_api_client.discovered_api('calendar', 'v3')
  
  holi :3

  response = google_api_client.execute({
    api_method: google_calendar_api.calendar_list.list,
    parameters: {}
  })

  @items = response.data['items']
end
