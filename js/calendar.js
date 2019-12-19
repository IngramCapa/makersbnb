document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    plugins: [ 'interaction', 'dayGrid' ],
    defaultDate: Date.now(),
    nav_links: true,
    editable: true,
    eventLimit: true, // allow "more" link when too many events
    events: [
      {
        title: 'Property 1',
        start: '2019-12-09',
        end: '2019-12-12T12:00:00'
      },
      {
        groupId: 1,
        title: 'Property 2',
        start: '2019-12-10',
        end: '2019-12-13T12:00:00'
      }
    ]
  });
  calendar.render();
});