<%@ page import="com.synergyj.grain.course.Promotion" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="wb" />
  <title><g:message code="promotion.edit" default="Edit Promotion" /></title>
  <parameter name="pageHeader" value="${g.message(code: 'promotion.edit', default: 'Edit Promotion')}"/>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${resource(dir: '')}"><g:message code="home" default="Home" /></a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="promotion.list" default="Promotion List" /></g:link></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="promotion.new" default="New Promotion" /></g:link></span>
</div>
<br/>
<div class="body">
  <g:hasErrors bean="${promotionInstance}">
    <div class="errors">
      <g:renderErrors bean="${promotionInstance}" as="list" />
    </div>
  </g:hasErrors>
  <g:form method="post" >
    <g:hiddenField name="id" value="${promotionInstance?.id}" />
    <g:hiddenField name="version" value="${promotionInstance?.version}" />
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="promotionKey"><g:message code="promotion.promotionKey" default="Promotion Key" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: promotionInstance, field: 'promotionKey', 'errors')}">
            <g:textField name="promotionKey" value="${fieldValue(bean: promotionInstance, field: 'promotionKey')}" />

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="description"><g:message code="promotion.description" default="Description" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: promotionInstance, field: 'description', 'errors')}">
            <g:textField name="description" value="${fieldValue(bean: promotionInstance, field: 'description')}" />

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="discount"><g:message code="promotion.discount" default="Discount" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: promotionInstance, field: 'discount', 'errors')}">
            <g:textField name="discount" value="${fieldValue(bean: promotionInstance, field: 'discount')}" />

          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="kindPromotion"><g:message code="promotion.kindPromotion" default="Kind Promotion" />:</label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: promotionInstance, field: 'kindPromotion', 'errors')}">
            <g:select name="kindPromotion" from="${com.synergyj.grain.course.KindPromotion?.values()}" value="${promotionInstance?.kindPromotion}"  />

          </td>
        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'update', 'default': 'Update')}" /></span>
      <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
    </div>
  </g:form>
</div>
</body>
</html>
