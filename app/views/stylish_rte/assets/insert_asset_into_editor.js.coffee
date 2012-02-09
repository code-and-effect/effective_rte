$("#<%= @htmlarea %>").htmlarea('pasteHTML', "<%= escape_javascript(link_to @asset.data.identifier, @asset.data.url) %>");
