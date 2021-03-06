/*
 * generated by Xtext 2.19.0
 */
package org.jonpas.asel.ide

import com.google.inject.Guice
import org.eclipse.xtext.util.Modules2
import org.jonpas.asel.ASELRuntimeModule
import org.jonpas.asel.ASELStandaloneSetup

/**
 * Initialization support for running Xtext languages as language servers.
 */
class ASELIdeSetup extends ASELStandaloneSetup {

	override createInjector() {
		Guice.createInjector(Modules2.mixin(new ASELRuntimeModule, new ASELIdeModule))
	}
	
}
