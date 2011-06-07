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
package com.synergyj.grain.course

import com.synergyj.grain.course.CourseModule

class ModuleTopic extends CourseContent implements Comparable<ModuleTopic> {
	CourseModule module
	ModuleTopic parent
	Integer order
	SortedSet topics
	
	static hasMany = [topics:ModuleTopic]
	static belongsTo = [module:CourseModule,parent:ModuleTopic]
	
	static constraints = {
		module nullable:false
		parent nullable:true
		order nullable:false,range:1..15
	}
	
	static mapping = {
		order column:"topic_order"
	}
	
	int compareTo(ModuleTopic other){
		order - other.order
	}
	
	String toString() {
		name
	}
}