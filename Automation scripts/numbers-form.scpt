// Simulate a form in Mac Numbers
// Use data entered in one table to populate a record in another

// Get the two tables involved
var Numbers = Application("Numbers");
var database = Numbers.documents[0].sheets[0].tables['Database'];
var form = Numbers.documents[0].sheets[1].tables['Data Entry'];

// Extract values from form/first table
var values = [];
for (var i = 0; i < form.rows.length; i++) {
    var value = form.rows[i].cells[0].value();
    values.push(value);
}

// Create a new row at end of the database/second table
var newRow = database.cells['A' + database.rows.length].addRowBelow();

// Insert  values into new row
for (var i = 0; i < values.length; i++) {
    newRow.cells[i].value = values[i];
}

// Clear form in reverse
for (var i = form.rows.length - 1; i >= 0; i--) {
    form.rows[i].cells[0].value = "";
}