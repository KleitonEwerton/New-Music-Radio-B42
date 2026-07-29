if not TCMusic then TCMusic = {} end
if (GlobalMusic == nil) then GlobalMusic = {} end
if not NMMusic then NMMusic = {} end

if not NMMusic.buildUnifiedMusicKeys then
    NMMusic.buildUnifiedMusicKeys = function()
        local keys = {}
        if NMTrackCatalog and NMTrackCatalog.entries then
            for k, _ in pairs(NMTrackCatalog.entries) do
                table.insert(keys, k)
            end
        end
        return keys
    end
end