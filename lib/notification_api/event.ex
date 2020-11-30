defmodule NotificationApi.Event do
  @moduledoc """
  The Event context.
  """

  import Ecto.Query, warn: false
  alias NotificationApi.Repo

  alias NotificationApi.Event.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{data: %Category{}}

  """
  def change_category(%Category{} = category, attrs \\ %{}) do
    Category.changeset(category, attrs)
  end

  alias NotificationApi.Event.Hangout

  @doc """
  Returns the list of hangouts.

  ## Examples

      iex> list_hangouts()
      [%Hangout{}, ...]

  """
  def list_hangouts do
    Repo.all(Hangout)
  end

  @doc """
  Gets a single hangout.

  Raises `Ecto.NoResultsError` if the Hangout does not exist.

  ## Examples

      iex> get_hangout!(123)
      %Hangout{}

      iex> get_hangout!(456)
      ** (Ecto.NoResultsError)

  """
  def get_hangout!(id), do: Repo.get!(Hangout, id)

  @doc """
  Creates a hangout.

  ## Examples

      iex> create_hangout(%{field: value})
      {:ok, %Hangout{}}

      iex> create_hangout(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_hangout(attrs \\ %{}) do
    %Hangout{}
    |> Hangout.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a hangout.

  ## Examples

      iex> update_hangout(hangout, %{field: new_value})
      {:ok, %Hangout{}}

      iex> update_hangout(hangout, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_hangout(%Hangout{} = hangout, attrs) do
    hangout
    |> Hangout.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a hangout.

  ## Examples

      iex> delete_hangout(hangout)
      {:ok, %Hangout{}}

      iex> delete_hangout(hangout)
      {:error, %Ecto.Changeset{}}

  """
  def delete_hangout(%Hangout{} = hangout) do
    Repo.delete(hangout)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking hangout changes.

  ## Examples

      iex> change_hangout(hangout)
      %Ecto.Changeset{data: %Hangout{}}

  """
  def change_hangout(%Hangout{} = hangout, attrs \\ %{}) do
    Hangout.changeset(hangout, attrs)
  end
end
