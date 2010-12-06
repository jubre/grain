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
package com.synergyj.grain.ui

/**
 * This class storages the link params to build a MenuItem.
 */
class LinkParam {
  String name
  String value

  static belongsTo = [menuItem: MenuItem]

  static constraints = {
    name nullable: false, blank: false, minSize: 1, maxSize: 100
    value nullable: false, blank: false, minSize: 1, maxSize: 100
  }

  public String toString() {
    "${name}:${value}"
  }
}
