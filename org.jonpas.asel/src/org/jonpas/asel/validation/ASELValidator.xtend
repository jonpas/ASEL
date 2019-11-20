/*
 * generated by Xtext 2.19.0
 */
package org.jonpas.asel.validation

import org.eclipse.xtext.validation.Check

import org.eclipse.core.runtime.Path
import org.eclipse.core.resources.ResourcesPlugin

import org.jonpas.asel.asel.AselPackage
import org.jonpas.asel.asel.Init
import org.jonpas.asel.asel.InitCode
import org.jonpas.asel.asel.InitPin
import org.jonpas.asel.asel.InitSingle
import org.jonpas.asel.asel.InitArray
import org.jonpas.asel.asel.InitWiFi
import org.jonpas.asel.asel.VarAssign
import org.jonpas.asel.asel.ValueBool
import org.jonpas.asel.asel.ValueInt

/**
 * This class contains custom validation rules. 
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
class ASELValidator extends AbstractASELValidator {

	public static val INVALID_PIN_NAME = 'invalidPinName'

	public static val MISSING_WIFI_PAGE = 'missingWiFiPage'
	public static val MISSING_WIFI_STYLE = 'missingWiFiStyle'

	public static val INVALID_ARRAY_LENGTH = 'invalidArrayLength'

	public static val EXCESSIVE_SIGN = 'excessiveSign'
	public static val INVALID_ASSIGN_NEGATION = 'invalidAssignNegation'

	public static val NON_UNIQUE_NAME = 'nonUniqueName'

	@Check
	def checkPinNameIsAllCaps(InitPin pin) {
		for (var i = 0; i < pin.name.length(); i++) {
			if (!Character.isUpperCase(pin.name.charAt(i))) {
				warning('Pin name should be all capitals', AselPackage.Literals.INIT_PIN__NAME, INVALID_PIN_NAME)
				return
			}
		}
	}

	@Check
	def checkWiFiFilesExist(InitWiFi wifi) {
		val platformString = wifi.eResource.URI.toPlatformString(true);
		val myFile = ResourcesPlugin.getWorkspace().getRoot().getFile(new Path(platformString));
		val proj = myFile.getProject();

		if (wifi.pageFile != "") {
			if (!proj.getFile(wifi.pageFile).exists) {
				error('Page file "' + wifi.pageFile + '" is missing', AselPackage.Literals.INIT_WI_FI__PAGE_FILE,
					MISSING_WIFI_PAGE)
			}
		}

		if (wifi.styleFile != "") {
			if (!proj.getFile(wifi.styleFile).exists) {
				error('Style file "' + wifi.styleFile + '" is missing', AselPackage.Literals.INIT_WI_FI__STYLE_FILE,
					MISSING_WIFI_STYLE)
			}
		}
	}

	@Check
	def checkArrayInitLength(InitArray array) {
		val initLength = array.value.length
		val intLength = array.data.length

		if (initLength > 0) {
			if (intLength > 0 && intLength != 1 && intLength != initLength) {
				error(
					'Incorrect amount of elements in array initializer (' + initLength + ' given, expecting ' +
						intLength + ') [INT]', AselPackage.Literals.INIT_ARRAY__VALUE, INVALID_ARRAY_LENGTH)
			} else if (array.data.variable !== null) {
				val idLength = (array.data.variable.single.value.value.value as ValueInt).value
				if (idLength != "" && idLength != 1 && idLength != initLength) {
					error(
						'Incorrect amount of elements in array initializer (' + initLength + ' given, expecting ' +
							idLength + ') [ID]', AselPackage.Literals.INIT_ARRAY__VALUE, INVALID_ARRAY_LENGTH)
				}
			}
		}
	}

	@Check
	def checkVarInitSign(InitSingle variable) {
		if (variable.sign == '+') {
			warning('Excessive \'+\' sign', AselPackage.Literals.INIT_SINGLE__SIGN, EXCESSIVE_SIGN)
		}

		val bool = variable.value.value.value instanceof ValueBool;
		val id = variable.value.value.name;
		if (variable.sign == '!' && !bool && id === null) {
			error('Invalid negation (non-boolean)', AselPackage.Literals.INIT_SINGLE__SIGN, INVALID_ASSIGN_NEGATION)
		}
	}

	@Check
	def checkVarAssignSign(VarAssign variable) {
		if (variable.sign == '+') {
			warning('Excessive \'+\' sign', AselPackage.Literals.VAR_ASSIGN__SIGN, EXCESSIVE_SIGN)
		}

		val bool = variable.value.value.value instanceof ValueBool;
		val id = variable.value.value.name;
		if (variable.sign == '!' && !bool && id === null) {
			error('Invalid negation (non-boolean)', AselPackage.Literals.VAR_ASSIGN__SIGN, INVALID_ASSIGN_NEGATION)
		}
	}

	@Check
	def checkNamesAreUnique(Init init) {
		val names = newHashSet

		for (code : init.code) {
			if (code !== null && code instanceof InitCode) {
				val initCode = code as InitCode

				val pin = initCode.pin
				if (pin !== null) {
					if (!names.add(pin.name)) {
						error('Pin name \'' + pin.name + '\' not unique!', pin, AselPackage.Literals.INIT_PIN__NAME,
							NON_UNIQUE_NAME)
					}
				}

				val variable = initCode.variable
				if (variable !== null) {
					if (!names.add(variable.name)) {
						error('Variable name \'' + variable.name + '\' not unique!', variable,
							AselPackage.Literals.INIT_VAR__NAME, NON_UNIQUE_NAME)
					}
				}

				val class = initCode.class_
				if (class !== null) {
					if (!names.add(class.name)) {
						error('Class name \'' + class.name + '\' not unique!', class,
							AselPackage.Literals.INIT_CLASS__NAME, NON_UNIQUE_NAME)
					}
				}

				val pageHandle = initCode.pageHandle
				if (pageHandle !== null) {
					if (!names.add(pageHandle.name)) {
						error('Page handler name \'' + pageHandle.name + '\' not unique!', pageHandle,
							AselPackage.Literals.PAGE_HANDLER__NAME, NON_UNIQUE_NAME)
					}
				}
			}
		}
	}
}
