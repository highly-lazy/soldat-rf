<div class="container inner">
	[not-group=5]
	<form method="post" action="">
		<h2>Вход на сайт</h2>
		<label class="visually-hidden" for="login_name">Логин</label>
		<input class="dle-input" id="login_name" name="login_name" type="text" placeholder="Логин">
		<label class="visually-hidden" for="login_password">Пароль</label>
		<input class="dle-input" id="login_password" name="login_password" type="password" placeholder="Пароль">
		<button class="btn btn--sm" type="submit" onclick="submit();return false;">Войти</button>
		<input name="login" type="hidden" id="login" value="submit">
	</form>
	[/not-group]
	[group=5]
	<p>Вы вошли как <b>{login}</b>. <a href="{admin-link}">Админпанель</a> · <a href="{logout-link}">Выход</a></p>
	[/group]
</div>
