defmodule NotificationApi.Repo do
  use Ecto.Repo,
    otp_app: :notification_api,
    adapter: Ecto.Adapters.Postgres
end
