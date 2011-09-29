<%@ page import="com.synergyj.grain.course.ScheduledCourse" %>
<html>
<head>
  <meta name="layout" content="wb" />
  <title><g:message code="scheduledCourse.show" default="Show ScheduledCourse" /></title>
  <parameter name="pageHeader" value="${g.message(code: 'scheduledCourse.show', default: 'Scheduled Course Info')}"/>
  <script type="text/javascript" src="https://raw.github.com/fgelinas/timepicker/master/jquery.ui.timepicker.js"></script>
  <link rel="stylesheet" href="https://raw.github.com/fgelinas/timepicker/master/jquery-ui-timepicker.css"/>
  <script language="javascript" src="${resource(dir:'themes/wb/js/scheduledCourse',file:'show.js')}">
  </script>

</head>
<body>
<div class="nav">
  <span class="menuButton"><g:link class="list" action="list"><g:message code="scheduledCourse.list" default="ScheduledCourse List" /></g:link></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="scheduledCourse.new" default="New ScheduledCourse" /></g:link></span>
</div>
<div class="body">
  <g:form style="height: 100%">
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="scheduledCourse.id" default="Id" />:</td>

          <td valign="top" class="value">${fieldValue(bean: scheduledCourseInstance, field: "id")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="scheduledCourse.course" default="Course" />:</td>

          <td valign="top" class="value"><g:link controller="course" action="show" id="${scheduledCourseInstance?.course?.id}">${scheduledCourseInstance?.course?.encodeAsHTML()}</g:link></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="scheduledCourse.costByCourse" default="Cost By Course" />:</td>

          <td valign="top" class="value">$ <g:formatNumber number="${scheduledCourseInstance?.costByCourse}" format="#,##0.00" locale="MX"/> </td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="scheduledCourse.costByModule" default="Cost By Module" />:</td>

          <td valign="top" class="value">$ <g:formatNumber number="${scheduledCourseInstance?.costByModule}" format="#,##0.00" locale="MX"/> </td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="scheduledCourse.beginDate" default="Begin Date" />:</td>

          <td valign="top" class="value"><g:formatDate date="${scheduledCourseInstance?.beginDate}" format="dd-MMMM-yy" /></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="scheduledCourse.limitRegistrationDate" default="Limit Registration Date" />:</td>

          <td valign="top" class="value"><g:formatDate date="${scheduledCourseInstance?.limitRegistrationDate}" format="dd-MMMM-yy" /></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="scheduledCourse.status" default="Status:" />:</td>
          <td valign="top" class="value">${scheduledCourseInstance.scheduledCourseStatus}</td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="scheduledCourse.durationInHours" default="Duration In Hours" />:</td>
          <td valign="top" class="value">${scheduledCourseInstance?.durationInHours}</td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <g:message code="scheduledCourse.fullAddress" default="Full Address" />:
          </td>
          <td valign="top" class="value ${hasErrors(bean: scheduledCourseInstance, field: 'fullAddress', 'errors')}">
            ${scheduledCourseInstance.fullAddress ?: 'Dirección'}
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <g:message code="scheduledCourse.geolocation" default="Geolocation" />:
          </td>
          <td valign="top" class="value ${hasErrors(bean: scheduledCourseInstance, field: 'geolocation', 'errors')}">
            <g:hiddenField name="geolocation" value="${scheduledCourseInstance?.geolocation}"/>
            <g:render template="/common/map" model="[refField:'geolocation',width:480,height:240]" />
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="scheduledCourse.courseSessions" default="Course Sessions" />:</td>

          <td  valign="top" style="text-align: left;" class="value">
            <div id="sessionList">
            <ul>
              <g:each in="${scheduledCourseInstance?.courseSessions?.sort()}" var="courseSessionInstance">
                <li id="sessionCourse${courseSessionInstance.id}">
                  <span id="sessionCourseValue${courseSessionInstance.id}">${courseSessionInstance?.encodeAsHTML()}</span>
                  &nbsp;-&nbsp;
                  <span id="sessionCourseEndTime${courseSessionInstance.id}">
                    <g:formatDate date="${courseSessionInstance?.sessionEndTime}" format="HH:mm"/>
                  </span>
                  <a class="updateSession" href="${createLink(controller:'courseSession',action:'updateAsync',id:courseSessionInstance.id)}">
                    Update
                  </a>
                  <a class="deleteSession" href="${createLink(controller:'courseSession',action:'deleteAsync',id:courseSessionInstance.id)}">
                    Delete
                  </a>
                </li>
              </g:each>
            </ul>
            </div>
          </td>

        </tr>

        </tbody>
      </table>


    </div>
    <g:hiddenField name="id" value="${scheduledCourseInstance?.id}" />
    <div class="buttons">
      <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'edit', 'default': 'Edit')}" /></span>
      <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
    </div>
  </g:form>
</div>
<br/>
<button id="showAddCourseSession">
  <g:message code="scheduledCourse.addSessions" default="Add Session" />
</button>

<div id="newSessionCourse" title="Add a new session" style="display:none;">
  <g:formRemote
      name="addSessionToScheduledCourse"
      url="[controller:'scheduledCourse',action:'newSessionToCourse']"
      onSuccess="reacting(data)"
      onComplete="restoreLink()" style="height:100%;" >
    <g:hiddenField name="scheduledCourseId" value="${scheduledCourseInstance.id}"/>
    <g:hiddenField name="courseSessionId" value="0"/>
    Fecha de la Sesión: <g:textField name="sessionStartTime" />
    Hora de inicio: <g:textField name="sessionHourStartTime" />
    Duración(hrs.): <g:select from="${2..9}" name="duration" value="9" />
    <input type="submit" value="Add Session to Course" id="addSession" name="addSession"/>
  </g:formRemote>
</div>

<!-- TODO: Agregar promociones -->

</body>
</html>
