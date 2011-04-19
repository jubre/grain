
<%@ page import="com.synergyj.grain.course.Course" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="course.create" default="Create Course" /></title>
        <g:javascript plugin="jquery" library="jquery"/>
        <script type="text/javascript" src="http://markitup.jaysalvat.com/examples/markitup/jquery.markitup.js"></script>
        <script type="text/javascript" src="http://markitup.jaysalvat.com/examples/markitup/sets/html/set.js"></script>
        <link rel="stylesheet" type="text/css" href="http://markitup.jaysalvat.com/examples/markitup/skins/markitup/style.css"/>
        <link rel="stylesheet" type="text/css" href="http://markitup.jaysalvat.com/examples/markitup/sets/html/style.css"/>
        <g:javascript>
          $(function(){
            $('textarea').markItUp(myHtmlSettings);
          });
        </g:javascript>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="course.list" default="Course List" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="course.create" default="Create Course" /></h1>

			<g:render template="/common/errors" model="[instance:courseInstance]"/>

            <g:form action="save" method="post" name="courseForm" onsubmit="return validateForm(this);">
                <g:render template="courseForm" />
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'create', 'default': 'Create')}" /></span>
                </div>
            </g:form>

        </div>
    </body>
</html>
