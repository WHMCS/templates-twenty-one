{foreach $sidebar as $item}
    <div menuItemName="{$item->getName()}" class="mb-3 card card-sidebar{if $item->getClass()} {$item->getClass()}{/if}{if $item->getExtra('mobileSelect') and $item->hasChildren()} d-none d-md-block{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
        <div class="card-header">
            <h3 class="card-title m-0">
                {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                {$item->getLabel()}
                {if $item->hasBadge()}&nbsp;<span class="badge float-right">{$item->getBadge()}</span>{/if}
                <i class="fas fa-chevron-up card-minimise float-right"></i>
            </h3>
        </div>
        <div class="collapsable-card-body">
            {if $item->hasBodyHtml()}
                <div class="card-body">
                    {$item->getBodyHtml()}
                </div>
            {/if}
            {if $item->hasChildren()}
                <div class="list-group list-group-flush d-md-flex{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}" role="tablist">
                    {foreach $item->getChildren() as $childItem}
                        {if $childItem->getUri()}
                            <a menuItemName="{$childItem->getName()}"
                               href="{$childItem->getUri()}"
                               class="list-group-item list-group-item-action{if $childItem->isDisabled()} disabled{/if}{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}"
                               {if $childItem->getAttribute('dataToggleTab')}
                                   data-toggle="list" role="tab"
                               {/if}
                               {if $childItem->getAttribute('dataCustomAction')}
                                   {assign "customActionData" $childItem->getAttribute('dataCustomAction')}
                                   data-active="{$customActionData['active']}"
                                   data-identifier="{$customActionData['identifier']}"
                                   data-serviceid="{$customActionData['serviceid']}"
                               {/if}
                               {if $childItem->getAttribute('target')}
                                   target="{$childItem->getAttribute('target')}"
                               {/if}
                               id="{$childItem->getId()}"
                            >
                                {if isset($customActionData)}<span class="loading hidden w-hidden" style="display: none;"><i class="fas fa-spinner fa-spin"></i></span>{/if}
                                {if $childItem->hasBadge()}<span class="badge float-right">{$childItem->getBadge()}</span>{/if}
                                {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                {$childItem->getLabel()}
                            </a>
                        {else}
                            <div menuItemName="{$childItem->getName()}" class="list-group-item list-group-item-action{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                                {if $childItem->hasBadge()}<span class="badge float-right">{$childItem->getBadge()}</span>{/if}
                                {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                {$childItem->getLabel()}
                            </div>
                        {/if}
                    {/foreach}
                </div>
            {/if}
        </div>
        {if $item->hasFooterHtml()}
            <div class="card-footer clearfix">
                {$item->getFooterHtml()}
            </div>
        {/if}
    </div>
    {if $item->getExtra('mobileSelect') and $item->hasChildren()}
        {* Mobile Select only supports dropdown menus *}
        <div class="card d-block d-md-none {if $item->getClass()}{$item->getClass()}{else}bg-light{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
            <div class="card-header">
                <h3 class="card-title">
                    {if $item->hasIcon()}<i class="{$item->getIcon()}"></i>&nbsp;{/if}
                    {$item->getLabel()}
                    {if $item->hasBadge()}&nbsp;<span class="badge float-right">{$item->getBadge()}</span>{/if}
                </h3>
            </div>
            <div class="card-body">
                <form role="form">
                    <select class="form-control" onchange="selectChangeNavigate(this)">
                        {foreach $item->getChildren() as $childItem}
                            <option menuItemName="{$childItem->getName()}" value="{$childItem->getUri()}" class="list-group-item list-group-item-action" {if $childItem->isCurrent()}selected="selected"{/if}>
                                {$childItem->getLabel()}
                                {if $childItem->hasBadge()}({$childItem->getBadge()}){/if}
                            </option>
                        {/foreach}
                    </select>
                </form>
            </div>
            {if $item->hasFooterHtml()}
                <div class="card-footer">
                    {$item->getFooterHtml()}
                </div>
            {/if}
        </div>
    {/if}
{/foreach}
