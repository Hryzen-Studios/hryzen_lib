local types = {}

--[[
Character Object (types.character)
{
  identifier = string   -- Unique player identifier (citizenid, identifier, etc.)
  source     = number   -- Server ID of the player
  name       = table    -- { first, last, full }
  job        = table    -- Primary job: { name, label, grade }
  jobs       = table    -- All jobs held, keyed by name: { [jobName] = true }
                         -- Single-job frameworks (QBCore, ESX) populate this with
                         -- just the primary job so job-gating checks stay uniform.
  metadata   = table    -- Character metadata
}
]]
function types.character(data)
    local jobs = data.jobs or {}
    if data.jobName then
        jobs[data.jobName] = true
    end

    return {
        identifier = data.identifier,
        source = tonumber(data.source),
        name = {
            first = data.firstname,
            last = data.lastname,
            full = (data.firstname or '') .. ' ' .. (data.lastname or ''),
        },
        job = {
            name = data.jobName,
            label = data.jobLabel,
            grade = data.jobGrade,
        },
        jobs = jobs,
        metadata = data.metadata,
    }
end

return types
