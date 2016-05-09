Code.require_file("#{__DIR__}/phoenix_helper.exs")

ESpec.start

ESpec.configure fn(config) ->
  config.before fn ->
  end

  config.finally fn(_shared) ->
    :ok
  end
end
