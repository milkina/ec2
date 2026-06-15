<div class="lang-switch" role="group" aria-label="Language">
<form method="post" action="${enUrl}">
    <input type="hidden" name="lang" value="en">
    <input type="hidden" name="pageLanguage" value="en">
    <button class="${pageLanguage == 'ru' ? '' : 'is-active'}" data-lang="en" type="submit">EN</button>
</form>
<form method="post" action="${ruUrl}">
    <input type="hidden" name="lang" value="ru">
    <input type="hidden" name="pageLanguage" value="ru">
    <button class="${pageLanguage == 'ru' ? 'is-active' : ''}" data-lang="ru" type="submit">RU</button>
</form>
</div>
