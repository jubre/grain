
<%@ page import="com.synergyj.grain.course.Promotion" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="wb" />
  <title><g:message code="promotion.show" default="Show Promotion" /></title>
  <parameter name="pageHeader" value="${g.message(code: 'promotion.show', default: 'Show Promotion')}"/>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${resource(dir: '')}"><g:message code="home" default="Home" /></a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="promotion.list" default="Promotion List" /></g:link></span>
  <span class="menuButton"><g:link class="create" action="create"><g:message code="promotion.new" default="New Promotion" /></g:link></span>
</div>
<br/>
<div class="body">
  <g:form>
    <g:hiddenField name="id" value="${promotionInstance?.id}" />
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="promotion.id" default="Id" />:</td>

          <td valign="top" class="value">${fieldValue(bean: promotionInstance, field: "id")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="promotion.promotionKey" default="Promotion Key" />:</td>

          <td valign="top" class="value">${fieldValue(bean: promotionInstance, field: "promotionKey")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="promotion.description" default="Description" />:</td>

          <td valign="top" class="value">${fieldValue(bean: promotionInstance, field: "description")}</td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="promotion.dateCreated" default="Date Created" />:</td>

          <td valign="top" class="value"><g:formatDate date="${promotionInstance?.dateCreated}" /></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="promotion.lastUpdated" default="Last Updated" />:</td>

          <td valign="top" class="value"><g:formatDate date="${promotionInstance?.lastUpdated}" /></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="promotion.discount" default="Discount" />:</td>

          <td valign="top" class="value"><g:formatNumber number="${promotionInstance?.discount}" /></td>

        </tr>

        <tr class="prop">
          <td valign="top" class="name"><g:message code="promotion.kindPromotion" default="Kind Promotion" />:</td>

          <td valign="top" class="value">${promotionInstance?.kindPromotion?.encodeAsHTML()}</td>

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
