{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<div class="toolbox">
    <div class="toolbox-design">
    {section show=$current_user.is_logged_in}
        <h2>{'Account'|i18n( 'design/standard/toolbar' )}</h2>
    {section-else}
        <h2>{'Not logged in'|i18n( 'design/standard/toolbar' )}</h2>
    {/section}

    <div class="toolbox-content">
    {section show=$current_user.is_logged_in}
    <div class="info-text">
        <p>
        {'Logged in as: %username'|i18n( 'design/standard/toolbar',, hash( '%username', $current_user.contentobject.name ) )}
        </p>
    </div>
    <div class="content-link">
        <p>
        <a href={"/user/logout"|ezurl}>{'Logout'|i18n( 'design/standard/toolbar' )}</a>
        </p>
    </div>
    {section-else}
    <form method="post" action={"/user/login/"|ezurl}>
    <div class="info-text">
        <label for="id1">{"Login"|i18n( 'design/standard/toolbar' )}</label>
        <input class="textinput" type="text" size="10" name="Login" id="id1" value="{$User:login}" />
    </div>

    <div class="info-text">
        <label for="id2">{"Password"|i18n( 'design/standard/toolbar' )}</label>
        <input class="textinput" type="password" size="10" name="Password" id="id2" value="" />
    </div>

    <input type="image" src={"t1/t1-button.gif"|ezimage} align="bottom" width="18" height="18" alt="{'Login'|i18n( 'design/standard/toolbar' )}" />
    <div class="content-link">
        <p>
            <a href={"/user/register"|ezurl}>{'Not registered?'|i18n( 'design/standard/toolbar' )}</a>
        </p>
    </div>
    <div class="content-link">
        <p>
        <a href={"/user/forgotpassword"|ezurl}>{'Forgot your password?'|i18n( 'design/standard/toolbar' )}</a>
        </p>
    </div>
    </form>
    {/section}
    </div>

    </div>
</div>
