﻿{include file='header.tpl'}

    <div class="main" id="main">
        <div class="main-precontents" id="main-precontents"></div>
        <div class="main-contents" id="main-contents">

{if !empty($announcements)}
    {foreach from=$announcements item=item}
        {include file='bricks/announcement.tpl' an=$item}
    {/foreach}
{/if}

            <script type="text/javascript">//<![CDATA[
{include file='bricks/community.tpl'}
                var g_pageInfo = {ldelim}type: {$page.type}, typeId: {$page.typeId}, name: '{$lvData.page.name|escape:"quotes"}'{rdelim};
                g_initPath({$page.path});
            //]]></script>

{include file='bricks/infobox.tpl' info=$lvData.infobox}

            <div class="text">

{include file='bricks/redButtons.tpl'}

                <h1>{$lvData.page.name}</h1>

{include file='bricks/article.tpl'}

{$lvData.page.description}

                <script type="text/javascript">//<![CDATA[
{section name=i loop=$lvData.pieces}
                    g_items.add({$lvData.pieces[i].id}, {ldelim}name_{$user.language}:'{$lvData.pieces[i].name|escape:'javascript'}', quality:{$lvData.pieces[i].quality}, icon:'{$lvData.pieces[i].icon}', jsonequip:{$lvData.pieces[i].json}{rdelim});
{/section}
                //]]></script>

                <table class="iconlist">
{section name=i loop=$lvData.pieces}
                    <tr><th align="right" id="iconlist-icon{$smarty.section.i.index + 1}"></th><td><span class="q{$lvData.pieces[i].quality}"><a href="?item={$lvData.pieces[i].id}">{$lvData.pieces[i].name}</a></span></td></tr>
{/section}
                </table>

                <script type="text/javascript">//<![CDATA[
{section name=i loop=$lvData.pieces}
                    $WH.ge('iconlist-icon{$smarty.section.i.index + 1}').appendChild(g_items.createIcon({$lvData.pieces[i].id}, 0, 0));
{/section}
                //]]></script>

{if $lvData.page.unavailable}
                <div class="pad"></div><b style="color: red">{$lang._unavailable}</b>
{/if}

                <h3>{$lang._setBonuses}{$lvData.page.bonusExt}</h3>

                {$lang._conveyBonus}
                <ul>
{section name=i loop=$lvData.spells}
                    <li><div>{$lvData.spells[i].bonus} {$lang._pieces}{$lang.colon}<a href="?spell={$lvData.spells[i].id}">{$lvData.spells[i].desc}</a></div></li>
{/section}
                </ul>

                <h2 class="clear">Summary</h2>

                <div id="summary-generic"></div>
                <script type="text/javascript">//<![CDATA[
                    new Summary({ldelim} id: 'itemset', template: 'itemset', parent: 'summary-generic', groups: [[[{']],[['|implode:$lvData.compare.items}]]], level: {$lvData.compare.level}{rdelim});
                //]]></script>

                <h2 class="clear">{$lang.related}</h2>
            </div>

{include file='bricks/tabsRelated.tpl' tabs=$lvData.relTabs}

{include file='bricks/contribute.tpl'}

        </div><!-- main-contents -->
    </div><!-- main -->

{include file='footer.tpl'}
