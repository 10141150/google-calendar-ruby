class SistemaController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  
def event_insert
@key = params[:txt_key];
@path_key = params[:txt_path_key];
@cuenta_developper = params[:txt_cuenta_developper];
@calendar_id = params[:txt_calendar_id];
@time_min = params[:txt_time_min];
@time_max = params[:txt_time_max];
@location = params[:txt_location];
@summary = params[:txt_summary];

@client = Google::APIClient.new(:key => @key)
path_to_key_file = @path_key
passphrase = 'notasecret'
key = Google::APIClient::PKCS12.load_key(path_to_key_file, passphrase)
asserter = Google::APIClient::JWTAsserter.new(
        @cuenta_developper,
        'https://www.googleapis.com/auth/calendar',
        key)
# To request an access token, call authorize:
@client.authorization = asserter.authorize()

calendar = @client.discovered_api('calendar', 'v3')

event = {
  'summary' => @summary,
  'location' => @location,
  'start' => {
      'dateTime' => @time_min
   },
   'end' => {
      'dateTime' => @time_max
    },
    'attendees' => [
        {
          'email' => 'java4ever.sys@gmail.com'
        },
        #...
      ]
   }

result = @client.execute!(:api_method => calendar.events.insert,
                            :parameters => {calendarId: @calendar_id},
                            :body => JSON.dump(event),
                            :headers => {'Content-Type' => 'application/json'})
end


def event_update
@key = params[:txt_key];
@path_key = params[:txt_path_key];
@cuenta_developper = params[:txt_cuenta_developper];
@calendar_id = params[:txt_calendar_id];
@time_min = params[:txt_time_min];
@time_max = params[:txt_time_max];
@location = params[:txt_location];
@summary = params[:txt_summary];
@event_id = params[:txt_event_id];

@client = Google::APIClient.new(:key => @key)
path_to_key_file = @path_key
passphrase = 'notasecret'
key = Google::APIClient::PKCS12.load_key(path_to_key_file, passphrase)
asserter = Google::APIClient::JWTAsserter.new(
        @cuenta_developper,
        'https://www.googleapis.com/auth/calendar',
        key)
# To request an access token, call authorize:
@client.authorization = asserter.authorize()

calendar = @client.discovered_api('calendar', 'v3')

event = {
  'summary' => @summary,
  'location' => @location,
  'start' => {
      'dateTime' => @time_min
   },
   'end' => {
      'dateTime' => @time_max
    },
    'attendees' => [
        {
          'email' => 'java4ever.sys@gmail.com'
        },
        #...
      ]
   }

result = @client.execute!(:api_method => calendar.events.update,
                            :parameters => {calendarId: @calendar_id,
											eventId: @event_id},
                            :body => JSON.dump(event),
                            :headers => {'Content-Type' => 'application/json'})
end


def event_delete
@key = params[:txt_key];
@path_key = params[:txt_path_key];
@cuenta_developper = params[:txt_cuenta_developper];
@calendar_id = params[:txt_calendar_id];
@event_id = params[:txt_event_id];

@client = Google::APIClient.new(:key => @key)
path_to_key_file = @path_key
passphrase = 'notasecret'
key = Google::APIClient::PKCS12.load_key(path_to_key_file, passphrase)
asserter = Google::APIClient::JWTAsserter.new(
        @cuenta_developper,
        'https://www.googleapis.com/auth/calendar',
        key)
# To request an access token, call authorize:
@client.authorization = asserter.authorize()

calendar = @client.discovered_api('calendar', 'v3')

result = @client.execute!(:api_method => calendar.events.delete,
                            :parameters => {calendarId: @calendar_id,
											eventId: @event_id})
end



def calendars_list
@key = params[:txt_key];
@path_key = params[:txt_path_key];
@cuenta_developper = params[:txt_cuenta_developper];

 @client = Google::APIClient.new(:key => @key)
path_to_key_file = @path_key
passphrase = 'notasecret'
key = Google::APIClient::PKCS12.load_key(path_to_key_file, passphrase)
asserter = Google::APIClient::JWTAsserter.new(
        @cuenta_developper,
        'https://www.googleapis.com/auth/calendar',
        key)
# To request an access token, call authorize:
@client.authorization = asserter.authorize()

calendar = @client.discovered_api('calendar', 'v3')

result = @client.execute(
  :api_method => calendar.calendar_list.list,
  :parameters => {calendarId: 'java4ever.sys@gmail.com'},
  :headers => {'Content-Type' => 'application/json'})

@items = result.data.items
					
  
end


def events_list
@key = params[:txt_key];
@path_key = params[:txt_path_key];
@cuenta_developper = params[:txt_cuenta_developper];
@calendar_id = params[:txt_calendar_id];
@time_min = params[:txt_time_min];
@time_max = params[:txt_time_max];


@client = Google::APIClient.new(:key => @key)
path_to_key_file = @path_key
passphrase = 'notasecret'
key = Google::APIClient::PKCS12.load_key(path_to_key_file, passphrase)
asserter = Google::APIClient::JWTAsserter.new(
        @cuenta_developper,
        'https://www.googleapis.com/auth/calendar',
        key)
# To request an access token, call authorize:
@client.authorization = asserter.authorize()

calendar = @client.discovered_api('calendar', 'v3')

result = @client.execute(:api_method => calendar.events.list,
                        :parameters => {calendarId: @calendar_id,
										timeMin: @time_min,
										timeMax: @time_max})
						
@items = result.data.items
		
end
  
  def listar_calendarios
  end

  def listar_eventos
  end  
  
  def actualizar_evento
  end 
  
  def insertar_evento
  end 
  
  def eliminar_evento
  end 

end
