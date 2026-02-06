function ToUpper() {
    // So that things work both on FF and IE
    var evt = arguments[0] || event;
    var char = String.fromCharCode(evt.which || evt.keyCode);

    // Is it a lowercase character?
    if (/[a-z]/.test(char)) {
        // convert to uppercase version
        if (evt.which) {
            evt.which = char.toUpperCase().charCodeAt(0);
        }
        else {
            evt.keyCode = char.toUpperCase().charCodeAt(0);
        }
    }
    return true;
}