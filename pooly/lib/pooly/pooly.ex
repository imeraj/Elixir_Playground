defmodule Pooly do
	@moduledoc false

	use Application

	def start(_type, _args) do
		pool_config = [mfa: {Pooly.Worker, :start_link, []}, size: 5]
		start_pool(pool_config)
	end

	def start_pool(pool_config) do
		Pooly.Supervisor.start_link(pool_config)
	end
end
