<section class="section article">
	<div class="container">
		<figure class="article__cover">
			[thumb-url]<img class="article__cover-img" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-lazy-src="{thumb-url}" alt="{title}" width="1400" height="470" decoding="async">[/thumb-url]
			<span class="article__chip">{category}</span>
			<span class="article__date">{date=d.m.Y}</span>
		</figure>

		<div class="article__col">
			<h1 class="article__title">{title}</h1>
			<div class="article__body">{full-story}</div>
			{tags}
			{comments}
			{addcomments}
		</div>
	</div>
</section>

{include file="sections/cta1.tpl"}
{include file="sections/materials-related.tpl"}
{include file="sections/contact.tpl"}
