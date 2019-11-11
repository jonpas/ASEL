/*
 * generated by Xtext 2.19.0
 */
package org.jonpas.asel.ui.quickfix

import org.eclipse.xtext.ui.editor.quickfix.DefaultQuickfixProvider
import org.eclipse.xtext.ui.editor.quickfix.Fix
import org.jonpas.asel.validation.ASELValidator
import org.eclipse.xtext.validation.Issue
import org.eclipse.xtext.ui.editor.quickfix.IssueResolutionAcceptor

/**
 * Custom quickfixes.
 *
 * See https://www.eclipse.org/Xtext/documentation/310_eclipse_support.html#quick-fixes
 */
class ASELQuickfixProvider extends DefaultQuickfixProvider {

	@Fix(ASELValidator.INVALID_PIN_NAME)
	def capitalizePinName(Issue issue, IssueResolutionAcceptor acceptor) {
		acceptor.accept(issue, 'Convert to all-caps', 'Convert to all capitals.', 'upcase.png') [
			context |
			val xtextDocument = context.xtextDocument
			val firstLetter = xtextDocument.get(issue.offset, issue.length)
			xtextDocument.replace(issue.offset, issue.length, firstLetter.toUpperCase)
		]
	}

	/*@Fix(ASELValidator....)
	def makeUniqueName() {
		
	}*/
}
