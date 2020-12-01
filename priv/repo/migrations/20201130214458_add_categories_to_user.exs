defmodule NotificationApi.Repo.Migrations.AddCategoriesToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :categories,  {:array, :uuid}
    end
  end
end
