var reservationsDataTable;
$(function () {
    reservationsDataTable = $('#reservations-table').DataTable({
        "ajax":{
            url: "/get-reservations",
            dataSrc: ""
        },
        "columns":[
            {data: 'reservationID'},
            {data: 'customerID'},
            {data: 'customerName'},
            {data: 'customerEmail'},
            {data: 'bikeID'},
            {data: 'bikeModel'},
            {data: 'reservationTime'},
            {
                data: null,
                orderable: false,
                searchable: false,
                render: function (data, type, row, meta) {
                    return  "<button type='button' onclick= 'decideReservation(\"refuse\",  " + row.reservationID + ")'>Refuse</button><br>"+
                        "<button type='button' onclick= 'decideReservation(\"approve\", " + row.reservationID + ")'>Approve</button>";
                }
            }
        ],
        "columnDefs": [
            {
                targets: '_all',
                className: 'dt-center'
            }
        ],
        "order": []
    });
});

function decideReservation(decision, reservationID) {
    $.ajax({
        url: "/decide-reservation",
        method: "POST",
        data:{
            reservationID: reservationID,
            decision: decision
        },
        success:function () {
            reservationsDataTable.ajax.reload();
        }
    });
}