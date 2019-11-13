package org.jonpas.asel.ui.wizard;

import org.eclipse.osgi.util.NLS;

public class Messages extends NLS {
	private static final String BUNDLE_NAME = "org.jonpas.asel.ui.wizard.messages"; //$NON-NLS-1$
	
	public static String SourceFile_Label;
	public static String SourceFile_Description;
	public static String PageSourceFile_Label;
	public static String PageSourceFile_Description;
	public static String PageStyleFile_Label;
	public static String PageStyleFile_Description;
	public static String LEDProject_Label;
	public static String LEDProject_Description;
	public static String EmptyProject_Label;
	public static String EmptyProject_Description;
	
	static {
	// initialize resource bundle
	NLS.initializeMessages(BUNDLE_NAME, Messages.class);
	}

	private Messages() {
	}
}
