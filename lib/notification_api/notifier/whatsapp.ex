defmodule NotificationApi.Notifier.Whatsapp do
  import NotificationApi.Notifier.TwilioMessenger

  def send_message(to, body) do
    request_url()
    |> HTTPoison.post!(sms(to, body), headers())
    |> process_response_body()
  end

  defp sms(to, body) do
    {:form, [To: "whatsapp:#{to}", From: "whatsapp:+14155238886", Body: body]}
  end
end
