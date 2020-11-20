{if $errormessage}

    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage textcenter=true}

{else}

    <div class="card py-3">
        <div class="card-body">
            {include file="$template/includes/alert.tpl" type="success" msg="{lang key='sslconfigcomplete'}" textcenter=true}

            <div class="pb-3">{lang key='sslconfigcompletedetails'}</div>

            <form method="post" action="clientarea.php?action=productdetails">
                <input type="hidden" name="id" value="{$serviceid}" />
                <p class="text-center">
                    <button type="submit" class="btn btn-default">
                        {lang key='invoicesbacktoclientarea'}
                    </button>
                </p>
            </form>
        </div>
    </div>
{/if}
