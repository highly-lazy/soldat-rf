import re,os,glob
P=os.path.join(os.path.dirname(os.path.abspath(__file__)),"templates","zashitnik")
order=["header","hero","who","marquee","docs","cta1","payments","steps","faq","cta2","materials","contact","footer"]
def read(n):
    f=os.path.join(P,"sections",n+".tpl")
    return open(f,encoding="utf-8").read() if os.path.exists(f) else f"<!-- MISSING: {n} -->"
body="\n".join(read(n) for n in order)
# собрать sections.css
css=[]
for n in order:
    f=os.path.join(P,"css","sections",n+".css")
    if os.path.exists(f): css.append(f"@import url('sections/{n}.css');")
# sections.css общий для index.html и article.html — добавляем article.css (его нет в order,
# т.к. order описывает только состав index-страницы)
_af=os.path.join(P,"css","sections","article.css")
if os.path.exists(_af) and "@import url('sections/article.css');" not in css:
    css.append("@import url('sections/article.css');")
import tempfile as _tf
_t=_tf.NamedTemporaryFile("w",delete=False,dir=os.path.join(P,"css"),encoding="utf-8",suffix=".tmp")
_t.write("\n".join(css)+"\n"); _t.close(); os.replace(_t.name, os.path.join(P,"css","sections.css"))

html=f"""<!DOCTYPE html>
<html lang="ru"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Защитник.рус — контракт на СВО гражданину Беларуси</title>
<link rel="stylesheet" href="css/swiper-bundle.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/sections.css">
<link rel="stylesheet" href="css/engine.css">
</head><body>
{body}
<script src="js/swiper-bundle.min.js" defer></script>
<script src="js/main.js" defer></script>
</body></html>"""
html=html.replace("{theme}",".").replace("{home}","#top")
html=re.sub(r"\{include file=\"[^\"]+\"\}","",html)
import tempfile
tmp=tempfile.NamedTemporaryFile("w",delete=False,dir=P,encoding="utf-8",suffix=".tmp")
tmp.write(html); tmp.close(); os.replace(tmp.name, os.path.join(P,"index.html"))
print("preview:",os.path.join(P,"index.html"), len(html),"bytes;", sum(1 for n in order if os.path.exists(os.path.join(P,'sections',n+'.tpl'))),"/",len(order),"sections")

# --- страница «статья»: header + article + cta1 + materials + contact + footer ---
art_order=["header","article","cta1","materials-related","contact","footer"]
abody="\n".join(read(n) for n in art_order)
ahtml=f"""<!DOCTYPE html>
<html lang="ru"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Какие документы подготовить гражданину Беларуси — Защитник.рус</title>
<link rel="stylesheet" href="css/swiper-bundle.min.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/sections.css">
<link rel="stylesheet" href="css/engine.css">
</head><body class="is-article">
{abody}
<script src="js/swiper-bundle.min.js" defer></script>
<script src="js/main.js" defer></script>
</body></html>"""
ahtml=ahtml.replace("{theme}",".").replace("{home}","index.html")
ahtml=re.sub(r"\{include file=\"[^\"]+\"\}","",ahtml)
_a=_tf.NamedTemporaryFile("w",delete=False,dir=P,encoding="utf-8",suffix=".tmp")
_a.write(ahtml); _a.close(); os.replace(_a.name, os.path.join(P,"article.html"))
print("article:", os.path.join(P,"article.html"), len(ahtml),"bytes")
