CKEDITOR.plugins.add("spanbluebold", {
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
						icon:'plugins/spanbluebold/images/icon.png'
					})
				}
			},
			h = {
				spanbluebold: [["span",
					function (a) {
						return "underline" == a.styles["text-decoration"]
					}]],
			},
			b = c.config,
			a = c.lang.basicstyles;
		d("spanbluebold", "Span Blue Bold", "spanbluebold", b.coreStyles_bluebold);
	}
});
CKEDITOR.config.coreStyles_bluebold = {
	 element: 'span', attributes: { 'class': 'bluebold' } 
};