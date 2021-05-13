<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$companyname} - {lang key='quotenumber'}{$id}</title>

    <link href="{assetPath file='all.min.css'}?v={$versionHash}" rel="stylesheet">
    <link href="{assetPath file='theme.min.css'}?v={$versionHash}" rel="stylesheet">
    <link href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="{assetPath file='invoice.min.css'}?v={$versionHash}" rel="stylesheet">
    <script src="{assetPath file='scripts.min.js'}?v={$versionHash}"></script>
</head>
<body>

    <div class="container-fluid invoice-container">

        {if $invalidQuoteIdRequested}

            {include file="$template/includes/panel.tpl" type="danger" headerTitle="{lang key='error'}" bodyContent="{lang key='invoiceserror'}" bodyTextCenter=true}

        {else}

            <div class="row">
                <div class="col-sm-7">

                    {if $logo}
                        <p><img src="{$logo}" title="{$companyname}" /></p>
                    {else}
                        <h2>{$companyname}</h2>
                    {/if}
                    <h3>{lang key='quotenumber'}{$id}</h3>

                </div>
                <div class="col-sm-5 text-center">

                    <div class="invoice-status">
                        {if $stage eq "Delivered"}
                            <span class="unpaid">{lang key='quotestagedelivered'}</span>
                        {elseif $stage eq "Accepted"}
                            <span class="paid">{lang key='quotestageaccepted'}</span>
                        {elseif $stage eq "On Hold"}
                            <span class="refunded">{lang key='quotestageonhold'}</span>
                        {elseif $stage eq "Lost"}
                            <span class="cancelled">{lang key='quotestagelost'}</span>
                        {elseif $stage eq "Dead"}
                            <span class="collections">{lang key='quotestagedead'}</span>
                        {/if}
                    </div>

                    {if $stage eq "Delivered" || $stage eq "On Hold"}
                        <div class="payment-btn-container" align="center">
                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#acceptQuoteModal"><i class="fas fa-check-circle"></i> {lang key='quoteacceptbtn'}</button>
                        </div>
                    {/if}

                </div>
            </div>

            <hr>

            {if $agreetosrequired}
                {include file="$template/includes/panel.tpl" type="danger" headerTitle="{lang key='error'}" bodyContent="{lang key='ordererroraccepttos'}" bodyTextCenter=true}
            {/if}

            <div class="row">
                <div class="col-6">
                    <strong>{lang key='quoterecipient'}:</strong>
                    <address class="small-text">
                        {if $clientsdetails.companyname}{$clientsdetails.companyname}<br />{/if}
                        {$clientsdetails.firstname} {$clientsdetails.lastname}<br />
                        {$clientsdetails.address1}, {$clientsdetails.address2}<br />
                        {$clientsdetails.city}, {$clientsdetails.state}, {$clientsdetails.postcode}<br />
                        {$clientsdetails.country}
                        {if $customfields}
                        <br /><br />
                        {foreach $customfields as $customfield}
                        {$customfield.fieldname}: {$customfield.value}<br />
                        {/foreach}
                        {/if}
                    </address>
                </div>
                <div class="col-6 text-right">
                    <strong>{lang key='invoicespayto'}:</strong>
                    <address class="small-text">
                        {$payto}
                    </address>
                </div>
            </div>

            <div class="row">
                <div class="col-6">
                    <strong>{lang key='quotedatecreated'}:</strong><br>
                    <span class="small-text">
                        {$datecreated}<br /><br />
                    </span>
                </div>
                <div class="col-6 text-right">
                    <strong>{lang key='quotevaliduntil'}:</strong><br>
                    <span class="small-text">
                        {$validuntil}<br /><br />
                    </span>
                </div>
            </div>

            <br />

            {if $proposal}
                {include file="$template/includes/panel.tpl" type="warning" headerTitle="{lang key='quoteproposal'}" bodyContent=$proposal}
            {/if}

            <div class="card bg-default mb-3">
                <div class="card-header">
                    <h3 class="card-title"><strong>{lang key='quotelineitems'}</strong></h3>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-sm">
                            <thead>
                                <tr>
                                    <td><strong>{lang key='invoicesdescription'}</strong></td>
                                    <td class="text-center"><strong>{lang key='quotediscountheading'}</strong></td>
                                    <td width="20%" class="text-center"><strong>{lang key='invoicesamount'}</strong></td>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $quoteitems as $item}
                                    <tr>
                                        <td>{$item.description}{if $item.taxed} *{/if}</td>
                                        <td class="text-center">{if $item.discountpc > 0}{$item.discount} ({$item.discountpc}%){else} - {/if}</td>
                                        <td class="text-center">{$item.amount}</td>
                                    </tr>
                                {/foreach}
                                <tr>
                                    <td colspan="2" class="total-row text-right"><strong>{lang key='invoicessubtotal'}</strong></td>
                                    <td class="total-row text-center">{$subtotal}</td>
                                </tr>
                                {if $taxrate}
                                    <tr>
                                        <td colspan="2" class="total-row text-right"><strong>{$taxrate}% {$taxname}</strong></td>
                                        <td class="total-row text-center">{$tax}</td>
                                    </tr>
                                {/if}
                                {if $taxrate2}
                                    <tr>
                                        <td colspan="2" class="total-row text-right"><strong>{$taxrate2}% {$taxname2}</strong></td>
                                        <td class="total-row text-center">{$tax2}</td>
                                    </tr>
                                {/if}
                                <tr>
                                    <td colspan="2" class="total-row text-right"><strong>{lang key='quotelinetotal'}</strong></td>
                                    <td class="total-row text-center">{$total}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            {if $notes}
                {include file="$template/includes/panel.tpl" type="info" headerTitle="{lang key='invoicesnotes'}" bodyContent=$notes}
            {/if}

            {if $taxrate}
                <p>* {lang key='invoicestaxindicator'}</p>
            {/if}

            <div class="float-right btn-group btn-group-sm d-print-none">
                <a href="javascript:window.print()" class="btn btn-default"><i class="fas fa-print"></i> {lang key='print'}</a>
                <a href="dl.php?type=q&amp;id={$quoteid}" class="btn btn-default"><i class="fas fa-download"></i> {lang key='invoicesdownload'}</a>
            </div>

        {/if}

    </div>

    <p class="text-center d-print-none"><a href="clientarea.php">{lang key='invoicesbacktoclientarea'}</a></a></p>

    <form method="post" action="viewquote.php?id={$quoteid}&amp;action=accept">
        <div class="modal fade" id="acceptQuoteModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">{lang key='quoteacceptbtn'}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <p>{lang key='quoteacceptagreetos'}</p>
                        <p class="text-center">
                            <label class="form-check form-check-inline" id="quoteAcceptAgreeTos">
                                <input type="checkbox" class="form-check-input" name="agreetos" />
                                {lang key='ordertosagreement'} <a href="{$tosurl}" target="_blank">{lang key='ordertos'}</a>
                            </label>
                        </p>
                        <small>{lang key='quoteacceptcontractwarning'}</small>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">{lang key='cancel'}</button>
                        <button type="submit" class="btn btn-primary">{lang key='quoteacceptbtn'}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
