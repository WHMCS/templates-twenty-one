<p>{lang key='metrics.explanation'}</p>
<table class="table table-striped mb-1 table-solid-bottom-border-light-gray">
    <tr>
        <th>{lang key='metrics.metric'}</th>
        <th>{lang key='metrics.currentUsage'}</th>
        <th>{lang key='metrics.pricing'}</th>
        <th>{lang key='metrics.lastUpdated'}</th>
    </tr>
    {foreach $metricStats as $metric}
        <tr>
            <td>{$metric.displayName}</td>
            <td>{$metric.currentValue}</td>
            <td>
                {if count($metric.pricing) > 1}
                    {lang key='metrics.startingFrom'} {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{lang key='metrics.unit'}{/if}
                    <br>
                    <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modalMetricPricing-{$metric.systemName}">
                        {lang key='metrics.viewPricing'}
                    </button>
                {elseif count($metric.pricing) == 1}
                    {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{lang key='metrics.unit'}{/if}
                    {if $metric.includedQuantity > 0} ({$metric.includedQuantity} {lang key='metrics.includedNotCounted'}){/if}
                {else}
                    &mdash;
                {/if}
                {include file="$template/usagebillingpricing.tpl"}
            </td>
            <td>{if is_string($metric.lastUpdated)}{$metric.lastUpdated}{else}{$metric.lastUpdated->diffForHumans()}{/if}</td>
        </tr>
    {/foreach}
</table>
