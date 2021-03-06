/*
 * Copyright 2002-2011 the original author or authors.
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
package com.synergyj.grain.ui

/**
 * This class storages the link params to build a MenuItem.
 */
class LinkParam implements Serializable {
  public static final String CONTROLLER = 'controller'
  public static final String ACTION = 'action'
  public static final String ID = 'id'
  public static final String URL = 'url'
  public static final String MAPPING = 'mapping'
  String name
  String value

  static transients = ['CONTROLLER', 'ACTION']
  static belongsTo = [menuItem: MenuItem]

  static constraints = {
    name nullable: false, blank: false, minSize: 1, maxSize: 100
    value nullable: false, blank: false, minSize: 1, maxSize: 100
  }

  static mapping = {
    table 'gr_link_params'
    cache true
  }

  public String toString() {
    "${name}:${value}"
  }

  def static url(url) {
    new LinkParam(name: URL, value: url)
  }

  def static controller(controller) {
    new LinkParam(name: CONTROLLER, value: controller)
  }

  def static action(action) {
    new LinkParam(name: ACTION, value: action)
  }

  def static id(id) {
    new LinkParam(name: ID, value: id)
  }

  def static mapping(mapping) {
    new LinkParam(name: MAPPING, value: mapping)
  }
}
