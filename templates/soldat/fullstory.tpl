<article class="post">
	<div class="container">
		<div class="post__cover">
			<img class="post__cover-img" src="{thumb-url}" alt="{title}" width="1397" height="438" decoding="async">
			<span class="post__veil" aria-hidden="true"></span>

			<a class="post__back" href="{home}/stati.html">
				<span class="post__back-icon" aria-hidden="true">
					<svg viewBox="0 0 12 12" fill="none"><path d="M2.5 2.5v7h7" stroke="#0257D5" stroke-width="2" stroke-linejoin="bevel"/><path d="M2.5 9.5 9.9 2.1" stroke="#0257D5" stroke-width="2" stroke-linejoin="round"/></svg>
				</span>
				Назад
			</a>

			<p class="post__date">{date=j F Y}</p>
			<h1 class="post__title">{title}</h1>
		</div>

		<div class="post__body">
			{full-story}
		</div>
	</div>
</article>

{include file="sections/cta.tpl"}
{include file="sections/contact.tpl"}
