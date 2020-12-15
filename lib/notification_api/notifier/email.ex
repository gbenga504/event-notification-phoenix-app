defmodule NotificationApi.Notifier.Email do
  use Bamboo.Phoenix, view: NotificationApiWeb.EmailView

  def hangout_email(email, hangout) do
    base_email()
    |> to(email)
    |> subject("Hangout notification")
    |> assign(:hangout, hangout)
    |> render("notify-user.html")
  end

  def base_email do
    new_email()
    |> from({"Hangout Buddy", "hangoutBuddy@mailinator.com"})
    |> put_html_layout({NotificationApiWeb.LayoutView, "email.html"})
  end
end
