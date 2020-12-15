defmodule NotificationApi.Notifier.WorkerSupervisor do
  use DynamicSupervisor
  alias NotificationApi.Event.Hangout

  @me __MODULE__
  def start_link(_) do
    DynamicSupervisor.start_link(@me, :no_args, name: @me)
  end

  def add(%Hangout{} = hangout) do
    spec = {NotificationApi.Notifier.Worker, hangout}
    {:ok, _pid} = DynamicSupervisor.start_child(@me, spec)
  end

  def init(_) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end
end
