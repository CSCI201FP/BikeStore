var all_bikes_DataTable;
$(function () {
    all_bikes_DataTable = $('#all-bikes-table').DataTable({
        "ajax": {
            url: "/get-bikes?range=all",
            dataSrc: ""
        },
        "columns": [
            {
                data: 'bikeID',
                className: 'details-control',
                render: function (data) {
                    return '<i class="fa fa-search-plus" aria-hidden="true"></i>' + data;
                }
            },
            {data: 'model'},
            {data: 'type'},
            {data: 'gender'},
            {data: 'seatHeight'},
            {data: 'availability'},
            {
                data: "currentHolderID",
                render: function (data, type, row, meta) {
                    if (data === 0 || data === '0') {
                        return "N/A";
                    } else {
                        return data;
                    }
                }
            },
            {data: 'currentHolderName'},
            {data: 'currentHolderEmail'},
            {
                data: null,
                searchable: false,
                orderable: false,
                defaultContent: "<button type='button' class='delete-button'>Delete</button>"
            }
        ],
        "columnDefs": [
            {
                targets: '_all',
                className: 'dt-center'
            }
        ],
        "dom": "Bfrtp",
        "buttons": ['colvis'],
        "select": true,
        "autoWidth": true,
        "order": []
    });

    // Add event listener for opening and closing details
    $('#all-bikes-table tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = all_bikes_DataTable.row(tr);

        if (row.child.isShown()) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
            $(this).html('<i class="fa fa-search-plus" aria-hidden="true"></i>' + row.data().bikeID);
        }
        else {
            // Open this row
            row.child(format(row.data())).show();
            tr.addClass('shown');
            $(this).html('<i class="fa fa-search-minus" aria-hidden="true"></i>' + row.data().bikeID);
        }
    });

    // Add event listener for opening and closing details
    $('#all-bikes-table tbody').on('click', 'button.delete-button', function () {
        var tr = $(this).closest('tr');
        var row = all_bikes_DataTable.row(tr);

        if (row.data().availability==="available"){
            $.ajax({
                url: '/delete-bike',
                method: 'POST',
                async: false,
                data: {
                    bikeID: row.data().bikeID
                },
                success: function (data) {
                    alert(data);
                    all_bikes_DataTable.ajax.reload();
                }
            });

        } else {
            alert("Can Only Delete An Available Bike");
        }

    });

});

function format(d) {
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">' +
        '<tr>' +
        '<td>Image:</td>' +
        '<td><img class="bike-img-big" src="' + d.picture + '"></td>' +
        '</tr>' +
        '</table>';
}
