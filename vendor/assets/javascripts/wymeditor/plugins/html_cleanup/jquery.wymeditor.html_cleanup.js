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
    *        jquery.wymeditor.html_cleanup.js
    *
    * File Authors:
    *   Matt Riemer, Code and Effect Inc.
    */

//WymHtmlCleanup constructor
function WymHtmlCleanup(options, wym) {
    options = jQuery.extend({}, options);
    this._options = options;
    this._wym = wym;
}

//Extend WYMeditor
WYMeditor.editor.prototype.html_cleanup = function(options) {
    return new WymHtmlCleanup(options, this);
};

WymHtmlCleanup.prototype.init = function() {
    var html_cleanup = this;

    // Override the default toggleHtml action
    WYMeditor.editor.prototype.toggleHtml = function () {
        if(jQuery(this._box).find('.wym_iframe').is(':hidden') == false) {
            var wym = this._wym;
            var html = wym.xhtml();
            var cleanedHtml = $.htmlClean(html, {format:true, bodyOnly:false});
            wym.html(cleanedHtml);
            wym.update();
        }
        jQuery(this._box).find(this._options.htmlSelector).toggle();
        jQuery(this._box).find('.wym_iframe').toggle();
    };
};
