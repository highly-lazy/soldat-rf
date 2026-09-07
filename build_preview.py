# -*- coding: utf-8 -*-
"""Собирает статичное превью шаблона солдат.рф из .tpl-секций.
Страницы: index.html (главная), stati.html (список статей),
statya.html (статья), otvety.html (ответы на вопросы)."""
import re, os, glob, tempfile

P = os.path.join(os.path.dirname(os.path.abspath(__file__)), "templates", "soldat")

PAGES = {
    "index.html": {
        "title": "солдат.рф — военная служба по контракту",
        "sections": ["header", "hero", "benefits", "requirements", "terms", "cta",
                     "payments", "family", "support", "steps", "knowledge",
                     "articles", "contact", "footer"],
        "body_class": "",
    },
    "stati.html": {
        "title": "Статьи — солдат.рф",
        "sections": ["header", "articles-page", "contact", "footer"],
        "body_class": "is-inner",
    },
    "statya.html": {
        "title": "Где выгоднее подписать контракт в 2026 году — солдат.рф",
        "sections": ["header", "article", "cta-article", "contact", "footer"],
        "body_class": "is-inner is-article",
    },
    "otvety.html": {
        "title": "Ответы на вопросы — солдат.рф",
        "sections": ["header", "faq-page", "contact", "footer"],
        "body_class": "is-inner",
    },
}


def read(n):
    f = os.path.join(P, "sections", n + ".tpl")
    return open(f, encoding="utf-8").read() if os.path.exists(f) else "<!-- MISSING: %s -->" % n


def write_atomic(path, text):
    d = os.path.dirname(path)
    t = tempfile.NamedTemporaryFile("w", delete=False, dir=d, encoding="utf-8", suffix=".tmp")
    t.write(text)
    t.close()
    os.replace(t.name, path)


# --- sections.css: подключаем все файлы css/sections/*.css в порядке главной,
#     затем всё, что осталось (страницы статей/ответов)
order = PAGES["index.html"]["sections"]
seen, css = set(), []
for n in order + [s for p in PAGES.values() for s in p["sections"]]:
    f = os.path.join(P, "css", "sections", n + ".css")
    if n not in seen and os.path.exists(f):
        seen.add(n)
        css.append("@import url('sections/%s.css');" % n)
for f in sorted(glob.glob(os.path.join(P, "css", "sections", "*.css"))):
    n = os.path.splitext(os.path.basename(f))[0]
    if n not in seen:
        seen.add(n)
        css.append("@import url('sections/%s.css');" % n)
write_atomic(os.path.join(P, "css", "sections.css"), "\n".join(css) + "\n")

for name, cfg in PAGES.items():
    body = "\n".join(read(n) for n in cfg["sections"])
    html = """<!DOCTYPE html>
<html lang="ru"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>%s</title>
<link rel="icon" href="images/main-favicon.svg" type="image/svg+xml">
<link rel="stylesheet" href="css/style.css?ver=1.2.3">
<link rel="stylesheet" href="css/sections.css?ver=1.2.3">
<link rel="stylesheet" href="css/engine.css?ver=1.2.3">
</head><body class="%s">
%s
<script src="js/main.js?ver=1.2.3" defer></script>
</body></html>""" % (cfg["title"], cfg["body_class"], body)
    html = html.replace("{theme}", ".").replace("{home}", ".")
    html = re.sub(r"\{include file=\"[^\"]+\"\}", "", html)
    write_atomic(os.path.join(P, name), html)
    miss = [n for n in cfg["sections"] if not os.path.exists(os.path.join(P, "sections", n + ".tpl"))]
    print("%-12s %6d b  %2d/%2d секций%s" % (name, len(html),
          len(cfg["sections"]) - len(miss), len(cfg["sections"]),
          ("  нет: " + ", ".join(miss)) if miss else ""))
