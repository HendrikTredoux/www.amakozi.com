/*
 * @file change event plugin for CKEditor
 * Copyright (C) 2011 Alfonso Martínez de Lizarrondo
 *
 * == BEGIN LICENSE ==
 *
 * Licensed under the terms of any of the following licenses at your
 * choice:
 *
 *  - GNU General Public License Version 2 or later (the "GPL")
 *    http://www.gnu.org/licenses/gpl.html
 *
 *  - GNU Lesser General Public License Version 2.1 or later (the "LGPL")
 *    http://www.gnu.org/licenses/lgpl.html
 *
 *  - Mozilla Public License Version 1.1 or later (the "MPL")
 *    http://www.mozilla.org/MPL/MPL-1.1.html
 *
 * == END LICENSE ==
 http://alfonsoml.blogspot.com/2011/03/onchange-event-for-ckeditor.html
 Joe Audette removed some of the event listening as it seems to slow things down , modified to only fire the event once since this is all we need to know if it was changed
 *
 */

 // Keeps track of changes to the content and fires a "change" event
CKEDITOR.plugins.add( 'onchange',
{
	init : function( editor )
	{
		// Test:
//		editor.on( 'change', function(e) { console.log(e) });

		var timer;
		var firedOnce = false;
		// Avoid firing the event too often
		function somethingChanged()
		{
			if ((firedOnce)||(timer))
				return;

			timer = setTimeout( function() {
				timer = 0;
				editor.fire( 'change' );
				firedOnce = true;
			}, editor.config.minimumChangeMilliseconds || 1000);
		}

		// Set several listeners to watch for changes to the content
		editor.on( 'saveSnapshot', function(e) { somethingChanged(); });
		//editor.on( 'afterUndo', function(e) { somethingChanged(); });
		//editor.on( 'afterRedo', function(e) { somethingChanged(); });

		editor.on( 'contentDom', function()
			{
				editor.document.on( 'keydown', function( event )
					{
						if(firedOnce)return;
						// Do not capture CTRL hotkeys.
						if ( !event.data.$.ctrlKey && !event.data.$.metaKey )
							somethingChanged();
					});

					// Firefox OK
				editor.document.on( 'drop', function()
					{
						somethingChanged();
					});
					// IE OK
				editor.document.getBody().on( 'drop', function()
					{
						somethingChanged();
					});
			});
			
		editor.on( 'afterCommandExec', function( event )
		{
			if(firedOnce)return;
			if ( event.data.command.canUndo !== false )
				somethingChanged();
		} );


	} //Init
} );
