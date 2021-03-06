<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="wb" />
  <title><g:message code="calendar.show" default="Show Calendar" /></title>
  <link rel='stylesheet' type='text/css' href='http://arshaw.com/js/fullcalendar-1.5.3/fullcalendar/fullcalendar.css' />
  <link rel='stylesheet' type='text/css' href='http://arshaw.com/js/fullcalendar-1.5.3/fullcalendar/fullcalendar.print.css' media='print' />
  <script type='text/javascript' src='http://arshaw.com/js/fullcalendar-1.5.3/fullcalendar/fullcalendar.min.js'></script>
  <parameter name="pageHeader" value="${g.message(code: 'calendar.show', default: 'Calendar')}"/>
  <script language="javascript">
    $(function(){

      $('#calendar').fullCalendar({
        theme: true,
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        },
        monthNames:['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
        editable: false,
        events: '${createLink(action:"scheduledCourseInfo")}'
      });
    });
  </script>
</head>
<body>
<div id='calendar'></div>
</body>
</html>