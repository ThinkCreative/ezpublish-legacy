{*?template charset=latin1?*}

<div align="center">
  <h1>{"Site registration"|i18n("design/standard/setup/init")}</h1>
</div>

<p>
 {"If you wish, you can register this installation by sending some information to eZ systems. No confidential data will be transmitted and eZ systems will not use or sell your details for unsolicited emails."|i18n("design/standard/setup/init")}
</p>

<table cellpadding="0" cellspacing="0" border="0">
<tr><th class="normal">{"The registration email:"|i18n("design/standard/setup/init")}</th></tr>
<tr><td class="normal"><textarea class="box" readonly="readonly" cols="60" rows="6">{$email_body}</textarea></td></tr>
</table>

<p>
 {"If you wish, you can also add some comments, which will be included in the registration E-mail."|i18n("design/standard/setup/init")}
</p>


<form method="post" action="{$script}">

<table cellpadding="0" cellspacing="0" border="0">
<tr><th class="normal">{"Comments:"|i18n("design/standard/setup/init")}</th></tr>
<tr><td class="normal"><textarea class="box" name="eZSetupRegistrationComment" cols="60" rows="6"></textarea></td></tr>
</table>
</div>

<br/>
<blockquote class="note">
<p>
 <b>{"Note:"|i18n("design/standard/setup/init")}</b>
 {"Sending out the email and generating your site might take a couple of seconds. Please wait until the next page loads. Clicking the button again will only send out duplicate emails, and may corrupt the installation."|i18n("design/standard/setup/init")}
</p>
</blockquote>
<br/>

<div align="right">
<input type="checkbox" name="eZSetupSendRegistration" checked="checked" />{"Send registration"|i18n("design/standard/setup/init")}
</div>

  <div class="buttonblock" align="right">
  {include uri='design:setup/init/navigation.tpl'}
{*    <input class="button" type="submit" name="eZSetupSkipRegistration" value="{'Skip Registration'|i18n('design/standard/setup/init')} &gt;" />
    <input class="defaultbutton" type="submit" name="eZSetupSendRegistration" value="{'Send Registration'|i18n('design/standard/setup/init')} &gt;" /> *}
  </div>
  {include uri='design:setup/persistence.tpl'}
  {include uri='design:setup/init/steps.tpl'}
</form>
