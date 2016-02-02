/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.filebrowserBrowseUrl = 'index.php?route=common/filemanager';
	config.filebrowserImageBrowseUrl = 'index.php?route=common/filemanager';
	config.filebrowserFlashBrowseUrl = 'index.php?route=common/filemanager';
	config.filebrowserUploadUrl = 'index.php?route=common/filemanager';
	config.filebrowserImageUploadUrl = 'index.php?route=common/filemanager';
	config.filebrowserFlashUploadUrl = 'index.php?route=common/filemanager';			
	config.filebrowserWindowWidth = '1000';
	config.filebrowserWindowHeight = '500';
	
	config.htmlEncodeOutput = false;
	config.entities = false;
	
	config.enterMode = CKEDITOR.ENTER_BR;
	config.shiftEnterMode = CKEDITOR.ENTER_P;
	config.allowedContent = true;
	config.extraAllowedContent = '';
	config.basicEntities = false;
	config.entities_greek = false; 
	config.entities_latin = false; 
	config.entities_additional = '';
	//config.protectedSource.push( /<i[\s\S]*?\>/g ); //allows beginning <i> tag
  	//config.protectedSource.push( /<\/i[\s\S]*?\>/g ); //allows ending </i> tag
	
	config.extraPlugins = 'codemirror,spanbold,spanbluebold,spanredbold,spantime,spanblue,spanred,stylesheetparser-fixed';
	config.codemirror_theme = 'rubyblue';
	
	config.contentsCss = 'view/stylesheet/inline-text-styles.css';
	config.toolbar = 'Custom';
	
	config.toolbar_Custom = [
		['Source'],
		['Maximize','-','RemoveFormat'],
		['Outdent','Indent'],
		['Link','Unlink','Anchor'],
		['Image','Table'],
		['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
		'/',
		['time','blue','red','spanbluebold','spanredbold','spanbold','Bold','Italic','Underline','Strike','-','NumberedList','BulletedList'],
		['Styles','Format','FontSize'],
		
	];
	
	config.toolbar_Full = [
		['Source','-','Save','NewPage','Preview','-','Templates'],
		['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
		['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
		['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'],
		'/',
		['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
		['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
		['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
		['Link','Unlink','Anchor'],
		['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak'],
		'/',
		['Styles','Format','Font','FontSize'],
		['TextColor','BGColor'],
		['Maximize', 'ShowBlocks','-','About']
	];
	
};