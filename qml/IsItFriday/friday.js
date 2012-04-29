.pragma library

function isItFriday() {
    var date = new Date()
    return date.getDay() == 5 ? 1 : 0
}
