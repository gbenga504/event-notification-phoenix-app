defmodule NotificationApi.EventTest do
  use NotificationApi.DataCase

  alias NotificationApi.Event

  describe "categories" do
    alias NotificationApi.Event.Category

    @valid_attrs %{image_url: "some image_url", name: "some name", tagline: "some tagline"}
    @update_attrs %{image_url: "some updated image_url", name: "some updated name", tagline: "some updated tagline"}
    @invalid_attrs %{image_url: nil, name: nil, tagline: nil}

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Event.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Event.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Event.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Event.create_category(@valid_attrs)
      assert category.image_url == "some image_url"
      assert category.name == "some name"
      assert category.tagline == "some tagline"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Event.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = Event.update_category(category, @update_attrs)
      assert category.image_url == "some updated image_url"
      assert category.name == "some updated name"
      assert category.tagline == "some updated tagline"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Event.update_category(category, @invalid_attrs)
      assert category == Event.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Event.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Event.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Event.change_category(category)
    end
  end

  describe "hangouts" do
    alias NotificationApi.Event.Hangout

    @valid_attrs %{country: "some country", link: "some link", message: "some message", state: "some state"}
    @update_attrs %{country: "some updated country", link: "some updated link", message: "some updated message", state: "some updated state"}
    @invalid_attrs %{country: nil, link: nil, message: nil, state: nil}

    def hangout_fixture(attrs \\ %{}) do
      {:ok, hangout} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Event.create_hangout()

      hangout
    end

    test "list_hangouts/0 returns all hangouts" do
      hangout = hangout_fixture()
      assert Event.list_hangouts() == [hangout]
    end

    test "get_hangout!/1 returns the hangout with given id" do
      hangout = hangout_fixture()
      assert Event.get_hangout!(hangout.id) == hangout
    end

    test "create_hangout/1 with valid data creates a hangout" do
      assert {:ok, %Hangout{} = hangout} = Event.create_hangout(@valid_attrs)
      assert hangout.country == "some country"
      assert hangout.link == "some link"
      assert hangout.message == "some message"
      assert hangout.state == "some state"
    end

    test "create_hangout/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Event.create_hangout(@invalid_attrs)
    end

    test "update_hangout/2 with valid data updates the hangout" do
      hangout = hangout_fixture()
      assert {:ok, %Hangout{} = hangout} = Event.update_hangout(hangout, @update_attrs)
      assert hangout.country == "some updated country"
      assert hangout.link == "some updated link"
      assert hangout.message == "some updated message"
      assert hangout.state == "some updated state"
    end

    test "update_hangout/2 with invalid data returns error changeset" do
      hangout = hangout_fixture()
      assert {:error, %Ecto.Changeset{}} = Event.update_hangout(hangout, @invalid_attrs)
      assert hangout == Event.get_hangout!(hangout.id)
    end

    test "delete_hangout/1 deletes the hangout" do
      hangout = hangout_fixture()
      assert {:ok, %Hangout{}} = Event.delete_hangout(hangout)
      assert_raise Ecto.NoResultsError, fn -> Event.get_hangout!(hangout.id) end
    end

    test "change_hangout/1 returns a hangout changeset" do
      hangout = hangout_fixture()
      assert %Ecto.Changeset{} = Event.change_hangout(hangout)
    end
  end
end
