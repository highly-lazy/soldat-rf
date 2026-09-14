(function () {
	'use strict';

	/* ---------- Ленивая загрузка изображений (data-lazy-src) ---------- */
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
			return function (root) { list(root).forEach(show); };
		}

		var io = new IntersectionObserver(function (entries) {
			entries.forEach(function (entry) {
				if (!entry.isIntersecting) { return; }
				io.unobserve(entry.target);
				show(entry.target);
			});
		}, { rootMargin: '300px' });

		return function (root) {
			list(root).forEach(function (img) { io.observe(img); });
		};
	})();

	lazyImages();
	window.lazyImages = lazyImages;

	/* ---------- Мобильное меню ---------- */
	var burger = document.querySelector('.header__burger');
	var nav = document.getElementById('site-nav');
	if (burger && nav) {
		burger.addEventListener('click', function () {
			var open = burger.getAttribute('aria-expanded') === 'true';
			burger.setAttribute('aria-expanded', String(!open));
			document.body.classList.toggle('is-menu-open', !open);
		});
		nav.addEventListener('click', function (e) {
			if (e.target.closest('a')) {
				burger.setAttribute('aria-expanded', 'false');
				document.body.classList.remove('is-menu-open');
			}
		});
	}

	/* ---------- Вкладки выплат ---------- */
	document.querySelectorAll('[role="tablist"]').forEach(function (list) {
		var tabs = Array.prototype.slice.call(list.querySelectorAll('[role="tab"]'));
		if (!tabs.length) { return; }

		function select(tab) {
			tabs.forEach(function (t) {
				var on = t === tab;
				t.setAttribute('aria-selected', String(on));
				t.tabIndex = on ? 0 : -1;
				var panel = document.getElementById(t.getAttribute('aria-controls'));
				if (panel) { panel.hidden = !on; }
			});
		}

		list.addEventListener('click', function (e) {
			var tab = e.target.closest('[role="tab"]');
			if (tab) { select(tab); }
		});

		list.addEventListener('keydown', function (e) {
			var i = tabs.indexOf(document.activeElement);
			if (i < 0) { return; }
			var next = null;
			if (e.key === 'ArrowRight') { next = tabs[(i + 1) % tabs.length]; }
			if (e.key === 'ArrowLeft') { next = tabs[(i - 1 + tabs.length) % tabs.length]; }
			if (e.key === 'Home') { next = tabs[0]; }
			if (e.key === 'End') { next = tabs[tabs.length - 1]; }
			if (next) { e.preventDefault(); next.focus(); select(next); }
		});
	});

	/* ---------- Аккордеон «Ответы на вопросы» ---------- */
	document.querySelectorAll('.faq__btn').forEach(function (btn) {
		btn.addEventListener('click', function () {
			var open = btn.getAttribute('aria-expanded') === 'true';
			var panel = document.getElementById(btn.getAttribute('aria-controls'));
			btn.setAttribute('aria-expanded', String(!open));
			if (panel) { panel.hidden = open; }
			var item = btn.closest('.faq__item');
			if (item) { item.classList.toggle('is-open', !open); }
		});
	});

	/* ---------- Слайдеры на мобильном (scroll-snap + стрелки) ---------- */
	document.querySelectorAll('.benefits__slider, .steps__grid').forEach(function (track) {
		var section = track.closest('section');
		if (!section) { return; }
		var nav = section.querySelector('.benefits__nav, .steps__nav');
		if (!nav) { return; }
		var prev = nav.querySelector('.slider-btn--prev');
		var next = nav.querySelector('.slider-btn--next');
		var scroller = track.classList.contains('benefits__slider') ? track : track;

		function step() {
			var item = scroller.querySelector('.benefits__item, .steps__card');
			return item ? item.getBoundingClientRect().width + 20 : 349;
		}
		function sync() {
			var max = scroller.scrollWidth - scroller.clientWidth - 1;
			if (prev) { prev.disabled = scroller.scrollLeft <= 0; }
			if (next) { next.disabled = scroller.scrollLeft >= max; }
		}
		if (prev) { prev.addEventListener('click', function () { scroller.scrollBy({ left: -step(), behavior: 'smooth' }); }); }
		if (next) { next.addEventListener('click', function () { scroller.scrollBy({ left: step(), behavior: 'smooth' }); }); }
		scroller.addEventListener('scroll', sync, { passive: true });

		/* стрелки показываем только там, где слайдер реально прокручивается */
		function toggle() {
			var scrollable = scroller.scrollWidth > scroller.clientWidth + 1;
			nav.hidden = !scrollable;
			sync();
		}
		toggle();
		window.addEventListener('resize', toggle);
	});

	/* ---------- Выбор города ---------- */
	(function () {
		var CITIES = [
			'Москва', 'Санкт-Петербург', 'Новосибирск', 'Екатеринбург', 'Казань',
			'Нижний Новгород', 'Челябинск', 'Красноярск', 'Самара', 'Уфа',
			'Ростов-на-Дону', 'Омск', 'Краснодар', 'Воронеж', 'Пермь', 'Волгоград'
		];
		var STORE = 'soldat-city';
		var wraps = Array.prototype.slice.call(document.querySelectorAll('.city'));
		if (!wraps.length) { return; }

		function closeAll() {
			document.querySelectorAll('.city__list').forEach(function (l) { l.hidden = true; });
			document.querySelectorAll('.city [aria-expanded]').forEach(function (b) {
				b.setAttribute('aria-expanded', 'false');
			});
		}

		function apply(name) {
			document.querySelectorAll('.header__city-value').forEach(function (el) { el.textContent = name; });
			document.querySelectorAll('.city__item').forEach(function (b) {
				b.setAttribute('aria-selected', String(b.textContent === name));
			});
			try { localStorage.setItem(STORE, name); } catch (e) { /* приватный режим */ }
		}

		wraps.forEach(function (wrap) {
			var btn = wrap.querySelector('button');
			if (!btn) { return; }
			var list = document.createElement('ul');
			list.className = 'city__list';
			list.setAttribute('role', 'listbox');
			list.hidden = true;
			CITIES.forEach(function (name) {
				var li = document.createElement('li');
				var b = document.createElement('button');
				b.type = 'button';
				b.className = 'city__item';
				b.setAttribute('role', 'option');
				b.textContent = name;
				li.appendChild(b);
				list.appendChild(li);
			});
			wrap.appendChild(list);

			btn.addEventListener('click', function (e) {
				e.stopPropagation();
				var wasOpen = !list.hidden;
				closeAll();
				if (!wasOpen) {
					list.hidden = false;
					btn.setAttribute('aria-expanded', 'true');
				}
			});
			list.addEventListener('click', function (e) {
				var item = e.target.closest('.city__item');
				if (!item) { return; }
				apply(item.textContent);
				closeAll();
			});
		});

		document.addEventListener('click', closeAll);
		document.addEventListener('keydown', function (e) { if (e.key === 'Escape') { closeAll(); } });

		var saved = 'Москва';
		try { saved = localStorage.getItem(STORE) || saved; } catch (e) { /* приватный режим */ }
		if (CITIES.indexOf(saved) < 0) { saved = 'Москва'; }
		apply(saved);
	})();

	/* ---------- Вкладки «Для граждан РФ / Для иностранцев» ---------- */
	document.querySelectorAll('.faq__tabs').forEach(function (box) {
		var tabs = Array.prototype.slice.call(box.querySelectorAll('.list__tab'));
		box.addEventListener('click', function (e) {
			var tab = e.target.closest('.list__tab');
			if (!tab) { return; }
			tabs.forEach(function (t) {
				var on = t === tab;
				if (on) { t.setAttribute('aria-current', 'true'); } else { t.removeAttribute('aria-current'); }
				var panel = document.getElementById(t.getAttribute('aria-controls'));
				if (panel) { panel.hidden = !on; }
			});
		});
	});

	/* ---------- Фильтр статей по рубрикам ---------- */
	(function () {
		var box = document.querySelector('.list__tabs');
		if (!box) { return; }
		var tabs = Array.prototype.slice.call(box.querySelectorAll('.list__tab'));
		var cards = Array.prototype.slice.call(document.querySelectorAll('.list__grid .art__card'));
		box.addEventListener('click', function (e) {
			var tab = e.target.closest('.list__tab');
			if (!tab) { return; }
			tabs.forEach(function (t) {
				if (t === tab) { t.setAttribute('aria-current', 'true'); } else { t.removeAttribute('aria-current'); }
			});
			var cat = tab.getAttribute('data-cat') || '';
			cards.forEach(function (card) {
				card.hidden = !!cat && card.getAttribute('data-cat') !== cat;
			});
		});
	})();

	/* ---------- Маска телефона ---------- */
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
