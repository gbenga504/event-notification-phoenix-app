defmodule NotificationApiWeb.HangoutView do
  use NotificationApiWeb, :view
  alias NotificationApiWeb.HangoutView

  def render("index.json", %{hangouts: hangouts}) do
    %{
      status: true,
      message: "Hangouts loaded successfully",
      data: render_many(hangouts.data, HangoutView, "hangout.json"),
      meta: hangouts.meta
    }
  end

  def render("create.json", %{hangout: hangout}) do
    %{
      status: true,
      message: "Hangout created successfully",
      data: render_one(hangout, HangoutView, "hangout.json")
    }
  end

  def render("hangout.json", %{hangout: hangout}) do
    %{
      id: hangout.id,
      country: hangout.country,
      state: hangout.state,
      message: hangout.message,
      link: hangout.link
    }
  end
end
