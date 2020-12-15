defmodule NotificationApi.Repo.Migrations.CreateHangouts do
  use Ecto.Migration

  def change do
    create table(:hangouts, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :country, :string
      add :state, :string
      add :message, :text
      add :link, :string
      add :category_id, references(:categories, type: :uuid, on_delete: :nothing)

      timestamps()
    end

    create index(:hangouts, [:category_id])
    create unique_index(:hangouts, [:link])
  end
end
