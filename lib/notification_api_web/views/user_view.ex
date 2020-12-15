defmodule NotificationApiWeb.UserView do
  use NotificationApiWeb, :view
  alias NotificationApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{
      status: true,
      message: "Users loaded successfully",
      data: render_many(users, UserView, "user.json")
    }
  end

  def render("show.json", %{user: user}) do
    %{
      status: true,
      message: "User loaded successfully",
      data: render_one(user, UserView, "user.json")
    }
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      phone_number: user.phone_number,
      notification_via: user.notification_via,
      country: user.country,
      state: user.state
    }
  end
end
