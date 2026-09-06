<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="theme-color" content="#162848">
	<title>{headers}</title>
	<link rel="icon" href="{theme}/images/favicon.svg" type="image/svg+xml">
	<link rel="preload" href="{theme}/fonts/Tektur-700-cyrillic.woff2" as="font" type="font/woff2" crossorigin>
	<link rel="preload" href="{theme}/fonts/Onest-400-cyrillic.woff2" as="font" type="font/woff2" crossorigin>
	<link rel="stylesheet" href="{theme}/css/swiper-bundle.min.css">
	<link rel="stylesheet" href="{theme}/css/style.css">
	<link rel="stylesheet" href="{theme}/css/sections.css">
	<link rel="stylesheet" href="{theme}/css/engine.css">
</head>
<body>

{include file="sections/header.tpl"}

[aviable=main]
<main class="page">
	{include file="sections/hero.tpl"}
	{include file="sections/who.tpl"}
	{include file="sections/marquee.tpl"}
	{include file="sections/docs.tpl"}
	{include file="sections/cta1.tpl"}
	{include file="sections/payments.tpl"}
	{include file="sections/steps.tpl"}
	{include file="sections/faq.tpl"}
	{include file="sections/cta2.tpl"}
	{include file="sections/materials.tpl"}
	{include file="sections/contact.tpl"}
</main>
[/aviable]

[not-aviable=main]
<main class="page page--inner">
	[aviable=showfull]
	{info}
	{content}
	[/aviable]
	[not-aviable=showfull]
	<div class="container inner">
		{info}
		{content}
	</div>
	[/not-aviable]
</main>
[/not-aviable]

{include file="sections/footer.tpl"}

<script src="{theme}/js/swiper-bundle.min.js" defer></script>
<script src="{theme}/js/main.js" defer></script>
</body>
</html>
