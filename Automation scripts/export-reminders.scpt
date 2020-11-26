// Export multiple reminders

var app = Application('Reminders');
app.includeStandardAdditions = true;

// Prompt user to choose list
var listName = app.chooseFromList(app.lists.name(), { withPrompt: "Which List?" });
if (listName) {

    // Extract data from list
    var remindersList = app.lists.byName(listName).reminders;
    var listNames = remindersList.name();
    var listCompleted = remindersList.completed();
    var listDueDates = remindersList.dueDate();
    var listBodies = remindersList.body();

    // Create a single array
    var list = [];
    for (var i = 0; i < listNames.length; i++) {
        list.push({ name: listNames[i], completed: listCompleted[i], dueDate: listDueDates[i], body: listBodies[i] });
    }

    // Sort the list
    // list.sort((a, b) => (a.name > b.name));
    // list.sort((a, b) => (a.dueDate > b.dueDate));

    // Build text from list
    var text = "";
    var n = 0;
    for (var i = 0; i < list.length; i++) {

        // Get item including due date and notes
        var item = list[i].name;
        if (list[i].dueDate) item += " [Due: " + list[i].dueDate + "]";
        if (list[i].body) item += " [Note: " + list[i].body + "]";

        // Incomplete items
        if (!list[i].completed) {
            text += "☐ " + item + "\n";
            n++;

            // Complete items
        } else {
            text += "☑ " + item + "\n";
            n++;
        }
    }

    // Pass to clipboard
    app.setTheClipboardTo(text);

    // Display Dialog 
    app.displayAlert("Reminders Copied", { message: n + " copied to the clipboard." });
}