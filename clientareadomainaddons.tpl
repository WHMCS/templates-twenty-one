<div class="card">
    <div class="card-body">

        <form method="post" action="{$smarty.server.PHP_SELF}?action=domainaddons">
            <input type="hidden" name="{$action}" value="{$addon}">
            <input type="hidden" name="id" value="{$domainid}">
            <input type="hidden" name="confirm" value="1">
            <input type="hidden" name="token" value="{$token}">

            {if $action eq "buy"}
                <input type="hidden" name="buy" value="{$addon}">

                {if $addon eq "dnsmanagement"}

                    <h3 class="card-title">{lang key='domainaddonsdnsmanagement'}</h3>

                    {include file="$template/includes/alert.tpl" type="info" msg="Domain: <strong>{$domain}</strong>" textcenter=true}

                    <p>{lang key='domainaddonsdnsmanagementinfo'}</p>

                    <p class="text-center">
                        <button type="submit" name="enable" class="btn btn-success btn-lg">
                            {lang key='domainaddonsbuynow'} {$addonspricing.dnsmanagement}{lang key='domainaddonsperyear'}
                        </button>
                    </p>

                {elseif $addon eq "emailfwd"}

                    <h3 class="card-title">{lang key='domainemailforwarding'}</h3>

                    {include file="$template/includes/alert.tpl" type="info" msg="Domain: <strong>{$domain}</strong>" textcenter=true}

                    <p>{lang key='domainaddonsemailforwardinginfo'}</p>

                    <p class="text-center">
                        <button type="submit" name="enable" class="btn btn-success btn-lg">
                            {lang key='domainaddonsbuynow'} {$addonspricing.emailforwarding}{lang key='domainaddonsperyear'}
                        </button>
                    </p>

                {elseif $addon eq "idprotect"}

                    <h3 class="card-title">{lang key='domainidprotection'}</h3>

                    {include file="$template/includes/alert.tpl" type="info" msg="Domain: <strong>{$domain}</strong>" textcenter=true}

                    <p>{lang key='domainaddonsidprotectioninfo'}</p>

                    <p class="text-center">
                        <button type="submit" name="enable" class="btn btn-success btn-lg">
                            {lang key='domainaddonsbuynow'} {$addonspricing.idprotection}{lang key='domainaddonsperyear'}
                        </button>
                    </p>
                {/if}
            {elseif $action eq "disable"}
                <input type="hidden" name="disable" value="{$addon}">
                <h3 class="card-title">
                    {if $addon eq "dnsmanagement"}
                        {lang key='domainaddonsdnsmanagement'}
                    {elseif $addon eq "emailfwd"}
                        {lang key='domainemailforwarding'}
                    {elseif $addon eq "idprotect"}
                        {lang key='domainidprotection'}
                    {/if}
                </h3>

                {include file="$template/includes/alert.tpl" type="info" msg="Domain: <strong>{$domain}</strong>" textcenter=true}

                {if $success}
                    {include file="$template/includes/alert.tpl" type="success" msg="{lang key='domainaddonscancelsuccess'}" textcenter=true}
                {elseif $error}
                    {include file="$template/includes/alert.tpl" type="error" msg="{lang key='domainaddonscancelfailed'}" textcenter=true}
                {else}
                    <p class="text-center">
                        {lang key='domainaddonscancelareyousure'}
                    </p>

                    <p class="text-center">
                        <button type="submit" name="enable" class="btn btn-danger btn-lg">
                            {lang key='domainaddonsconfirm'}
                        </button>
                    </p>
                {/if}
            {/if}

        </form>

    </div>
</div>

<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn btn-default">
    {lang key='clientareabacklink'}
</a>
