defmodule NotificationApi.Pagination do
  import Ecto.Query
  alias NotificationApi.Repo

  @page "1"
  @page_size "10"

  defmodule Struct do
    defstruct data: [],
              meta: %{
                total: 0,
                page: 0,
                total_pages: 0,
                page_size: 0
              }
  end

  def paginate(query, params) do
    page = Map.get(params, "page", @page) |> String.to_integer()
    page_size = Map.get(params, "page_size", @page_size) |> String.to_integer()
    total = get_total(query)

    %NotificationApi.Pagination.Struct{
      data: entries(query, page, page_size),
      meta: %{
        page: page,
        page_size: page_size,
        total: total,
        total_pages: ceil(total / page_size)
      }
    }
  end

  def entries(query, page, page_size) do
    offset = (page - 1) * page_size

    query
    |> offset(^offset)
    |> limit(^page_size)
    |> Repo.all()
  end

  def get_total(query) do
    query
    |> select(count())
    |> Repo.one()
  end
end
