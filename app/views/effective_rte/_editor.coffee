$('#<%= dom_id %>').wymeditor({<%= raw opts.to_json[1..-2] %>, postInit: (wym) ->
  wymInsertAssets = wym.insert_assets({"dialog_url" : "/admin/assets"})
  wymInsertAssets.init(wym)
})
