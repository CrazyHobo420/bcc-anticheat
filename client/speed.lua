if Config.Speed.active then
	local Users = {}

	RegisterServerEvent("ac:spdr")
	AddEventHandler("ac:spdr", function()
		local _source = source
		local t = os.time()
		if Users[_source] then
			local t = t
			if (t - Users[_source].time) < 15 then
				HandleAntiCheatAction(_source, Config.Speed, Config.Speed.lang.reason)
			else
				Users[_source].time = t
			end
		else
			Users[_source] = {time = t}
		end
	end)
end

