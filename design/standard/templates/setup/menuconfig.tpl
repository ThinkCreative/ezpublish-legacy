{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<form method="post" action={"/setup/menuconfig/"|ezurl}>
<h1>{"Menu management"|i18n("design/standard/menuconfig")}</h1>

<div class="objectheader">
    <h2>{'SiteAccess'|i18n( 'design/standard/setup' )}</h2>
</div>
<div class="object">
    {section show=$current_siteaccess}
        <p>{'Current siteaccess'|i18n( 'design/standard/setup' )}: <strong>{$current_siteaccess}</strong></p>
    {/section}
    <div class="block">
        <label>{'Select siteaccess'|i18n( 'design/standard/setup' )}</label><div class="labelbreak"></div>
        <select name="CurrentSiteAccess">
            {section var=siteaccess loop=$siteaccess_list}
                {section show=eq( $current_siteaccess, $siteaccess )}
                    <option value="{$siteaccess}" selected="selected">{$siteaccess}</option>
                {section-else}
                <option value="{$siteaccess}">{$siteaccess}</option>
            {/section}
        {/section}
        </select>
        &nbsp;
        <input type="submit" value="{"Set"|i18n("design/standard/setup")}" name="SelectCurrentSiteAccessButton" />
    </div>
</div>

<table border="0">
<tr>
{section var=menu loop=$available_menu_array}
    <td>
    <h2>{$menu.settings.TitleText}</h2>

    <label for="Menu_{$menu.type}">
        <img src={$menu.settings.MenuThumbnail|ezimage} alt="{$menu.settings.TitleText}" />
    </label>

    <input type="radio" id="Menu_{$menu.type}" name="MenuType" {$current_menu|eq( $menu.type )|choose( '', 'checked="checked"' )}  value="{$menu.type}" />
    </td>
    {delimiter modulo=2}
</tr>
<tr>
    {/delimiter}
{/section}
</tr>
</table>

<input class="defaultbutton" type="submit" name="StoreButton" value="{"Store"|i18n("design/standard/setup")}" />

</form>

