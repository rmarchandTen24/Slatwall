<!---

    Slatwall - An Open Source eCommerce Platform
    Copyright (C) 2011 ten24, LLC

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this library statically or dynamically with other modules is
    making a combined work based on this library.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
 
    As a special exception, the copyright holders of this library give you
    permission to link this library with independent modules to produce an
    executable, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting executable under
    terms of your choice, provided that you also meet, for each linked
    independent module, the terms and conditions of the license of that
    module.  An independent module is a module which is not derived from
    or based on this library.  If you modify this library, you may extend
    this exception to your version of the library, but you are not
    obligated to do so.  If you do not wish to do so, delete this
    exception statement from your version.

Notes:

--->
<cfif thisTag.executionMode is "start">
	<cfparam name="attributes.object" type="any" />
	<cfparam name="attributes.saveAction" type="string" default="#request.context.saveaction#" />
	<cfparam name="attributes.saveActionQueryString" type="string" default="" />
	<cfparam name="attributes.edit" type="boolean" default="false" />
	<cfparam name="attributes.enctype" type="string" default="application/x-www-form-urlencoded">
	
	<cfoutput>
		<cfif attributes.edit>
			<cfif len(attributes.saveActionQueryString)>
				<form method="post" action="?s=1&#attributes.saveActionQueryString#" class="form-horizontal" enctype="#attributes.enctype#">
			<cfelse>
				<form method="post" action="?s=1" class="form-horizontal" enctype="#attributes.enctype#">
			</cfif>
			<cfif structKeyExists(request.context, "returnAction") and len(request.context.returnAction)>
				<input type="hidden" name="returnAction" value="#request.context.returnAction#" />
			</cfif>
			<input type="hidden" name="slatAction" value="#attributes.saveaction#" />
			<input type="hidden" name="#attributes.object.getPrimaryIDPropertyName()#" value="#attributes.object.getPrimaryIDValue()#" />
		</cfif>
		<cfif structKeyExists(request.context, "modal") and request.context.modal>
			<div class="modal-header">
				<a class="close" data-dismiss="modal">&times;</a>
				<h3>#request.context.pageTitle#</h3>
			</div>
			<div class="modal-body">
		</cfif>
	</cfoutput>
<cfelse>
	<cfoutput>
		<cfif structKeyExists(request.context, "modal") and request.context.modal>
			</div>
			<div class="modal-footer">
				<cfif attributes.edit>
					<div class="btn-group">
						<a href="##" class="btn btn-inverse" data-dismiss="modal"><i class="icon-remove icon-white"></i> #request.slatwallScope.rbKey('define.cancel')#</a>
						<button type="submit" class="btn btn-success"><i class="icon-ok icon-white"></i> #request.slatwallScope.rbKey('define.save')#</button>
					</div>
				</cfif>
			</div>
		</cfif>
		<cfif attributes.edit>
			</form>
		</cfif>
	</cfoutput>
</cfif>