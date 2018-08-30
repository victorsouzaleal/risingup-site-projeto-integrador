$(function () {
    $("#spinner").spinner({
        classes: {
            "ui-spinner": "highlight"
        },
        icons: {down: "ui-icon-triangle-1-s", up: "ui-icon-triangle-1-n"},
        min:1,
    });

    $("#spinner").bind("keydown", function (event) {
        event.preventDefault();
    });
});