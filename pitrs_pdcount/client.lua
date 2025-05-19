ESX = exports["es_extended"]:getSharedObject()


RegisterCommand('pdcount', function()
    lib.callback('pdcount:getPDCount', false, function(jobCounts)
        local options = {}

        for _, data in ipairs(Config.Requirements) do
            local enough = false

            for _, jobInfo in ipairs(data.jobs) do
                local count = jobCounts[jobInfo.job] or 0
                if count >= jobInfo.count then
                    enough = true
                    break
                end
            end

            local icon = enough and '🟢' or '🔴'
            local label = icon .. ' | ' .. data.name

            table.insert(options, {
                title = label,
                disabled = true
            })
        end

        lib.registerContext({
            id = 'pdcount_menu',
            title = 'PD COUNT',
            options = options
        })

        lib.showContext('pdcount_menu')
    end)
end)

