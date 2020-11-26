// Export multiple notes 

var app = Application.currentApplication();
app.includeStandardAdditions = true;
var notesApp = Application('Notes');
notesApp.includeStandardAdditions = true;

// Prompt user to select notes
var notes = notesApp.notes;
var whichNotes = app.chooseFromList(notes.name(), { withPrompt: "Which Notes?", multipleSelectionsAllowed: true });


if (whichNotes) {

    // Specify save location
    var saveWhere = app.chooseFolder().toString();

    if (saveWhere) {

        // Iterate through all notes
        for (var i = 0; i < notes.length; i++) {

            // Check if note must be exported
            if (whichNotes.indexOf(notes[i].name()) > -1) {

                // Save note file as html
                var filename = saveWhere + "/" + notes[i].name() + ".html";
                var file = app.openForAccess(Path(filename), { writePermission: true });
                app.setEof(file, { to: 0 });
                app.write(notes[i].body(), { to: file });
                app.closeAccess(file);
            }
        }
    }
}