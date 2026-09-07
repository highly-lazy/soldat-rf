<header class="header">
	<!-- верхняя строка: город, телефон, мессенджеры (макет y 0…50) -->
	<div class="header__top">
		<div class="container header__top-inner">
			<div class="city">
			<button class="header__city" type="button" aria-label="Выбрать город" aria-haspopup="listbox" aria-expanded="false">
				<svg class="header__city-pin" viewBox="0 0 15 21" fill="none" aria-hidden="true">
					<path d="M7.5 20s6.5-7.2 6.5-12.2A6.5 6.5 0 0 0 1 7.8C1 12.8 7.5 20 7.5 20Z" stroke="currentColor" stroke-width="1.6"/>
					<circle cx="7.5" cy="7.8" r="2.4" stroke="currentColor" stroke-width="1.6"/>
				</svg>
				<span class="header__city-label">Город:</span>
				<span class="header__city-value">Москва</span>
				<svg class="header__city-caret" viewBox="0 0 18 18" fill="none" aria-hidden="true">
					<path d="M7.71 3.75 12.96 9l-5.25 5.25" stroke="currentColor" stroke-width="1.6" stroke-linejoin="bevel"/>
				</svg>
			</button>
			</div>

			<div class="header__contacts">
				<a class="header__phone" href="tel:+74954450117">
					<img class="header__phone-icon" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-lazy-src="{theme}/images/icon-phone-out.svg" alt="" width="21" height="21" decoding="async" loading="lazy">
					<span>8 (495) 445-01-17</span>
				</a>
				<p class="header__hint">Горячая линия <br>по вопросам</p>
				<span class="header__divider" aria-hidden="true"></span>
				<p class="header__hint">Задайте вопрос, <br>мы онлайн:</p>
				<ul class="header__messengers">
					<li><a href="https://t.me/" aria-label="Telegram"><img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-lazy-src="{theme}/images/c316a0f5f6f66f80438b3f3d045975ec59203071.svg" alt="" width="22" height="18" decoding="async" loading="lazy"></a></li>
					<li><a href="https://max.ru/" aria-label="MAX"><img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-lazy-src="{theme}/images/bb4bc44beae62cee7f05affb58ad7de114456bb1.svg" alt="" width="20" height="19" decoding="async" loading="lazy"></a></li>
					<li><a href="https://wa.me/74954450117" aria-label="WhatsApp"><img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-lazy-src="{theme}/images/9188d41760be46f8c69424d90dbc6fed9bbf5bc5.svg" alt="" width="20" height="20" decoding="async" loading="lazy"></a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- панель навигации (макет y 51…121, полупрозрачная с размытием) -->
	<div class="header__bar">
		<div class="container header__bar-inner">
			<a class="header__logo" href="{home}/" aria-label="солдат.рф — на главную">
				<img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-lazy-src="{theme}/images/701d6379446ea0530b8df274333ef4977ff983af.svg" alt="солдат.рф" width="173" height="30" decoding="async" loading="lazy">
			</a>

			<nav class="header__nav" id="site-nav" aria-label="Основная навигация">
				<!-- город и кнопка показываются только в мобильном меню -->
				<div class="city city--nav">
				<button class="header__nav-city" type="button" aria-label="Выбрать город" aria-haspopup="listbox" aria-expanded="false">
					<svg class="header__city-pin" viewBox="0 0 15 21" fill="none" aria-hidden="true">
						<path d="M7.5 20s6.5-7.2 6.5-12.2A6.5 6.5 0 0 0 1 7.8C1 12.8 7.5 20 7.5 20Z" stroke="currentColor" stroke-width="1.6"/>
						<circle cx="7.5" cy="7.8" r="2.4" stroke="currentColor" stroke-width="1.6"/>
					</svg>
					<span class="header__city-label">Город:</span>
					<span class="header__city-value">Москва</span>
					<svg class="header__city-caret" viewBox="0 0 18 18" fill="none" aria-hidden="true">
						<path d="M7.71 3.75 12.96 9l-5.25 5.25" stroke="currentColor" stroke-width="1.6" stroke-linejoin="bevel"/>
					</svg>
				</button>
				</div>

				<a class="btn btn--sm header__nav-cta" href="#contact">
					Получить консультацию
					<span class="btn__arrow">
						<svg class="icon-arrow-ne" viewBox="0 0 12 12" fill="none" aria-hidden="true">
							<path d="M1.65 10.35 10.35 1.65" stroke="currentColor" stroke-width="1.3" stroke-linejoin="round"/>
							<path d="M3.05 1.65h7.3v7.3" stroke="currentColor" stroke-width="1.3" stroke-linejoin="bevel"/>
						</svg>
					</span>
				</a>

				<ul class="header__menu">
					<li><a href="{home}/#terms">Условия</a></li>
					<li><a href="{home}/#benefits">Льготы</a></li>
					<li><a href="{home}/#support">Поддержка</a></li>
					<li><a href="{home}/stati.html">Статьи</a></li>
					<li><a href="{home}/otvety.html">Ответы на вопросы</a></li>
					<li><a href="{home}/#contact">Контакты</a></li>
				</ul>
			</nav>

			<a class="btn btn--sm header__cta" href="#contact">
				Получить консультацию
				<span class="btn__arrow">
					<svg class="icon-arrow-ne" viewBox="0 0 12 12" fill="none" aria-hidden="true">
						<path d="M1.65 10.35 10.35 1.65" stroke="currentColor" stroke-width="1.3" stroke-linejoin="round"/>
						<path d="M3.05 1.65h7.3v7.3" stroke="currentColor" stroke-width="1.3" stroke-linejoin="bevel"/>
					</svg>
				</span>
			</a>

			<button class="header__burger" type="button" aria-controls="site-nav" aria-expanded="false" aria-label="Меню">
				<span class="header__burger-lines" aria-hidden="true"><span></span><span></span><span></span></span>
			</button>
		</div>
	</div>
</header>
