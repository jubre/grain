<script type="text/javascript" src="http://www.mailermailer.com/js/jquery/jquery.kolorpicker.js"></script>
<link rel="stylesheet" href="http://www.mailermailer.com/style/kolorpicker.css" type="text/css" media="screen, tv, projection, print" />
<table width="100%">
  <tr>
    <td>
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="name"><g:message code="course.name" default="Name" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'name', 'errors')}">
            <g:textField name="name" maxlength="100" value="${fieldValue(bean: courseInstance, field: 'name')}" />
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="courseKey"><g:message code="course.courseKey" default="Course Key" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'courseKey', 'errors')}">
            <g:textField name="courseKey" maxlength="20" value="${fieldValue(bean: courseInstance, field: 'courseKey')}" />
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="urlLandingPage"><g:message code="course.url" default="URL Landing" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'urlLandingPage', 'errors')}">
            <g:textField name="urlLandingPage" maxlength="50" value="${fieldValue(bean: courseInstance, field: 'urlLandingPage')}" />
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="status"><g:message code="course.color" default="Color" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'color', 'errors')}">
            <g:textField name="color" value="${courseInstance?.color}" class="kolorPicker" />
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="status"><g:message code="course.backgroundColor" default="BackgroundColor" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'backgroundColor', 'errors')}">
            <g:textField name="backgroundColor" value="${courseInstance?.backgroundColor}" class="kolorPicker" />
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="status"><g:message code="course.borderColor" default="BorderColor" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'borderColor', 'errors')}">
            <g:textField name="borderColor" value="${courseInstance?.borderColor}" class="kolorPicker" />
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="status"><g:message code="course.textColor" default="TextColor" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'textColor', 'errors')}">
            <g:textField name="textColor" value="${courseInstance?.textColor}" class="kolorPicker" />
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="content"><g:message code="course.content" default="Content" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'content', 'errors')}">
            <g:textArea rows="5" cols="80" name="content" value="" class="wysiwyg">${courseInstance?.content}</g:textArea>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="overview"><g:message code="course.overview" default="Overview" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'overview', 'errors')}">
            <g:textArea rows="5" cols="80"  name="overview" class="wysiwyg">${courseInstance?.overview}</g:textArea>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="audience"><g:message code="course.audience" default="Audience" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'audience', 'errors')}">
            <g:textArea rows="5" cols="70" name="audience" class="wysiwyg">${courseInstance?.audience}</g:textArea>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="prerequisites"><g:message code="course.prerequisites" default="Prerequisites" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'prerequisites', 'errors')}">
            <g:textArea rows="5" cols="70" name="prerequisites" class="wysiwyg">${courseInstance?.prerequisites}</g:textArea>
          </td>
        </tr>

        <g:if test="${courseInstance?.id}">
          <tr class="prop">
            <td valign="top" class="name">
              <label for="modules"><g:message code="course.modules" default="Modules" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'modules', 'errors')}">

              <ul>
                <g:each in="${courseInstance?.modules}" var="courseModuleInstance">
                  <li><g:link controller="courseModule" action="show" id="${courseModuleInstance.id}">${courseModuleInstance?.encodeAsHTML()}</g:link></li>
                </g:each>
              </ul>
              <g:link controller="courseModule" params="['course.id': courseInstance?.id]" action="create">
                <g:message code="courseModule.new" default="New CourseModule" />
              </g:link>
            </td>
          </tr>
        </g:if>

        </tbody>
      </table>
    </td>
    <td>
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="goal"><g:message code="course.goal" default="Goal" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'goal', 'errors')}">
            <g:textArea rows="5" cols="70" name="goal" class="wysiwyg">${courseInstance?.goal}</g:textArea>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="method"><g:message code="course.method" default="Method" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'method', 'errors')}">
            <g:textArea rows="5" cols="70" name="method" class="wysiwyg">${courseInstance?.method}</g:textArea>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="format"><g:message code="course.format" default="Format" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'format', 'errors')}">
            <g:textArea rows="5" cols="70" name="format" class="wysiwyg">${courseInstance?.format}</g:textArea>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="contentType"><g:message code="course.contentType" default="Content Type" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'contentType', 'errors')}">
            <g:select name="contentType" from="${com.synergyj.grain.content.ContentType?.values()}" value="${courseInstance?.contentType}"  />

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="courseType"><g:message code="course.courseType" default="Course Type" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'courseType', 'errors')}">
            <g:select name="courseType" from="${com.synergyj.grain.course.CourseType?.values()}" value="${courseInstance?.courseType}"  />

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="status"><g:message code="course.status" default="Status" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: courseInstance, field: 'status', 'errors')}">
            <g:select name="status" from="${com.synergyj.grain.course.Status?.values()}" value="${courseInstance?.status}"  />

          </td>
        </tr>

        </tbody>
      </table>
    </td>
  </tr>
</table>




