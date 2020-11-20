<div class="modal fade modal-metric-pricing" tabindex="-1" role="dialog" id="modalMetricPricing-{$metric.systemName}">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">{$metric.displayName} {lang key='metrics.pricing'}</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <p>{$metric.pricingSchema.info}<br/>
                    {$metric.pricingSchema.detail}
                </p>
                <table class="table table-sm table-striped">
                    <tr>
                        <th class="text-center">{lang key='metrics.startingQuantity'}</th>
                        <th class="text-center">{lang key='metrics.pricePer'} {if $metric.unitName}{$metric.unitName}{else}{lang key='metrics.unit'}{/if}</th>
                    </tr>
                    {foreach $metric.pricing as $pricing}
                        <tr>
                            <td>{$pricing.from}</td>
                            <td>{$pricing.price_per_unit}</td>
                        </tr>
                    {/foreach}
                </table>
                {if $metric.includedQuantity}
                    <p>{$metric.includedQuantity} {$metric.includedQuantityUnits} {lang key='metrics.includedInBase'}</p>
                {/if}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{lang key='close'}</button>
            </div>
        </div>
    </div>
</div>
