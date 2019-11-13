/*
 * generated by Xtext 2.19.0
 */
package org.jonpas.asel.ui.wizard


import org.eclipse.xtext.ui.wizard.template.FileTemplate
import org.eclipse.xtext.ui.wizard.template.IFileGenerator
import org.eclipse.xtext.ui.wizard.template.IFileTemplateProvider

/**
 * Create a list with all file templates to be shown in the template new file wizard.
 * 
 * Each template is able to generate one or more files.
 */
class ASELFileTemplateProvider implements IFileTemplateProvider {
	override getFileTemplates() {
		#[new SourceFile, new PageSourceFile, new PageStyleFile]
	}
}

@FileTemplate(label="ASEL Source", icon="file_template.png", description="Create a source file for ASEL.")
final class SourceFile {
	override generateFiles(IFileGenerator generator) {
		generator.generate('''«folder»/«name».asel''', '''
				# Runs always before anything else, outside of `prepare` and `run`
				init {
					
				}

				# Runs once on power on or reset
				prepare {
					
				}

				# Loops forever
				run {
					
				}
		''')
	}
}

@FileTemplate(label="Page Source", icon="file_template.png", description="Create a page HTML file for ASEL.")
final class PageSourceFile {
	val title = text("Title", "My Page", "Title of the page")

	override generateFiles(IFileGenerator generator) {
		generator.generate('''«folder»/«name».html''', '''
			<!DOCTYPE html>
			<html>
			  <head>
			    <meta charset="UTF-8" name="viewport", content="width=device-width, initial-scale=1">
			    <title>«title»</title>
			    <style type="text/css">{{STYLE}}</style>
			  </head>
			  <body>
			    <div class="buttons">
			      <p><a class="button" href="/?mybutton">{{MYBUTTON}}</a></p>
			    </div>
			  </body>
			</html>
		''')
	}
}

@FileTemplate(label="Page Style", icon="file_template.png", description="Create a page CSS file for ASEL.")
final class PageStyleFile {
	val font = text("Font", "Arial", "Font used on the page")

	override generateFiles(IFileGenerator generator) {
		generator.generate('''«folder»/«name».css''', '''
			body {
			  -webkit-appearance: none;
			}
			p {
			  font-family: '«font»', sans-serif;
			  text-align: center;
			}
			.buttons a {
			  text-decoration: none;
			}
			.button {
			  display: block;
			  width: 150px;
			  margin: 10px auto;
			  padding: 7px 13px;
			  text-aling: center;
			  background: #668ad8;
			  font-size: 20px;
			  color: #ffffff;
			  white-space: nowrap;
			  box-sizing: border-box;
			  -webkit-box-sizing: border-box;
			  -moz-box-sizing: border-box;
			}
			.button:active {
			  font-weight: bold;
			  vertical-align: top;
			  padding: 8px 13px 6px;
			}
		''')
	}
}