<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="theme-color" content="#0257d5">
	<title>{headers}</title>
	<link rel="icon" href="{theme}/images/main-favicon.svg" type="image/svg+xml">
	<link rel="preload" href="{theme}/fonts/Onest-400-cyrillic.woff2" as="font" type="font/woff2" crossorigin>
	<link rel="preload" href="{theme}/fonts/Onest-700-cyrillic.woff2" as="font" type="font/woff2" crossorigin>
	<link rel="stylesheet" href="{theme}/css/style.css?ver=1.2.4">
	<link rel="stylesheet" href="{theme}/css/sections.css?ver=1.2.4">
	<link rel="stylesheet" href="{theme}/css/engine.css?ver=1.2.4">
</head>
<body>

{include file="sections/header.tpl"}

[aviable=main]
<main class="page">
	{include file="sections/hero.tpl"}
	{include file="sections/benefits.tpl"}
	{include file="sections/requirements.tpl"}
	{include file="sections/terms.tpl"}
	{include file="sections/cta.tpl"}
	{include file="sections/payments.tpl"}
	{include file="sections/family.tpl"}
	{include file="sections/support.tpl"}
	{include file="sections/steps.tpl"}
	{include file="sections/knowledge.tpl"}
	{include file="sections/articles.tpl"}
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

<script src="{theme}/js/main.js?ver=1.2.4" defer></script>
</body>
</html>
