{if $reason eq "supportandupdates"}

    {include file="$template/includes/alert.tpl" type="error" msg="{lang key='supportAndUpdatesExpiredLicense'}{if $licensekey}: {$licensekey}{else}.{/if}" textcenter=true}

{/if}

<div class="card">
    <div class="card-body">
        {if $reason eq "supportandupdates"}

            <p>{lang key='supportAndUpdatesRenewalRequired'}</p>

            <form action="{$systemsslurl}cart.php?a=add" method="post">
                <input type="hidden" name="productid" value="{$serviceid}" />
                <input type="hidden" name="aid" value="{$addonid}" />
                <div class="text-center">
                    <button type="submit" class="btn btn-default">
                        {lang key='supportAndUpdatesClickHereToRenew'} &raquo;
                    </button>
                </div>
            </form>

        {else}

            <p>{lang key='downloadproductrequired'}</p>

            {if $prodname}
                {include file="$template/includes/alert.tpl" type="info" msg=$prodname textcenter=true}
            {else}
                {include file="$template/includes/alert.tpl" type="info" msg=$addonname textcenter=true}
            {/if}

            {if $pid || $aid}
                <form action="{$systemsslurl}cart.php" method="post">
                    {if $pid}
                        <input type="hidden" name="a" value="add" />
                        <input type="hidden" name="pid" value="{$pid}" />
                    {elseif $aid}
                        <input type="hidden" name="gid" value="addons" />
                    {/if}
                    <div class="text-center">
                        <button type="submit" class="btn btn-default">
                            {lang key='ordernowbutton'} &raquo;
                        </button>
                    </div>
                </form>
            {/if}

        {/if}
    </div>
</div>
