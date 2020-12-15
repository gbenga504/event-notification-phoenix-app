defmodule NotificationApi.Account do
  @moduledoc """
  The Account context.
  """

  import Ecto.Query, warn: false
  alias NotificationApi.Repo

  alias NotificationApi.Account.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  def get_users_for_hangout(category_id, country, state) do
    User
    |> users_category_query(category_id)
    |> users_location_query(country, state)
    |> Repo.all()
  end

  def users_location_query(query, country, state) do
    from u in query,
      where: ^country == u.country and (^state == u.state or is_nil(u.state)),
      select: [:notification_via, :email, :phone_number]
  end

  def users_category_query(query, category_id) do
    from u in query,
      where: ^category_id in u.categories
  end

  def validate_notification_via(
        notification_via,
        email,
        phone_number
      ) do
    notification_via_values = User.get_notification_via_values()

    cond do
      notification_via == notification_via_values.email && not is_nil(email) ->
        {:ok, true}

      notification_via == notification_via_values.sms && not is_nil(phone_number) ->
        {:ok, true}

      notification_via == notification_via_values.whatsapp && not is_nil(phone_number) ->
        {:ok, true}

      true ->
        {:error, :bad_request}
    end
  end
end
