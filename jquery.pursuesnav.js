(function($) {
	$.fn.pursuesnav = function(){
		var element = this, //приклеивающийся элемент
				height = element.outerHeight(), //высота элемента
				offset = element.offset().top, //отступ от верхней границы документа
				stick = height+offset; //момент приклеивания
				presc = 0, //зададим переменную для вычисления направления движения
				delta = 0; //зададим переменную дельты
		element.css({ //задаем css
			position: 'absolute',
			top: offset
		});

		$(window).scroll(function(){
			var sc = $(document).scrollTop();
			if(sc>0){
				if(presc<sc){delta = -1}
				else if(presc>sc){delta = 1}
  			else{delta = 0};
			}
			if(delta<0){// скрол вниз
				if(sc == element.offset().top){
					element.css({
						position: 'absolute',
						top:sc
					});
				}
				else if(sc>stick){
					element.css({
						position: 'absolute',
						top: sc-height
					});
				}
				
			}
			else if(delta>0){//скрол вверх
				stick = height+element.offset().top;
				if(sc <= element.offset().top){
					element.css({
						position: 'fixed',
						top: 0
					});
				}
			}
			presc = sc;
		});

			


			

	};
})(jQuery);