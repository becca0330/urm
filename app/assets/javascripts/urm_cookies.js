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
