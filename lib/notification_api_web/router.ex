defmodule NotificationApiWeb.Router do
  use NotificationApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", NotificationApiWeb do
    pipe_through :api

    resources "/users", UserController, only: [:index, :create]
    resources "/categories", CategoryController, only: [:index, :create, :show]
    resources "/hangouts", HangoutController, only: [:index, :show, :create]
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: NotificationApiWeb.Telemetry
    end
  end
end
