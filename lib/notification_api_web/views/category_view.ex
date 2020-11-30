defmodule NotificationApiWeb.CategoryView do
  use NotificationApiWeb, :view
  alias NotificationApiWeb.CategoryView

  def render("index.json", %{categories: categories}) do
    %{
      status: true,
      message: "Categories loaded successfully",
      data: render_many(categories, CategoryView, "category.json")
    }
  end

  def render("show.json", %{category: category}) do
    %{
      status: true,
      message: "Category loaded successfully",
      data: render_one(category, CategoryView, "category.json")
    }
  end

  def render("category.json", %{category: category}) do
    %{
      id: category.id,
      name: category.name,
      image_url: category.image_url,
      tagline: category.tagline
    }
  end
end
