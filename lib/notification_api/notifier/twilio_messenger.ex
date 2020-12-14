defmodule NotificationApi.Notifier.TwilioMessenger do
  @endpoint "https://api.twilio.com/2010-04-01/Accounts/"

  def process_response_body(%HTTPoison.Response{body: body}) do
    Jason.decode!(body, keys: :atoms)
  end

  def request_url do
    sid = Application.get_env(:notification_api, :sid)

    "#{@endpoint}#{sid}/Messages.json"
  end

  def headers do
    sid = Application.get_env(:notification_api, :sid)
    token = Application.get_env(:notification_api, :token)

    encoded_token = Base.encode64("#{sid}:#{token}")

    [
      {"Content-Type", "application/x-www-form-urlencoded"},
      {"Authorization", "Basic " <> encoded_token}
    ]
  end
end
