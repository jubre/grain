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
package com.synergyj.grain

import com.synergyj.grain.course.ScheduledCourse
import com.synergyj.grain.course.ScheduledCourseStatus
import com.synergyj.grain.course.Registration
import com.synergyj.grain.auth.RegistrationCodeForScheduledCourse
import com.synergyj.grain.course.Payment
import com.synergyj.grain.course.PaymentStatus
import java.text.SimpleDateFormat
import grails.util.Environment
import com.synergyj.grain.course.RegistrationStatus

class ScheduledCourseJob {

  def mailService

  static triggers = {
    cron name: 'scheduledCourseTrigger', cronExpression: "0 0 0 * * ?"
  }

  def group = "ScheduledCourseGroup"

  def execute(){
    def scheduledCourses = ScheduledCourse.findAllByScheduledCourseStatus(ScheduledCourseStatus.SCHEDULED)
    def message = ""
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm")
    scheduledCourses.each{ scheduledCourse ->
      // Obtenemos los registros de las personas que han ingresado su correo en la Landing desde que se abrió el curso
      def registrationsCodesForScheduledCourse = RegistrationCodeForScheduledCourse.findAllByScheduledCourseId(scheduledCourse.id)
      // Obtenemos los que han confirmado su registro al curso
      def registrations = Registration.findAllByScheduledCourse(scheduledCourse)
      // Obtenemos los registros que ya están en la lista  de asistencia
      def inGroupRegistrations = registrations.findAll { registration ->
        registration.registrationStatus == RegistrationStatus.INSCRIBED_AND_PAYED_IN_GROUP || registration.registrationStatus == RegistrationStatus.INSCRIBED_AND_WITH_DEBTH_IN_GROUP || registration.registrationStatus == RegistrationStatus.FINISHED
      }
      // Obtenemos los inscritos desde hace un día
      def registrationsFromToday = registrations.findAll{ registration ->
        registration.dateCreated >= new Date() - 1
      }
      // Obtenemos los pagos iniciados de este curso
      def payments = Payment.findAllByRegistrationInList(registrations)
      // Sacamos los pagos en espera o pendientes
      def waitingAndPendingPayments = payments.findAll{ payment ->
        payment.paymentStatus == PaymentStatus.WAITING || payment.paymentStatus == PaymentStatus.PENDING
      }
      // Sacamos los pagos que ya han sido liquidados
      def  payedPayments = payments.findAll{ payment ->
        payment.paymentStatus == PaymentStatus.PAYED
      }
      message += """
      Del curso ${scheduledCourse.course.name} que comienza el ${dateFormat.format(scheduledCourse.beginDate)}
      Se han registrado en la Landing Page ${registrationsCodesForScheduledCourse.size()} personas en total
      Han confirmado su registro ${registrations.size()} personas
      Asitirán ${inGroupRegistrations.size() ?: 0} personas
      El numero de personas registradas hace 24 horas es: ${registrationsFromToday.size()}
      Existen generados ${payments.size()} pagos de los cuales,
      hay ${waitingAndPendingPayments.size()} pagos en espera o pendientes,
      y ${payedPayments.size()} hechos o finiquitados...


      """
    }

    switch(Environment.current){
      case Environment.DEVELOPMENT:
        log.debug message
        break
      case Environment.TEST:
        break
      case Environment.PRODUCTION:
        mailService.sendMail {
          to "synergiers@googlegroups.com"
          from "cursos@synergyj.com"
          subject "Resumen de cursos a las ${dateFormat.format(new Date())}"
          body message
        }
      break
    }
  }
}
