﻿/*

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

*/
component displayname="PermissionGroup" entityname="SlatwallPermissionGroup" table="SlatwallPermissionGroup" persistent="true" extends="BaseEntity" hb_permission="this" {
	
	// Persistent Properties
	property name="permissionGroupID" ormtype="string" length="32" fieldtype="id" generator="uuid" unsavedvalue="" default="";
	property name="permissionGroupName" ormtype="string";
	property name="permissions" ormtype="string" length="8000";
	
	// Related Object Properties (many-to-many - inverse)
	property name="accounts" singularname="account" cfc="Account" fieldtype="many-to-many" linktable="SlatwallAccountPermissionGroup" fkcolumn="permissionGroupID" inversejoincolumn="accountID" inverse="true";

	// Audit properties
	property name="createdDateTime" hb_editable="false" ormtype="timestamp";
	property name="createdByAccount" hb_editable="false" cfc="Account" fieldtype="many-to-one" fkcolumn="createdByAccountID";
	property name="modifiedDateTime" hb_editable="false" ormtype="timestamp";
	property name="modifiedByAccount" hb_editable="false" cfc="Account" fieldtype="many-to-one" fkcolumn="modifiedByAccountID";
	
	
	// ============ START: Non-Persistent Property Methods =================
	
	// ============  END:  Non-Persistent Property Methods =================
		
	// ============= START: Bidirectional Helper Methods ===================
	
	// Accounts (many-to-many - inverse)
	public void function addAccount(required any account) {
		arguments.account.addPermissionGroup( this );
	}
	public void function removeAccount(required any account) {
		arguments.account.removePermissionGroup( this );
	}
	
	// =============  END:  Bidirectional Helper Methods ===================

	// =============== START: Custom Validation Methods ====================
	
	// ===============  END: Custom Validation Methods =====================
	
	// =============== START: Custom Formatting Methods ====================
	
	// ===============  END: Custom Formatting Methods =====================
	
	// ============== START: Overridden Implicet Getters ===================
	
	// ==============  END: Overridden Implicet Getters ====================

	// ================== START: Overridden Methods ========================
	
	public any function isDeletable() {
		if(!isNull(getPermissions()) && getPermissions() eq "*") {
			return false;
		}
		return super.isDeletable();
	}
	
	// ==================  END:  Overridden Methods ========================
	
	// =================== START: ORM Event Hooks  =========================
	
	// ===================  END:  ORM Event Hooks  =========================
	
}
