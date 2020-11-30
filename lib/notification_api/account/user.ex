defmodule NotificationApi.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "users" do
    field :country, :string
    field :email, :string
    field :notification_via, :string
    field :phone_number, :string
    field :state, :string

    timestamps()
  end

  def get_notification_via_values do
    %{email: "EMAIL", sms: "SMS", whatsapp: "WHATSAPP"}
  end

  @doc false
  def changeset(user, attrs) do
    notification_via_values = get_notification_via_values()

    user
    |> cast(attrs, [:email, :phone_number, :notification_via, :country, :state])
    |> validate_required([:notification_via, :country])
    |> validate_inclusion(:notification_via, [notification_via_values.email, notification_via_values.sms, notification_via_values.whatsapp])
  end
end
