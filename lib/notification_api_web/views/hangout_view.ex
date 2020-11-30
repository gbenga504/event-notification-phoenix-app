defmodule NotificationApiWeb.HangoutView do
  use NotificationApiWeb, :view
  alias NotificationApiWeb.HangoutView

  def render("index.json", %{hangouts: hangouts}) do
    %{data: render_many(hangouts, HangoutView, "hangout.json")}
  end

  def render("show.json", %{hangout: hangout}) do
    %{data: render_one(hangout, HangoutView, "hangout.json")}
  end

  def render("hangout.json", %{hangout: hangout}) do
    %{id: hangout.id,
      country: hangout.country,
      state: hangout.state,
      message: hangout.message,
      link: hangout.link}
  end
end
