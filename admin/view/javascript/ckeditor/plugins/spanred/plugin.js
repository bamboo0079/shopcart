CKEDITOR.plugins.add("spanred", {
	init: function (c) {
		var e = 0,
			d = function (g, d, b, a) {
				if (a) {
					var a = new CKEDITOR.style(a),
						f = h[b];
					//f.unshift(a);
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
						icon:'plugins/spanred/images/icon.png'
					})
				}
			},
			h = {
				red: [["span",
					function (a) {
						a = a.styles["color"];
						return "red" == a
					}]],
			},
			b = c.config,
			a = c.lang.basicstyles;
		d("red", "Span Red", "red", b.coreStyles_red);
	}
});
CKEDITOR.config.coreStyles_red = {
	 element: 'span', attributes: { 'class': 'red' } 
};