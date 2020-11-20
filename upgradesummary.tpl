<div class="card">
    <div class="card-body">
        {if $promoerror}
            {include file="$template/includes/alert.tpl" type="error" msg=$promoerror textcenter=true}
        {/if}

        {if $promorecurring}
            {include file="$template/includes/alert.tpl" type="info"
            msg="{lang key='recurringpromodesc'}"|sprintf2:$promorecurring textcenter=true}
        {/if}

        <div class="alert alert-block alert-info text-center">
            {lang key='upgradecurrentconfig'}: <strong>{$groupname} - {$productname}</strong>{if $domain} ({$domain}){/if}
        </div>

        <table class="table table-striped">
            <thead>
            <tr>
                <th width="60%">{lang key='orderdesc'}</th>
                <th width="40%" class="text-center">{lang key='orderprice'}</th>
            </tr>
            </thead>
            <tbody>
            {foreach $upgrades as $upgrade}
                {if $type eq "package"}
                    <tr>
                        <td><input type="hidden" name="pid" value="{$upgrade.newproductid}" /><input type="hidden" name="billingcycle" value="{$upgrade.newproductbillingcycle}" />{$upgrade.oldproductname} => {$upgrade.newproductname}</td>
                        <td class="text-center">{$upgrade.price}</td>
                    </tr>
                {elseif $type eq "configoptions"}
                    <tr>
                        <td>{$upgrade.configname}: {$upgrade.originalvalue} => {$upgrade.newvalue}</td>
                        <td class="text-center">{$upgrade.price}</td>
                    </tr>
                {/if}
            {/foreach}
            <tr class="masspay-total">
                <td class="text-right">{lang key='ordersubtotal'}:</td>
                <td class="text-center">{$subtotal}</td>
            </tr>
            {if $promodesc}
                <tr class="masspay-total">
                    <td class="text-right">{$promodesc}:</td>
                    <td class="text-center">{$discount}</td>
                </tr>
            {/if}
            {if $taxrate}
                <tr class="masspay-total">
                    <td class="text-right">{$taxname} @ {$taxrate}%:</td>
                    <td class="text-center">{$tax}</td>
                </tr>
            {/if}
            {if $taxrate2}
                <tr class="masspay-total">
                    <td class="text-right">{$taxname2} @ {$taxrate2}%:</td>
                    <td class="text-center">{$tax2}</td>
                </tr>
            {/if}
            <tr class="masspay-total">
                <td class="text-right">{lang key='ordertotalduetoday'}:</td>
                <td class="text-center">{$total}</td>
            </tr>
            </tbody>
        </table>

        {if $type eq "package"}
            {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='upgradeproductlogic'}"|cat:' ('|cat:$upgrade.daysuntilrenewal|cat:' '|cat:"{lang key='days'}"|cat:')' textcenter=true}
        {/if}

        <div class="row">
            <div class="col-sm-6">

                <form method="post" action="{$smarty.server.PHP_SELF}" role="form">
                    <input type="hidden" name="step" value="2" />
                    <input type="hidden" name="type" value="{$type}" />
                    <input type="hidden" name="id" value="{$id}" />
                    {if $type eq "package"}
                        <input type="hidden" name="pid" value="{$upgrades.0.newproductid}" />
                        <input type="hidden" name="billingcycle" value="{$upgrades.0.newproductbillingcycle}" />
                    {/if}
                    <h2>{lang key='orderpromotioncode'}</h2>
                    {foreach $configoptions as $cid => $value}
                        <input type="hidden" name="configoption[{$cid}]" value="{$value}" />
                    {/foreach}
                    <div class="input-group">
                        <input class="form-control" type="text" name="promocode" placeholder="{lang key='orderpromotioncode'}" width="40"
                               {if $promocode}value="{$promocode} - {$promodesc}" disabled="disabled"{/if}>
                        {if $promocode}
                            <div class="input-group-append">
                                <button type="submit" name="removepromo" class="btn btn-danger">
                                    {lang key='orderdontusepromo'}
                                </button>
                            </div>
                        {else}
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-success">
                                    {lang key='orderpromovalidatebutton'}
                                </button>
                            </div>
                        {/if}
                    </div>
                </form>

            </div>
            <div class="col-sm-6">

                <form method="post" action="{$smarty.server.PHP_SELF}">
                    <input type="hidden" name="step" value="3" />
                    <input type="hidden" name="type" value="{$type}" />
                    <input type="hidden" name="id" value="{$id}" />
                    {if $type eq "package"}
                        <input type="hidden" name="pid" value="{$upgrades.0.newproductid}" />
                        <input type="hidden" name="billingcycle" value="{$upgrades.0.newproductbillingcycle}" />
                    {/if}
                    {foreach $configoptions as $cid => $value}
                        <input type="hidden" name="configoption[{$cid}]" value="{$value}" />
                    {/foreach}
                    {if $promocode}<input type="hidden" name="promocode" value="{$promocode}">{/if}

                    <h2>{lang key='orderpaymentmethod'}</h2>
                    <div class="form-group">
                        <select name="paymentmethod" id="inputPaymentMethod" class="form-control custom-select">
                            {if $allowgatewayselection}
                                <option value="none">{lang key='paymentmethoddefault'}</option>
                            {/if}
                            {foreach $gateways as $gateway}
                                <option value="{$gateway.sysname}"{if $gateway.sysname eq $selectedgateway} selected="selected"{/if}>{$gateway.name}</option>
                            {/foreach}
                        </select>
                    </div>

            </div>
        </div>

        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary" id="btnOrderContinue">
                {lang key='continue'} <i class="fas fa-arrow-right"></i>
            </button>
        </div>

        </form>

    </div>
</div>