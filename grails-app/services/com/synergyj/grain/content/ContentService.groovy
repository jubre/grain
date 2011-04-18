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
package com.synergyj.grain.content

import net.sf.ehcache.Ehcache
import net.sf.ehcache.CacheManager
import net.sf.ehcache.Element

class ContentService {

  static transactional = false
  static profiled = true

  static Ehcache genericContent = CacheManager.getInstance().getCache("genericContent")

  def findContent(key, language) {
    def result
    def lookup = key + language
    result = genericContent.get(lookup)?.value
    if (!result) {
      def c = Content.findByKeyAndLanguage(key, language)
      if (c) {
        genericContent.put(new Element(lookup, c))
        result = c
      } else {
        result = genericContent.get(key)?.value
        if (!result) {
          c = Content.findByKey(key)
          if (c) {
            genericContent.put(new Element(lookup, c))
            result = c
          }
        }
      }
    }

    result
  }
}
