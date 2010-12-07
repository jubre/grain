/*
 * Copyright 2002-2010 the original author or authors.
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
package com.synergyj.grain.content

import org.springframework.beans.propertyeditors.LocaleEditor

class ContentController {

  def index = { redirect(action: "list", params: params) }

  // the delete, save and update actions only accept POST requests
  static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

  def list = {
    params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
    [contentInstanceList: Content.list(params), contentInstanceTotal: Content.count()]
  }

  def create = {
    def contentInstance = new Content()
    contentInstance.properties = params
    contentInstance.language = params.locale?.language
    return [contentInstance: contentInstance]
  }

  def save = {
    def contentInstance = new Content(params)
    def localeEditor = new LocaleEditor()
    localeEditor.setAsText(params.locale)
    def loc = localeEditor.value
    contentInstance.language = loc.getLanguage()

    if (!contentInstance.hasErrors() && contentInstance.save()) {
      flash.message = "content.created"
      flash.args = [contentInstance.id]
      flash.defaultMessage = "Content ${contentInstance.id} created"
      redirect(action: "show", id: contentInstance.id)
    }
    else {
      render(view: "create", model: [contentInstance: contentInstance])
    }
  }

  def show = {
    def contentInstance = Content.get(params.id)
    if (!contentInstance) {
      flash.message = "content.not.found"
      flash.args = [params.id]
      flash.defaultMessage = "Content not found with id ${params.id}"
      redirect(action: "list")
    }
    else {
      return [contentInstance: contentInstance]
    }
  }

  def edit = {
    def contentInstance = Content.get(params.id)
    if (!contentInstance) {
      flash.message = "content.not.found"
      flash.args = [params.id]
      flash.defaultMessage = "Content not found with id ${params.id}"
      redirect(action: "list")
    }
    else {
      return [contentInstance: contentInstance]
    }
  }

  def update = {
    def contentInstance = Content.get(params.id)
    if (contentInstance) {
      if (params.version) {
        def version = params.version.toLong()
        if (contentInstance.version > version) {

          contentInstance.errors.rejectValue("version", "content.optimistic.locking.failure", "Another user has updated this Content while you were editing")
          render(view: "edit", model: [contentInstance: contentInstance])
          return
        }
      }
      contentInstance.properties = params
      def localeEditor = new LocaleEditor()
      localeEditor.setAsText(params.locale)
      def loc = localeEditor.value
      contentInstance.language = loc.getLanguage()
      if (!contentInstance.hasErrors() && contentInstance.save()) {
        flash.message = "content.updated"
        flash.args = [params.id]
        flash.defaultMessage = "Content ${params.id} updated"
        redirect(action: "show", id: contentInstance.id)
      }
      else {
        render(view: "edit", model: [contentInstance: contentInstance])
      }
    }
    else {
      flash.message = "content.not.found"
      flash.args = [params.id]
      flash.defaultMessage = "Content not found with id ${params.id}"
      redirect(action: "edit", id: params.id)
    }
  }

  def delete = {
    def contentInstance = Content.get(params.id)
    if (contentInstance) {
      try {
        contentInstance.delete()
        flash.message = "content.deleted"
        flash.args = [params.id]
        flash.defaultMessage = "Content ${params.id} deleted"
        redirect(action: "list")
      }
      catch (org.springframework.dao.DataIntegrityViolationException e) {
        flash.message = "content.not.deleted"
        flash.args = [params.id]
        flash.defaultMessage = "Content ${params.id} could not be deleted"
        redirect(action: "show", id: params.id)
      }
    }
    else {
      flash.message = "content.not.found"
      flash.args = [params.id]
      flash.defaultMessage = "Content not found with id ${params.id}"
      redirect(action: "list")
    }
  }
}
