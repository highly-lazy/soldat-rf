(function () {
	'use strict';

	/* ---------- Ленивая загрузка изображений (data-lazy-src) ---------- */
	/* В разметке у каждой <img> стоит прозрачный 1×1 GIF в src и настоящий путь
	   в data-lazy-src. Ширина/высота заданы атрибутами, поэтому подмена
	   картинки не сдвигает вёрстку. */
	var lazyImages = (function () {
		var SEL = 'img[data-lazy-src]';

		function list(root) {
			return Array.prototype.slice.call((root || document).querySelectorAll(SEL));
		}

		function show(img) {
			var src = img.getAttribute('data-lazy-src');
			if (!src) { return; }
			img.removeAttribute('data-lazy-src');
			var srcset = img.getAttribute('data-lazy-srcset');
			if (srcset) {
				img.removeAttribute('data-lazy-srcset');
				img.srcset = srcset;
			}
			img.src = src;
		}

		if (!('IntersectionObserver' in window)) {
			/* старые браузеры: грузим всё сразу */
			return function (root) { list(root).forEach(show); };
		}

		var io = new IntersectionObserver(function (entries) {
			entries.forEach(function (entry) {
				if (!entry.isIntersecting) { return; }
				io.unobserve(entry.target);
				show(entry.target);
			});
		}, { rootMargin: '300px' });   /* запас, чтобы картинка успела прийти до появления */

		return function (root) {
			list(root).forEach(function (img) { io.observe(img); });
		};
	})();

	lazyImages();
	/* DLE подгружает контент аяксом (пагинация, «показать ещё») — после этого
	   достаточно вызвать window.lazyImages(контейнер) */
	window.lazyImages = lazyImages;

	/* ---------- Mobile menu ---------- */
	var burger = document.querySelector('.header__burger');
	var nav = document.getElementById('site-nav');

	if (burger && nav) {
		burger.addEventListener('click', function () {
			var open = nav.classList.toggle('is-open');
			burger.setAttribute('aria-expanded', String(open));
		});

		nav.addEventListener('click', function (e) {
			if (e.target.closest('a')) {
				nav.classList.remove('is-open');
				burger.setAttribute('aria-expanded', 'false');
			}
		});
	}

	/* ---------- Sticky header ---------- */
	var header = document.querySelector('.header');
	if (header) {
		var onScroll = function () {
			header.classList.toggle('is-stuck', window.scrollY > 120);
		};
		window.addEventListener('scroll', onScroll, { passive: true });
		onScroll();
	}


	/* ---------- Слайдер «Полезные материалы» ---------- */
	var sliderEl = document.querySelector('.materials__slider');
	if (sliderEl && typeof Swiper !== 'undefined') {
		new Swiper(sliderEl, {
			slidesPerView: 'auto',
			spaceBetween: 39,          // шаг карточек из макета: 672 − 533 = 39
			speed: 450,
			grabCursor: true,
			watchOverflow: true,
			keyboard: {enabled: true},
			a11y: {
				prevSlideMessage: 'Предыдущий материал',
				nextSlideMessage: 'Следующий материал'
			},
			navigation: {
				prevEl: '.materials__nav-btn--prev',
				nextEl: '.materials__nav-btn--next'
			},
			breakpoints: {
				0:    {spaceBetween: 16},
				601:  {spaceBetween: 24},
				1201: {spaceBetween: 39}
			}
		});
	}

	/* ---------- Tabs (выплаты) ---------- */
	document.querySelectorAll('[role="tablist"]').forEach(function (list) {
		var tabs = Array.prototype.slice.call(list.querySelectorAll('[role="tab"]'));

		var select = function (tab) {
			tabs.forEach(function (t) {
				var on = t === tab;
				t.setAttribute('aria-selected', String(on));
				t.tabIndex = on ? 0 : -1;
				var id = t.getAttribute('aria-controls');
				var panel = id && document.getElementById(id);
				if (panel) { panel.hidden = !on; }
			});
		};

		list.addEventListener('click', function (e) {
			var tab = e.target.closest('[role="tab"]');
			if (tab && tab.getAttribute('aria-disabled') !== 'true') { select(tab); }
		});

		list.addEventListener('keydown', function (e) {
			var i = tabs.indexOf(document.activeElement);
			if (i < 0) return;
			var next = e.key === 'ArrowRight' ? i + 1 : e.key === 'ArrowLeft' ? i - 1 : -1;
			if (next < 0) return;
			e.preventDefault();
			var target = tabs[(next + tabs.length) % tabs.length];
			target.focus();
			if (target.getAttribute('aria-disabled') !== 'true') { select(target); }
		});
	});

	/* ---------- Phone mask ---------- */
	document.querySelectorAll('input[type="tel"]').forEach(function (input) {
		input.addEventListener('input', function () {
			var d = input.value.replace(/\D/g, '').replace(/^[78]/, '');
			var out = '+7';
			if (d.length) { out += ' (' + d.slice(0, 3); }
			if (d.length >= 4) { out += ') ' + d.slice(3, 6); }
			if (d.length >= 7) { out += '-' + d.slice(6, 8); }
			if (d.length >= 9) { out += '-' + d.slice(8, 10); }
			input.value = out;
		});
	});
})();
