/* URM Usability Reporting Manager
 * Copyright (C) 2012 internettechnik 
 * Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.
 *
 */

/* Note: 
		DO NOT CHANGE ANYTHING IN THIS FILE
		MAKE CHANGES IN app/assets/*.js
		and copy it into this file afterwards
		
 	for Rails 3.1.x find every *.js in app/assets/... 
	for Rails 3.0.x we copy every *.js from app/assets into this file
*/

/* note copy also files for jquery:  jquery.js, jquery.toastmessage.js, jquery_ujs.js*/


/* copied from file urm.js */


/* URM Usability Reporting Manager
*  Copyright (C) 2012 internettechnik 
*  Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.
*/

// when any 'submittable' field changes
$('.submittable').live('keypress', function() {
    $(this).css("color","red"); // highlight changed values
	$(this).css('background-color','yellow');
});
function toogle_doc_type(elem){
	frm=elem.closest('form') // e.g. form for edit_video_9
	if ( elem.val()=='link' ){
		frm.find('.alternative_doc').hide();
		frm.find('.alternative_bibentry').hide();
		frm.find('.alternative_link').show();
	}else if ( elem.val()=='bibentry' ){
		frm.find('.alternative_doc').hide();
		frm.find('.alternative_bibentry').show();
		frm.find('.alternative_link').hide();
	}else{ // video_doctype == doc
		frm.find('.alternative_doc').show();
		frm.find('.alternative_bibentry').hide();
		frm.find('.alternative_link').hide();	
	}	
};

// if the selection within this dropdown is "OTHER", 
//  then show the other input filed
// TODO: check (hide/show) this on load also!!
function dropdown_mainoperatingsystem(elem){
	frm=elem.closest('form') 
	// store the latest-enterd value into all the fields (dropdown or freetext)
	frm.find('#person_itexperience_mainoperatingsystem')[1].value=elem.val();
	// if dropdown and no known contents is selected:
	if ( ["WINDOWS","LINUX","MAC"].indexOf( elem.val() ) >= 0 ){
		frm.find('.OTHER').hide();
	}else{
		frm.find('.OTHER').show();
	}
}
// if the selection within this dropdown is "OTHER", 
//  then show the other input filed
// TODO: check (hide/show) this on load also!!
function dropdown_mainwebbrowser(elem){
	frm=elem.closest('form') 
	// store the latest-enterd value into all the fields (dropdown or freetext)
	frm.find('#person_itexperience_mainwebbrowser')[1].value=elem.val();
	// if dropdown and no known contents is selected:
	if ( ["FIREFOX","CHROME","SAFARI","OPERA","IE"].indexOf( elem.val() ) >= 0 ){
		frm.find('.OTHER_BROWSER').hide();
	}else{
		frm.find('.OTHER_BROWSER').show();
	}
}

// we would like to save changes automatically (on leave input-field):
$('.submittable').live('change', function() {
  if ( $(this).attr("id") =="video_doctype" 	) toogle_doc_type($(this));
  if ( $(this).attr("id") =="document_doctype" 	) toogle_doc_type($(this));
  if ( $(this).attr("id") =="person_itexperience_mainoperatingsystem" 	) dropdown_mainoperatingsystem(	$(this));
  if ( $(this).attr("id") =="person_itexperience_mainwebbrowser" 		) dropdown_mainwebbrowser(		$(this));
  $(this).closest('form').trigger('submit');
});

// we would like to submit the link "add author" on image - "button" click:
$('.submit_button').live("keypress", function() {
	$(this).closest('a').click();
});


// when page has been loaded:
$(document).ready(function() {
	/* Fade out the rails3-flash-notice messages after some time */
	$('.flash_notice').delay(3000).fadeOut();

	/* read cookies and set state accordingly */	
	// console.log("Load list of 'toggle-elements' from cookies and toogle each given div")	
	// setting, reading and so on.. see urm_cookies.js
	ac = allCookiesLike("#toggle_");
	// console.log(ac);
	for (idx in ac) {
		$(ac[idx]).toggle();
	}
});

function showAboutDialog(){
	$("#aboutdialog").dialog();
}

/* commodity functions with jquery_ui */
$(function() {
		// see: http://docs.jquery.com/UI/API/1.7.1/Datepicker
		$.datepicker.formatDate("yyyy-mm-dd");
		// if class=submittable and type=date:
		submit_date_elems=$(".submittable[type='date']")
		submit_date_elems.datepicker({ dateFormat: 'yy-mm-dd' });
		submit_date_elems.datepicker();
});

function saveState(elem){
	// hopefully 4KB of Cookie size is enough ?!
	// setting, reading and so on.. see urm_cookies.js
	//console.log("remember toggling for '"+elem+"'");
	
	// check if cookie set:
	if (readCookie(elem)) { 	// if yes: remove cookie:
		//console.log(" erase '"+elem+"'");
		eraseCookie(elem);
	}else{						// else: create cookie:		
		//console.log(" set '"+elem+"'");
		createCookie(elem,true,5); // save value "collapese" = true it for 5 days.
	}
}

/* provide some feedback after update: */
function showToast(msg){
	/* find detailed configuration at: https://github.com/akquinet/jquery-toastmessage-plugin/wiki*/
	$().toastmessage('showToast',{
		 	text : 		msg,
			type : 		'success',
			position: 	'top-right', // top-left, top-center, top-right, middle-left, middle-center, middle-right
			stayTime: 	2000
			});
}

/* remove the highlighting of fields (after update) */
function resetHighlightingForElems(elem){
	// we reset the colors (in several forms of) the current project
	// remove highlighting of all 'submittable' (maybe changed) fields
	$(elem).find('.submittable').css('color','black');
	$(elem).find('.submittable').css('background-color','#FFFFFF');
};

/* copied from file urm_cookies.js */

/* URM Usability Reporting Manager
*  Copyright (C) 2012 internettechnik 
*  Licensed under the GNU GPLv3 (http://www.gnu.org/licenses/gpl.txt) license.
*/


// helpers for cookies
// see: http://www.quirksmode.org/js/cookies.html

function createCookie(name,value,days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}

function eraseCookie(name) {
	createCookie(name,"",-1);
}

function allCookiesLike(filter) { // find all like "#toogle_author_24",...
	var nameEQ = filter;
	var ca = document.cookie.split(';');
	coos=[];
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0){
			pos_eq=c.indexOf("=");
			coos.push( c.substring(0,pos_eq) );
		} 
	}
	return coos;
}
