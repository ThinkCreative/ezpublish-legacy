{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{let content=$class_attribute.content}

<div class="element">
<label>{'Selection method'|i18n( 'design/standard/class/datatype' )}</label><div class="labelbreak"></div>
<select name="ContentClass_ezobjectrelation_selection_type_{$class_attribute.id}">
    <option value="0" {eq( $content.selection_type, 0 )|choose( '', 'selected="selected"' )}>{'Browse'|i18n( 'design/standard/class/datatype' )}</option>
    <option value="1" {eq( $content.selection_type, 1 )|choose( '', 'selected="selected"' )}>{'Dropdown list'|i18n( 'design/standard/class/datatype' )}</option>
    <option value="2" {eq( $content.selection_type, 2 )|choose( '', 'selected="selected"' )}>{'Dropdown tree'|i18n( 'design/standard/class/datatype' )}</option>
</select>
</div>

<div class="element">
<label>{'Default selection node'|i18n( 'design/standard/class/datatype' )}</label><div class="labelbreak"></div>
{section show=$content.default_selection_node}
    {let selection_node=fetch( content, node, hash( node_id, $content.default_selection_node ) )}
    <p>{'Selecting from %nodename'|i18n( 'design/standard/class/datatype',, hash( '%nodename', $selection_node.name ) )}</p>
    <input class="button" type="submit" name="CustomActionButton[{$class_attribute.id}_disable_selection_node]" value="{'Remove selection'|i18n('design/standard/class/datatype')}" />
    {/let}
{section-else}
{/section}
<input class="button" type="submit" name="CustomActionButton[{$class_attribute.id}_browse_for_selection_node]" value="{'Select node'|i18n('design/standard/class/datatype')}" />

<input type="hidden" name="ContentClass_ezobjectrelation_selection_fuzzy_match_helper_{$class_attribute.id}" value="1">
<input id="fuzzy_match_{$class_attribute.id}" type="checkbox" name="ContentClass_ezobjectrelation_selection_fuzzy_match_{$class_attribute.id}" {section show=$content.fuzzy_match}checked="checked"{/section}><label for="fuzzy_match_{$class_attribute.id}">{'Allow fuzzy match'|i18n( 'design/standard/class/datatype' )}</label><div class="labelbreak"></div>
</div>


{/let}