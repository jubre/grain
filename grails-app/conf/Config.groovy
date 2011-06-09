/*
 * Copyright 2002-2008 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    html: ['text/html', 'application/xhtml+xml'],
    xml: ['text/xml', 'application/xml'],
    text: 'text/plain',
    js: 'text/javascript',
    rss: 'application/rss+xml',
    atom: 'application/atom+xml',
    css: 'text/css',
    csv: 'text/csv',
    all: '*/*',
    json: ['application/json', 'text/json'],
    form: 'application/x-www-form-urlencoded',
    multipartForm: 'multipart/form-data'
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// whether to install the java.util.logging bridge for sl4j. Disable for AppEngine!
grails.logging.jul.usebridge = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []

grails.views.javascript.library = "jquery"
jqueryUi.cdn = 'googlecode'

// set per-environment serverURL stem for creating absolute links
environments {
  production {
    grails.serverURL = "http://www.changeme.com"
  }
  development {
    grails.serverURL = "http://localhost:8080/${appName}"
  }
  test {
    grails.serverURL = "http://localhost:8080/${appName}"
  }

}

// log4j configuration
log4j = {
  // Example of changing the log pattern for the default console
  // appender:
  //
  //appenders {
  //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
  //}

appenders {
        // file appender that writes out the URLs of the Google Chart API graphs generated by the performanceGraphAppender

        def performanceGraphFileAppender = new org.apache.log4j.FileAppender(
            fileName: "target/perfGraphs.log",
            layout: pattern(conversionPattern: '%m%n')
        )
        appender name: 'performanceGraphFileAppender', performanceGraphFileAppender

        // this appender creates the Google Chart API graphs
        def performanceGraphAppender = new org.perf4j.log4j.GraphingStatisticsAppender(
            graphType: 'Mean',      // possible options: Mean, Min, Max, StdDev, Count or TPS
            tagNamesToGraph: 'tag1,tag2,tag3',
            dataPointsPerGraph: 5
        )
        performanceGraphAppender.addAppender(performanceGraphFileAppender)
        appender name: 'performanceGraph', performanceGraphAppender


        // file appender that writes out the textual, aggregated performance stats generated by the performanceStatsAppender
        def performanceStatsFileAppender = new org.apache.log4j.FileAppender(
            fileName: "target/perfStats.log",
            layout: pattern(conversionPattern: '%m%n')  // alternatively use the StatisticsCsvLayout to generate CSV
        )
        appender name: 'performanceStatsFileAppender', performanceStatsFileAppender


        // this is the most important appender and first in the appender chain. it aggregates all profiling data withing a certain time frame.
        // the GraphingStatisticsAppender is attached as a child to this appender and uses its aggregated data.
        def performanceStatsAppender = new org.perf4j.log4j.AsyncCoalescingStatisticsAppender(
            timeSlice: 10000    // ms
        )
        performanceStatsAppender.addAppender(performanceStatsFileAppender)
        performanceStatsAppender.addAppender(performanceGraphAppender)
        appender name: 'performanceStatsAppender', performanceStatsAppender

    }

  warn 'org.codehaus.groovy.grails.web.servlet',  //  controllers
      'org.codehaus.groovy.grails.web.pages', //  GSP
      'org.codehaus.groovy.grails.web.sitemesh', //  layouts
      'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
      'org.codehaus.groovy.grails.web.mapping', // URL mapping
      'org.codehaus.groovy.grails.commons', // core / classloading
      'org.codehaus.groovy.grails.plugins', // plugins
      'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
      'org.springframework',
      'org.hibernate',
      'net.sf.ehcache.hibernate'

  warn 'org.mortbay.log'
  debug 'com.synergyj'
// configure the performanceStatsAppender to log at INFO level
//    info   performanceStatsAppender: 'org.perf4j.TimingLogger'
}

/*
* Spring Security Config
*/
environments {
  test {
    grails.plugins.springsecurity.portMapper.httpPort = 80
    grails.plugins.springsecurity.portMapper.httpsPort = 80
  }
  production {
    grails.plugins.springsecurity.portMapper.httpPort = 80
    grails.plugins.springsecurity.portMapper.httpsPort = 443
  }
}


grails.plugins.springsecurity.userLookup.userDomainClassName = 'com.synergyj.grain.auth.User'
grails.plugins.springsecurity.userLookup.usernamePropertyName = 'email'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'com.synergyj.grain.auth.PersonAuthority'
grails.plugins.springsecurity.authority.className = 'com.synergyj.grain.auth.Role'
grails.plugins.springsecurity.rememberMe.cookieName = 'grain_remember_me'
grails.plugins.springsecurity.rememberMe.key = 'gHUaaSP3456X9S3hTjskQ'
grails.plugins.springsecurity.rememberMe.persistentToken.domainClassName = 'com.synergyj.grain.auth.PersistentLogin'
grails.plugins.springsecurity.rememberMe.persistent = true
grails.plugins.springsecurity.rememberMe.alwaysRemember = true
grails.plugins.springsecurity.errors.login.fail = "security.login.fail"
grails.plugins.springsecurity.errors.login.expired = "security.login.expired"
grails.plugins.springsecurity.errors.login.passwordExpired = "security.login.passwordExpired"
grails.plugins.springsecurity.errors.login.disabled = "security.login.disabled"
grails.plugins.springsecurity.errors.login.locked = "security.login.locked"
grails.plugins.springsecurity.dao.reflectionSaltSourceProperty = 'username'
grails.plugins.springsecurity.useSessionFixationPrevention = true
grails.plugins.springsecurity.successHandler.defaultTargetUrl = '/me'

grails.plugins.springsecurity.controllerAnnotations.staticRules = [
    '/themes/**': ['permitAll'],
    '/js/**': ['permitAll'],
    '/images/**': ['permitAll'],
    '/plugins/**': ['permitAll'],
    '/logout/**': ['IS_AUTHENTICATED_ANONYMOUSLY']
]

// Temporalmente agregado para usar el flujo de registro
grails {
  mail {
    host = "smtp.gmail.com"
    port = 465
    username = "cursos@synergyj.com"
    password = "entrenamiento"
    props = ["mail.smtp.auth":"true",
        "mail.smtp.socketFactory.port":"465",
        "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
        "mail.smtp.socketFactory.fallback":"false"]
  }
}

avatarPlugin {
	defaultGravatarUrl="""http://synergyj.com/user_anonymous.png"""
	gravatarRating="G"
}