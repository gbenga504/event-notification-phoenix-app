defmodule NotificationApi.Notifier.Worker do
  use GenServer, restart: :transient

  alias NotificationApi.Event.Hangout
  alias NotificationApi.Account

  @me __MODULE__

  def start_link(%Hangout{} = hangout) do
    GenServer.start_link(@me, hangout)
  end

  def init(%Hangout{} = hangout) do
    Process.send_after(self(), :send_notification, 0)
    {:ok, hangout}
  end

  def handle_info(:send_notification, %Hangout{} = hangout) do
    Account.get_users_for_hangout(hangout.category_id, hangout.country, hangout.state)
    |> Enum.map(&send_notification(&1, hangout))

    {:stop, :normal, nil}
  end

  def send_notification(%{notification_via: "EMAIL", email: email}, hangout) do
    # send notification via email
    NotificationApi.Notifier.Email.hangout_email(email, hangout)
    |> NotificationApi.Notifier.Mailer.deliver_later()
  end

  def send_notification(%{notification_via: "SMS", phone_number: phone_number}, hangout) do
    # send notification via email
    NotificationApi.Notifier.Sms.send_sms(phone_number, hangout.message)
  end

  def send_notification(%{notification_via: "WHATSAPP", phone_number: phone_number}, hangout) do
    # send notification via email
    NotificationApi.Notifier.Whatsapp.send_message(phone_number, hangout.message)
  end
end
