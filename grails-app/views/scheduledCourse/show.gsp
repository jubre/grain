<%@ page import="com.synergyj.grain.course.ScheduledCourse" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <title><g:message code="scheduledCourse.show" default="Show ScheduledCourse" /></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="scheduledCourse.list" default="ScheduledCourse List" /></g:link></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="scheduledCourse.new" default="New ScheduledCourse" /></g:link></span>
</div>
<div class="body">
  <h1><g:message code="scheduledCourse.show" default="Show ScheduledCourse" /></h1>
  <g:if test="${flash.message}">
    <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
  </g:if>
  <g:form>
    <g:hiddenField name="id" value="${scheduledCourseInstance?.id}" />
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
          <td valign="top" class="name"><g:message code="scheduledCourse.beginDate" default="Begin Date" />:</td>

          <td valign="top" class="value"><g:formatDate date="${scheduledCourseInstance?.beginDate}" /></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="scheduledCourse.limitRegistrationDate" default="Limit Registration Date" />:</td>

          <td valign="top" class="value"><g:formatDate date="${scheduledCourseInstance?.limitRegistrationDate}" /></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="scheduledCourse.lastUpdated" default="Last Updated" />:</td>

          <td valign="top" class="value"><g:formatDate date="${scheduledCourseInstance?.lastUpdated}" /></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="scheduledCourse.dateCreated" default="Date Created" />:</td>

          <td valign="top" class="value"><g:formatDate date="${scheduledCourseInstance?.dateCreated}" /></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="scheduledCourse.costByCourse" default="Cost By Course" />:</td>

          <td valign="top" class="value"><g:formatNumber number="${scheduledCourseInstance?.costByCourse}" /></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="scheduledCourse.costByModule" default="Cost By Module" />:</td>

          <td valign="top" class="value"><g:formatNumber number="${scheduledCourseInstance?.costByModule}" /></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="scheduledCourse.courseSessions" default="Course Sessions" />:</td>

          <td  valign="top" style="text-align: left;" class="value">
            <ul>
              <g:each in="${scheduledCourseInstance?.courseSessions}" var="courseSessionInstance">
                <li><g:link controller="courseSession" action="show" id="${courseSessionInstance.id}">${courseSessionInstance.encodeAsHTML()}</g:link></li>
              </g:each>
            </ul>
          </td>

        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'edit', 'default': 'Edit')}" /></span>
      <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
    </div>
  </g:form>
</div>
</body>
</html>
