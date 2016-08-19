/** Chrome background page listeners  **/

/*
 * Possible parameters for request:
 *  action: "xhttp" for a cross-origin HTTP request
 *  method: Default "GET"
 *  url   : required, but not validated
 *  data  : data to send in a POST request
 *
 * The callback function is called upon completion of the request */
chrome.runtime.onMessage.addListener(function(request, sender, callback) {
    if (request.action == "xhttp") {
        var xhttp = new XMLHttpRequest();
        var method = request.method ? request.method.toUpperCase() : 'GET';
        xhttp.onload = function(e) {
            callback(this.responseText);
        };
        xhttp.onerror = function() {
            console.log("XHR Error: " + request.url);
            // callback to clean up the communication port.
            callback();
        };
        xhttp.open(method, request.url+request.data, true);
        if (method == 'POST') {
            xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        }
        xhttp.send();
        return true; // prevents the callback from being called too early on return
    }
});