function showWarn(warnMessage) {
    warn = warnMessage;
    $('#warn-message-span').text(warn);
    $('.alert').removeClass("hidden");
}