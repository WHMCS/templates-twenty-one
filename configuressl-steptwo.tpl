<div class="card">
    <div class="card-body">
        {if $errormessage}
            {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
        {/if}
        <form method="post" action="{$smarty.server.PHP_SELF}?cert={$cert}&step=3">

            <h2 class="card-title">{lang key='sslcertapproveremail'}</h2>

            <div>{lang key='sslcertapproveremaildetails'}</div>

            <div class="row pt-3">
                <div class="col-sm-10 offset-sm-1">
                    <div class="list-group">
                        {foreach $approveremails as $num => $approveremail}
                            <div class="list-group-item">
                                <label class="mb-0">
                                    <input type="radio" name="approveremail" value="{$approveremail}"{if $num eq 0} checked{/if}>
                                    {$approveremail}
                                </label>
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>

            <div class="text-center pt-3">
                <button type="submit" class="btn btn-primary" id="btnOrderContinue">
                    {lang key='ordercontinuebutton'}
                </button>
            </div>

        </form>
    </div>
</div>

