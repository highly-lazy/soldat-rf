<section class="section contact" id="contact">
	<div class="container">
		<div class="contact__panel">
			<div class="contact__col">
				<div class="contact__head">
					<h2 class="h2 contact__title">Оставьте контакт —<br>объясним шаги</h2>
					<p class="lead contact__lead">Быстрее всего — написать в мессенджер. Также можно оставить заявку, и мы свяжемся с вами.</p>
				</div>

				<form class="contact__form" method="post" action="">
					<div class="contact__row">
						<label class="visually-hidden" for="contact-name">Имя</label>
						<input class="field contact__field" type="text" id="contact-name" name="name" placeholder="Имя" autocomplete="name" required>
					</div>
					<div class="contact__row">
						<label class="visually-hidden" for="contact-phone">Телефон</label>
						<input class="field contact__field contact__field--accent" type="tel" id="contact-phone" name="phone" placeholder="Телефон" autocomplete="tel" required>
					</div>
					<div class="contact__row">
						<label class="visually-hidden" for="contact-messenger">Удобный мессенджер</label>
						<select class="field contact__field contact__field--select" id="contact-messenger" name="messenger" autocomplete="off">
							<option value="whatsapp">WhatsApp</option>
							<option value="telegram">Telegram</option>
							<option value="max">MAX</option>
						</select>
					</div>
					<div class="contact__row">
						<label class="visually-hidden" for="contact-message">Ваш вопрос</label>
						<textarea class="field contact__field contact__field--textarea" id="contact-message" name="message" placeholder="Ваш вопрос" autocomplete="off" rows="3"></textarea>
					</div>

					<div class="contact__consent">
						<input class="contact__checkbox" type="checkbox" id="contact-consent" name="consent" required checked>
						<label class="contact__consent-label" for="contact-consent">Согласен на <a href="https://xn--80aneakq8a4c.xn--p1acf/personal-data-consent/" target="_blank" rel="noopener">обработку персональных данных</a> и ознакомлен с <a href="https://xn--80aneakq8a4c.xn--p1acf/privacy-policy/" target="_blank" rel="noopener">политикой обработки ПДн</a>.</label>
					</div>

					<button type="submit" class="btn btn--navy contact__submit">
						Задать вопрос
						<span class="btn__icon" aria-hidden="true">
							<svg width="12" height="12" viewBox="0 0 12 12" fill="none" aria-hidden="true"><path d="M1 6h9m0 0L6.4 2.4M10 6l-3.6 3.6" stroke="currentColor" stroke-width="1.4" stroke-linecap="round" stroke-linejoin="round"/></svg>
						</span>
					</button>
				</form>
			</div>

			<div class="contact__media" aria-hidden="true">
				<img class="contact__photo" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-lazy-src="{theme}/images/1e1003dcdcb72beb34f6ae63d5933451aaada3e9.webp" alt="" width="818" height="1015" loading="lazy" decoding="async">
			</div>
		</div>
	</div>
</section>
