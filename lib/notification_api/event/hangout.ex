defmodule NotificationApi.Event.Hangout do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "hangouts" do
    field :country, :string
    field :link, :string
    field :message, :string
    field :state, :string
    belongs_to :category, NotificationApi.Event.Category

    timestamps()
  end

  @doc false
  def changeset(hangout, attrs) do
    hangout
    |> cast(attrs, [:country, :state, :message, :link, :category_id])
    |> validate_required([:country, :state, :message, :link, :category_id])
    |> unique_constraint(:link)
    |> validate_length(:message, min: 3, max: 150)
    |> assoc_constraint(:category)
  end
end
