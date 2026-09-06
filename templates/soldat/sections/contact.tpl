<section class="contact" id="contact" aria-labelledby="contact-title">
	<div class="container">
		<div class="contact__panel">
			<img class="contact__photo" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-lazy-src="{theme}/images/7adf34a019bd1bb1af7dd8da1f9e260bf182c79d.webp" alt="" width="1800" height="823" decoding="async">

			<div class="contact__body">
				<h2 class="contact__title" id="contact-title">Оставь заявку <br>на контрактную <br>службу в армии РФ</h2>
				<p class="contact__lead">Оставь заявку — и наши специалисты помогут тебе пройти все этапы оформления контракта, ответят на вопросы и подберут лучшие условия службы.</p>
			</div>

			<!-- TODO: указать обработчик формы (action) -->
			<form class="contact__form" action="" method="post">
				<label class="visually-hidden" for="contact-name">Имя</label>
				<input class="contact__input" id="contact-name" name="name" type="text" placeholder="Имя" required>

				<label class="visually-hidden" for="contact-phone">Номер телефона</label>
				<input class="contact__input" id="contact-phone" name="phone" type="tel" placeholder="Номер телефона" required>

				<label class="contact__consent">
					<input class="contact__check" type="checkbox" name="agree" checked required>
					<span class="contact__check-box" aria-hidden="true"></span>
					<span class="contact__consent-text">Согласен на обработку персональных данных и <br>принимаю <a href="https://xn--80ahulok.xn--p1ai/policy.html" target="_blank" rel="noopener">политику конфиденциальности</a></span>
				</label>

				<button class="btn btn--lg contact__submit" type="submit">
					Отправить заявку
					<span class="btn__arrow">
						<svg class="icon-arrow-ne" viewBox="0 0 16 16" fill="none" aria-hidden="true">
							<path d="M2 14 14 2" stroke="currentColor" stroke-width="2" stroke-linejoin="round"/>
							<path d="M3.46 2H14v10.54" stroke="currentColor" stroke-width="2" stroke-linejoin="bevel"/>
						</svg>
					</span>
				</button>
			</form>
		</div>
	</div>
</section>
