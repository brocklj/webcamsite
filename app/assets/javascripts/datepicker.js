/**
 * Created by jakub on 1.8.17.
 */
var date = new Date(Date.now());
date = date.setDate(date.getDay()-12);
    $(function () {
        $('#datetimepicker6').datetimepicker({
            format: 'YYYY-MM-DD',
            defaultDate: date
        });
        $('#datetimepicker7').datetimepicker({
            useCurrent: false, //Important! See issue #107
            format: 'YYYY-MM-DD',
            defaultDate: Date.now()
        });
        $("#datetimepicker6").on("dp.change", function (e) {
            $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker7").on("dp.change", function (e) {
            $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
        });
    });
