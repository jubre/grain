<div id="loginForm" style="display:<sec:ifLoggedIn>none</sec:ifLoggedIn><sec:ifNotLoggedIn>block</sec:ifNotLoggedIn>;">
  <form action='${postUrl}' method='POST' id="auth" name="auth" autocomplete='off'>
      <h1><g:message code='login.signin'/></h1>
      <div id="loginMessage" class="ui-state-error ui-corner-all" style="padding: 0px; display: none; text-align: center;">
        <p>
          <span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
          <strong>Alerta:</strong><span id="jsonMessage"></span>
        </p>
      </div>
      <table>
        <tr>
          <td><label for="username"><g:message code='login.username'/></label></td>
          <td><input name="j_username" type="text" id="username" size="30" value="${email}"/></td>
        </tr>
        <tr>
          <td><label for="password"><g:message code='login.password'/></label></td>
          <td><input type="password" name="j_password" id="password" size="30"/></td>
        </tr>
        <tr>
          <td colspan='2'>
            <input type="checkbox" class="checkbox" name="${rememberMeParameter}" id="remember_me" checked="checked"/>
            <label for='remember_me'><g:message code='login.rememberme'/></label> |
            <span class="forgot-link">
              <g:link mapping='forgotPassword'><g:message code='login.forgotPassword'/></g:link>
            </span>
          </td>
        </tr>
        <tr>
          <td colspan='2'>
            <g:link mapping='signup'><g:message code='login.register'/></g:link>
            <g:submitButton name="loginSubmit" value="${g.message(code:'login.login')}"/>
          </td>
        </tr>
      </table>
  </form>
</div>