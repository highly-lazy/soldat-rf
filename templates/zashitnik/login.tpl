[not-logged]
<form class="dle-form login" method="post" action="">
	<h2 class="h4">Вход на сайт</h2>
	<label for="login_name">Логин</label>
	<input id="login_name" name="login_name" type="text" autocomplete="username" required>
	<label for="login_password">Пароль</label>
	<input id="login_password" name="login_password" type="password" autocomplete="current-password" required>
	<label class="login__remember"><input name="login_not_save" type="checkbox" value="1"> Чужой компьютер</label>
	<input type="hidden" name="login" value="submit">
	<button class="btn btn--navy" type="submit">Войти</button>
	<a class="login__lost" href="{lostpassword-link}">Забыли пароль?</a>
</form>
[/not-logged]
[logged]
<div class="login login--user">
	<a class="login__name" href="{profile-link}">{login-name}</a>
	<a class="login__exit" href="{logout-link}">Выход</a>
</div>
[/logged]
