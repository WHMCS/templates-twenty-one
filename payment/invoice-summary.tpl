<div id="invoiceIdSummary" class="card">
    <div class="card-body invoice-summary">
        <h2 class="text-center">
            {lang key="invoicenumber"}{if $invoicenum}{$invoicenum}{else}{$invoiceid}{/if}
        </h2>
        <div class="invoice-summary-table">
            <table class="table table-condensed">
                <tr>
                    <td class="text-center"><strong>{lang key="invoicesdescription"}</strong></td>
                    <td width="150" class="text-center"><strong>{lang key="invoicesamount"}</strong></td>
                </tr>
                {foreach $invoiceitems as $item}
                    <tr>
                        <td>{$item.description}</td>
                        <td class="text-center">{$item.amount}</td>
                    </tr>
                {/foreach}
                <tr>
                    <td class="total-row text-right">{lang key="invoicessubtotal"}</td>
                    <td class="total-row text-center">{$invoice.subtotal}</td>
                </tr>
                {if $invoice.taxrate}
                    <tr>
                        <td class="total-row text-right">{$invoice.taxrate}% {$invoice.taxname}</td>
                        <td class="total-row text-center">{$invoice.tax}</td>
                    </tr>
                {/if}
                {if $invoice.taxrate2}
                    <tr>
                        <td class="total-row text-right">{$invoice.taxrate2}% {$invoice.taxname2}</td>
                        <td class="total-row text-center">{$invoice.tax2}</td>
                    </tr>
                {/if}
                <tr>
                    <td class="total-row text-right">{lang key="invoicescredit"}</td>
                    <td class="total-row text-center">{$invoice.credit}</td>
                </tr>
                <tr>
                    <td class="total-row text-right">{lang key="invoicestotaldue"}</td>
                    <td class="total-row text-center">{$invoice.total}</td>
                </tr>
            </table>
        </div>
        <div class="mb-2 text-center">
            {lang key="paymentstodate"}: <strong>{$invoice.amountpaid}</strong>
        </div>
        <div class="alert alert-success text-center m-0">
            {lang key="balancedue"}: <strong>{$balance}</strong>
        </div>
    </div>
</div>
