defmodule NotificationApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :email, :string
      add :phone_number, :string
      add :notification_via, :string
      add :country, :string
      add :state, :string

      timestamps()
    end

  end
end
