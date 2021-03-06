<%@ page import="com.synergyj.grain.course.Course" %>
<html>
    <head>
        <meta name="layout" content="wb" />
        <title><g:message code="course.show" default="Show Course" /></title>
        <parameter name="pageHeader" value="${g.message(code: 'course.show', default: 'Course Info')}"/>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="course.list" default="Course List" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="course.new" default="New Course" /></g:link></span>
        </div>
        <div class="content">
            <h1>${fieldValue(bean: courseInstance, field: "name")}</h1>
            <h3>${fieldValue(bean: courseInstance, field: "urlLandingPage")}</h3>
            <g:if test="${flash.message}">
            <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
            </g:if>
            <g:form>
                <g:hiddenField name="id" value="${courseInstance?.id}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            
                            <tr class="prop">
                                <td valign="top" class="name" width="20%"><g:message code="course.content" default="Content" />:</td>
                                
                                <td valign="top" class="value">${courseInstance?.content}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="course.contentType" default="Content Type" />:</td>
                                
                                <td valign="top" class="value">${courseInstance?.contentType?.encodeAsHTML()}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="course.lastUpdated" default="Last Updated" />:</td>
                                
                                <td valign="top" class="value"><g:formatDate date="${courseInstance?.lastUpdated}" format="dd-MM-yy" /></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="course.dateCreated" default="Date Created" />:</td>

                                <td valign="top" class="value"><g:formatDate date="${courseInstance?.dateCreated}" format="dd-MM-yy" /></td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="course.overview" default="Overview" />:</td>
                                
                                <td valign="top" class="value">${courseInstance?.overview}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="course.audience" default="Audience" />:</td>
                                
                                <td valign="top" class="value">${courseInstance?.audience}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="course.prerequisites" default="Prerequisites" />:</td>
                                
                                <td valign="top" class="value">${courseInstance?.prerequisites}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="course.goal" default="Goal" />:</td>
                                
                                <td valign="top" class="value">${courseInstance?.goal}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="course.method" default="Method" />:</td>
                                
                                <td valign="top" class="value">${courseInstance?.method}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="course.format" default="Format" />:</td>
                                
                                <td valign="top" class="value">${courseInstance?.format}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="course.courseKey" default="Course Key" />:</td>
                                
                                <td valign="top" class="value">${fieldValue(bean: courseInstance, field: "courseKey")}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="course.courseType" default="Course Type" />:</td>
                                
                                <td valign="top" class="value">${courseInstance?.courseType?.encodeAsHTML()}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="course.status" default="Status" />:</td>
                                
                                <td valign="top" class="value">${courseInstance?.status?.encodeAsHTML()}</td>
                                
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="course.modules" default="Modules" />:</td>
                                
                                <td  valign="top" style="text-align: left;" class="value">
                                    <ul>
                                    <g:each in="${courseInstance?.modules}" var="courseModuleInstance">
                                        <li><g:link controller="courseModule" action="show" id="${courseModuleInstance.id}">${courseModuleInstance.encodeAsHTML()}</g:link></li>
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
