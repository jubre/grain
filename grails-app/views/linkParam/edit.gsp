<%@ page import="com.synergyj.grain.ui.LinkParam" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="wb"/>
  <title><g:message code="linkParam.edit" default="Edit LinkParam"/></title>
  <parameter name="pageHeader" value="${g.message(code: 'linkParam.edit', default: 'Edit LinkParam')}"/>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${resource(dir: '')}"><g:message code="home" default="Home"/></a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="linkParam.list" default="LinkParam List"/></g:link></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="linkParam.new" default="New LinkParam"/></g:link></span>
</div>
<div class="body">
  <g:if test="${flash.message}">
    <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}"/></div>
  </g:if>
  <g:hasErrors bean="${linkParamInstance}">
    <div class="errors">
      <g:renderErrors bean="${linkParamInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${linkParamInstance?.id}"/>
    <g:hiddenField name="version" value="${linkParamInstance?.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="name"><g:message code="linkParam.name" default="Name"/>:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: linkParamInstance, field: 'name', 'errors')}">
            <g:textField name="name" maxlength="100" value="${fieldValue(bean: linkParamInstance, field: 'name')}"/>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="value"><g:message code="linkParam.value" default="Value"/>:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: linkParamInstance, field: 'value', 'errors')}">
            <g:textField name="value" maxlength="100" value="${fieldValue(bean: linkParamInstance, field: 'value')}"/>

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="menuItem"><g:message code="linkParam.menuItem" default="Menu Item"/>:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: linkParamInstance, field: 'menuItem', 'errors')}">
            <g:select name="menuItem.id" from="${com.synergyj.grain.ui.MenuItem.list()}" optionKey="id" value="${linkParamInstance?.menuItem?.id}"/>

          </td>
        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'update', 'default': 'Update')}"/></span>
      <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
