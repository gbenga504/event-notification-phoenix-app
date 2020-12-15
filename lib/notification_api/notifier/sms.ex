defmodule NotificationApi.Notifier.Sms do
  import NotificationApi.Notifier.TwilioMessenger

  def send_sms(to, body) do
    request_url()
    |> HTTPoison.post!(sms(to, body), headers())
    |> process_response_body()
  end

  defp sms(to, body) do
    {:form, [To: to, From: "+15014042630", Body: body]}
  end
end
