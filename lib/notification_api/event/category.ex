defmodule NotificationApi.Event.Category do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "categories" do
    field :image_url, :string
    field :name, :string
    field :tagline, :string

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :image_url, :tagline])
    |> validate_required([:name, :image_url, :tagline])
  end
end
