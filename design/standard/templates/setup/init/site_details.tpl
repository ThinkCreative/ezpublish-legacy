{*?template charset=latin1?*}
{include uri='design:setup/setup_header.tpl' setup=$setup}

<form method="post" action="{$script}">

<p>
 {"It's time to specify the title and url of your site, this will be used in the title of the webpage and for sending out email with the site url."|i18n("design/standard/setup/init")}
</p>

<div class="highlight">
<table cellspacing="0" cellpadding="0" border="0">
<tr>
  <td class="normal">
   {"Title of your site"|i18n("design/standard/setup/init")}
  </td>
  <td align="right" class="normal">
    <input type="text" size="45" name="eZSetupSiteTitle" value="{$site_info.title}" />
  </td>
</tr>
<tr>
  <td class="normal">
   {"URL to your site"|i18n("design/standard/setup/init")}
  </td>
  <td align="right" class="normal">
    <input type="text" size="45" name="eZSetupSiteURL" value="{$site_info.url}" />
  </td>
</tr>
</table>
</div>

  <div class="buttonblock">
    <input type="hidden" name="ChangeStepAction" value="" />
    <input class="defaultbutton" type="submit" name="StepButton_11" value="{'Register Site'|i18n('design/standard/setup/init')} >>" />
  </div>
  {include uri='design:setup/persistence.tpl'}
</form>
