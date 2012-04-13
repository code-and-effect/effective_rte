/*
    * WYMeditor : what you see is What You Mean web-based editor
    * Copyright (c) 2005 - 2009 Jean-Francois Hovinne, http://www.wymeditor.org/
    * Dual licensed under the MIT (MIT-license.txt)
    * and GPL (GPL-license.txt) licenses.
    *
    * For further information visit:
    *        http://www.wymeditor.org/
    *
    * File Name:
    *        jquery.wymeditor.insert_assets.js
    *        HTML Tidy plugin for WYMeditor
    *
    * File Authors:
    *   Matt Riemer, Code and Effect Inc.
    */

//WymTidy constructor
function WymInsertAssets(options, wym) {
  var btn_url = wym._options.basePath + "plugins/insert_assets/insert_assets.png";

  options = $.extend({
    sUrl: wym._options.basePath + "plugins/insert_assets/insert_assets.php",
    sButtonHtml: "" +
      "<li class='wym_tools_insert_asset'>" +
        "<a name='InsertAsset' href='#'style='background-image: url(" + btn_url +")'>Insert an Asset</a>" +
      "</li>",

    sButtonSelector: "li.wym_tools_insert_asset a"

  }, options);

  this._options = options;
  this._wym = wym;
}

WYMeditor.editor.prototype.insert_assets = function(options) {
  return new WymInsertAssets(options, this);
};

WymInsertAssets.prototype.init = function() {
  var insert_assets = this;

  $(this._wym._box)
    .find(this._wym._options.toolsSelector + this._wym._options.toolsListSelector)
    .append(this._options.sButtonHtml);

  $(this._wym._box).find(this._options.sButtonSelector).click(function() {
    insert_assets.insert_assets();
    return(false);
  });
};

WymInsertAssets.prototype.insert_assets = function() {
  var wym = this._wym

  var dialog_frame = $(
    "<div title='Insert Asset'>" +
      "<iframe id='wym_insert_asset_iframe' src='" + this._options.dialog_url + "' width='100%' height='100%' marginWidth='0' marginHeight='0' frameBorder='0' scrolling='auto' title='Insert Asset'></iframe>" +
    "</div>");

  window_height = ($(window).height() * 0.85);

  dialog_frame.dialog({
    modal: true,
    height: window_height, // if we pass 85% the modal window will render with height: 0
    width: "85%",
    close: function(event, ui) { $(this).remove(); },
    buttons: {
      Close: function() { $(this).dialog("close"); }
    }
  });

  $('#wym_insert_asset_iframe', dialog_frame).on('load', function() {
    $(this).contents().find('a.asset-insertable').on("click",
      function(event) { wym._exec(WYMeditor.INSERT_IMAGE, $(this).data("asset"));
      $(this).effect("highlight", { color: "#000000"}, 1000);
      event.preventDefault();
    });
  });
};
