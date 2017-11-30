var socket;

$.notify.defaults({ className: "success" });

$.notify.addStyle('notification', {
    html:   "<div>" +
                "<div class='hidden reservationID' data-notify-text='reservationID'></div>"+
                "<div class='message' data-notify-text='messageStr'/>" +
                "<div class='buttons'>" +
                    "<button class='refuse'>Refuse</button>" +
                    "<button class='approve'>Approve</button>" +
                "</div>" +
            "</div>"
});

$.notify.addStyle('information', {
    html:   "<div><i class=\"fa fa-info\" aria-hidden=\"true\"></i>  <span data-notify-text/></div>"
});

$.notify.addStyle('warning', {
    html:   "<div><i class=\"fa fa-exclamation-triangle\" aria-hidden=\"true\"></i>  <span data-notify-text/></div>"
});

$(function () {
    socket = new WebSocket("ws://" + window.location.hostname + ":"+window.location.port+"/rs");

    socket.onopen = function () {
        $.notify("Connected", {
            style: 'information',
            globalPosition: 'bottom center',
            showDuration: 400
        });
    };

    socket.onmessage = function (event) {
        var reservationJSON = JSON.parse(event.data);
        $.notify({
            messageStr: reservationJSON.messageStr,
            reservationID: reservationJSON.reservationID
        }, {
            style: 'notification',
            autoHide: false,
            clickToHide: true
        });
        all_bikes_DataTable.ajax.reload();
        reservationsDataTable.ajax.reload();
    };

    socket.onclose = function () {
        $.notify("Cannot Reach Server", {
            style: 'warning',
            globalPosition: 'bottom center',
            autoHide: false
        });
    };

    $(document).on('click', '.notifyjs-notification-base .refuse', function () {
        $.ajax({
            url: "/decide-reservation",
            method: "POST",
            data: {
                reservationID: $(this).parent().siblings('.reservationID').text(),
                decision: "refuse"
            }
        });
        $(this).trigger('notify-hide');
        all_bikes_DataTable.ajax.reload();
        reservationsDataTable.ajax.reload();

    });

    $(document).on('click', '.notifyjs-notification-base .approve', function () {
        $.ajax({
            url: "/decide-reservation",
            method: "POST",
            data: {
                reservationID: $(this).parent().siblings('.reservationID').text(),
                decision: "approve"
            }
        });
        $(this).trigger('notify-hide');
        all_bikes_DataTable.ajax.reload();
        reservationsDataTable.ajax.reload();
    });

    $(document).on('click', '.notifyjs-notification-base .ignore', function () {
        $(this).trigger('notify-hide');
    });
});
