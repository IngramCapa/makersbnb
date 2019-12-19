var startDate, endDate, dateRange = ['2019-12-03'];

$("#dt1").datepicker({
    dateFormat : 'yy-mm-dd',
    onSelect: function (date) {
        startDate = $(this).datepicker("getDate");
    }
});
$("#dt2").datepicker({
    dateFormat : 'yy-mm-dd',
    onSelect: function (date) {
        endDate = $(this).datepicker("getDate");
        for (var d = new Date(startDate);
            d <= new Date(endDate);
            d.setDate(d.getDate() + 1)) {
                dateRange.push($.datepicker.formatDate('yy-mm-dd', d));
        }
    }
});

$("#dt1, #dt2").datepicker("setDate", new Date());

$('#dt').datepicker({
    beforeShowDay: function (date) {
        var dateString = jQuery.datepicker.formatDate('yy-mm-dd', date);
        console.log(dateString);
        return [dateRange.indexOf(dateString) == -1];
    }
});