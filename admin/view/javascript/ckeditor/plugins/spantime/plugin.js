CKEDITOR.plugins.add("spantime", {
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
						icon:'plugins/spantime/images/icon.png'
					})
				}
			},
			h = {
				time: [["span",
					function (a) {
						a = a.styles["color"];
						return "blue" == a
					}]],
			},
			b = c.config,
			a = c.lang.basicstyles;
		d("time", "Span Time", "time", b.coreStyles_time);
	}
});
CKEDITOR.config.coreStyles_time = {
	 element: 'span', attributes: { 'class': 'time' } 
};