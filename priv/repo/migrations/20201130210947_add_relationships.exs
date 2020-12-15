defmodule NotificationApi.Repo.Migrations.AddRelationships do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:email])
    create unique_index(:users, [:phone_number])
    create unique_index(:categories, [:name])
  end
end
