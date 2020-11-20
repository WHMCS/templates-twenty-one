{if $inactive}

    {include file="$template/includes/alert.tpl" type="danger" msg="{lang key='affiliatesdisabled'}" textcenter=true}

{else}

    {if $withdrawrequestsent}
        <div class="alert alert-success">
            <i class="fas fa-check fa-fw"></i>
            {lang key='affiliateswithdrawalrequestsuccessful'}
        </div>
    {/if}

    <div class="row">

        <div class="col-md-4">
            <div class="affiliate-stat affiliate-stat-green alert-warning mb-2">
                <i class="fas fa-users"></i>
                <span>{$visitors}</span>
                {lang key='affiliatesclicks'}
            </div>
        </div>

        <div class="col-md-4">
            <div class="affiliate-stat affiliate-stat-green alert-info mb-2">
                <i class="fas fa-shopping-cart"></i>
                <span>{$signups}</span>
                {lang key='affiliatessignups'}
            </div>
        </div>

        <div class="col-md-4">
            <div class="affiliate-stat affiliate-stat-green alert-success mb-2">
                <i class="far fa-chart-bar"></i>
                <span>{$conversionrate}%</span>
                {lang key='affiliatesconversionrate'}
            </div>
        </div>

    </div>

    <div class="card my-3">
        <div class="card-body">

            <p class="h3">{lang key='affiliatesreferallink'}</p>
            <input type="text" class="form-control" readonly="readonly" value="{$referrallink}">

        </div>
    </div>

    <div class="row">
        <div class="col-md-8 offset-md-2">
            <table class="table table-bordered table-striped table-rounded">
                <tr>
                    <td class="text-right">{lang key='affiliatescommissionspending'}:</td>
                    <td><strong>{$pendingcommissions}</strong></td>
                </tr>
                <tr>
                    <td class="text-right">{lang key='affiliatescommissionsavailable'}:</td>
                    <td><strong>{$balance}</strong></td>
                </tr>
                <tr>
                    <td class="text-right">{lang key='affiliateswithdrawn'}:</td>
                    <td><strong>{$withdrawn}</strong></td>
                </tr>
            </table>
        </div>
    </div>

    {if !$withdrawrequestsent}
        <p class="text-center">
            <a href="{$smarty.server.PHP_SELF}?action=withdrawrequest" class="btn btn-lg btn-danger"{if !$withdrawlevel} disabled="true"{/if}>
                <i class="fas fa-university"></i> {lang key='affiliatesrequestwithdrawal'}
            </a>
        </p>
        {if !$withdrawlevel}
            <p class="text-muted text-center">{lang key="affiliateWithdrawalSummary" amountForWithdrawal=$affiliatePayoutMinimum}</p>
        {/if}
    {/if}

    <h2>{lang key='affiliatesreferals'}</h2>

    {include file="$template/includes/tablelist.tpl" tableName="AffiliatesList"}
    <script>
        jQuery(document).ready(function() {
            var table = jQuery('#tableAffiliatesList').show().DataTable();

            {if $orderby == 'regdate'}
                table.order(0, '{$sort}');
            {elseif $orderby == 'product'}
                table.order(1, '{$sort}');
            {elseif $orderby == 'amount'}
                table.order(2, '{$sort}');
            {elseif $orderby == 'status'}
                table.order(4, '{$sort}');
            {/if}
            table.draw();
            jQuery('#tableLoading').hide();
        });
    </script>
    <div class="table-container clearfix">
        <table id="tableAffiliatesList" class="table table-list w-hidden">
            <thead>
                <tr>
                    <th>{lang key='affiliatessignupdate'}</th>
                    <th>{lang key='orderproduct'}</th>
                    <th>{lang key='affiliatesamount'}</th>
                    <th>{lang key='affiliatescommission'}</th>
                    <th>{lang key='affiliatesstatus'}</th>
                </tr>
            </thead>
            <tbody>
            {foreach $referrals as $referral}
                <tr class="text-center">
                    <td><span class="w-hidden">{$referral.datets}</span>{$referral.date}</td>
                    <td>{$referral.service}</td>
                    <td data-order="{$referral.amountnum}">{$referral.amountdesc}</td>
                    <td data-order="{$referral.commissionnum}">{$referral.commission}</td>
                    <td><span class='label status status-{$referral.rawstatus|strtolower}'>{$referral.status}</span></td>
                </tr>
            {/foreach}
            </tbody>
        </table>
        <div class="text-center" id="tableLoading">
            <p><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</p>
        </div>
    </div>

    {if $affiliatelinkscode}
        <h2>{lang key='affiliateslinktous'}</h2>
        <div class="margin-bottom text-center">
            {$affiliatelinkscode}
        </div>
    {/if}

{/if}
