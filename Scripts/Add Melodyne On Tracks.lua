-- @description JohnBentzen - Add Melodyne
-- @version 1.0
-- @author John Bentzen
-- @about Add Melodyne to selected tracks.
-- @provides
-- .

local PLUGIN_NAME = "VST3:Melodyne"

local selected_tracks = reaper.CountSelectedTracks(0)

if selected_tracks == 0 then
    reaper.ShowMessageBox(
        "No tracks selected.",
        "Add Melodyne",
        0
    )
    return
end

reaper.Undo_BeginBlock()

for i = 0, selected_tracks - 1 do
    local track = reaper.GetSelectedTrack(0, i)

    if track then
        reaper.TrackFX_AddByName(
            track,
            PLUGIN_NAME,
            false,
            -1
        )
    end
end

reaper.Undo_EndBlock(
    "Add Melodyne VST3 to selected tracks",
    -1
)

reaper.UpdateArrange()