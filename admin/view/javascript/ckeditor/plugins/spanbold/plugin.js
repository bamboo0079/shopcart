CKEDITOR.plugins.add("spanbold", {
	init: function (c) {
		var e = 0,
			d = function (g, d, b, a) {
				if (a) {
					var a = new CKEDITOR.style(a),
						f = h[b];
					f.unshift(a);
					c.attachStyleStateChange(a, function (a) {
						!c.readOnly && c.getCommand(b)
							.setState(a)
					});
					c.addCommand(b, new CKEDITOR.styleCommand(a, {
						contentForms: f
					}));
					c.ui.addButton && c.ui.addButton(g, {
						label: d,
						command: b,
						icon:'plugins/spanbold/images/icon.png'
					})
				}
			},
			h = {
				spanbold: [["span",
					function (a) {
					}]],
			},
			b = c.config,
			a = c.lang.basicstyles;
		d("spanbold", "Span Bold", "spanbold", b.coreStyles_spanbold);
	}
});
CKEDITOR.config.coreStyles_spanbold = {
	 element: 'span', attributes: { 'class': 'bold' } 
};