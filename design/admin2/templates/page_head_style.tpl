{* DO NOT EDIT THIS FILE! Use an override template instead. *}

{if is_unset( $load_css_file_list )}
    {def $load_css_file_list = true()}
{/if}

{if is_unset( $load_main_css )}
    {def $load_main_css = true()}
{/if}

{if $load_main_css}

  {* load main css files and requried css files *}
  {if $load_css_file_list}
    {ezcss_load( array( 'core.css', 'site.css', 'debug.css', ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ) ) )}
  {else}
    {ezcss_load( array( 'core.css', 'site.css', 'debug.css' ) )}
  {/if}

  {include uri='design:page_head_style_inline.tpl'}

{else}

  {* load requried css files *}
 {ezcss_load()}

{/if}