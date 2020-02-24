$(function() {
	var arr = ['富强', '民主', '文明', '和谐', '自由', '平等', '公正', '法治', '爱国', '敬业', '诚信', '友善'];
	$("body").click(function(evt) {
		var index = parseInt(Math.random() * (arr.length));
		var txt = arr[index];
		var x = evt.clientX;
		var y = evt.clientY;
		var oldX = x + "px";
		var oldY = y + "px";
		var newY = (y - 45) + "px";
		$("<span>" + txt + "</span>").css({
				"position": "absolute",
				"left": oldX,
				"top": oldY,
				"color": "red",
				"font-size": "22px",
				"font-weight": "bold"
			})
			.appendTo("body")
			.animate({
				"top": newY
			}, 650)
			.fadeOut(150, function() {
				$(this).remove();
			});
	});
});