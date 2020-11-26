// Create timer countdown in KeyNote to use as overlay in iMovie

var Keynote = Application("Keynote");
var presentation = Keynote.documents[0];
var slideMaster = presentation.masterSlides["Statement"];

for (var i = 0; i <= 120; i++) {
    var m = Math.floor(i / 60);
    var s = i - m * 60;
    var newSlide = Keynote.Slide({ baseSlide: slideMaster });
    presentation.slides.push(newSlide);
    newSlide.defaultBodyItem().objectText = m + ":" + String(s).padStart(2, '0');
}