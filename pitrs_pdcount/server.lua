ESX = exports["es_extended"]:getSharedObject()

lib.callback.register('pdcount:getPDCount', function(source)
    local players = GetPlayers()
    local jobCounts = {}
    for _, data in pairs(Config.Requirements) do
        for _, jobInfo in pairs(data.jobs) do
            jobCounts[jobInfo.job] = 0
        end
    end

    for _, playerId in pairs(players) do
        local xPlayer = ESX.GetPlayerFromId(tonumber(playerId))
        if xPlayer then
            local job = xPlayer.job.name
            if jobCounts[job] ~= nil then
                jobCounts[job] = jobCounts[job] + 1
            end
        end
    end

    return jobCounts
end)
