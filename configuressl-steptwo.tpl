{if empty($approvalMethods)}
    {assign var="approvalMethods" value=[]}
{/if}
<div class="card">
    <div class="card-body">
        {if $errormessage}
            {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
        {/if}
        <form method="post" action="{$smarty.server.PHP_SELF}?cert={$cert}&step=3">

            <h2 class="card-title">{lang key='ssl.selectValidation'}</h2>
            {if empty($approvalMethods) || (!empty($approvalMethods) && in_array('email', $approvalMethods))}
                <label class="form-check form-check-inline">
                    <input type="radio" class="icheck-button" name="approval_method" value="email" checked>
                    <strong class="name">{lang key='ssl.emailMethod'}</strong>
                </label>
            {/if}
            {if in_array('dns-txt-token', $approvalMethods)}
                <label class="form-check form-check-inline">
                    <input type="radio" class="icheck-button" name="approval_method" value="dns-txt-token">
                    <strong class="name">{lang key='ssl.dnsMethod'}</strong>
                </label>
            {/if}
            {if in_array('file', $approvalMethods)}
                <label class="form-check form-check-inline">
                    <input type="radio" class="icheck-button" name="approval_method" value="file">
                    <strong class="name">{lang key='ssl.fileMethod'}</strong>
                </label>
            {/if}

            <div class="tab-content pt-3">
                <div id="containerApprovalMethodEmail">
                    {include file="$template/includes/alert.tpl" type="secondary" msg={lang key='ssl.emailMethodDescription'}}
                    <p>{lang key='ssl.selectEmail'}</p>
                    <div class="row pt-2">
                        <div class="col-sm-10 offset-sm-1">
                            <div class="list-group">
                                {foreach $approveremails as $num => $approveremail}
                                    <div class="list-group-item">
                                        <label class="mb-0">
                                            <input type="radio" name="approveremail"
                                                   value="{$approveremail}"{if $num eq 0} checked{/if}>
                                            {$approveremail}
                                        </label>
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                    </div>
                </div>
                <div id="containerApprovalMethodDns" class="w-hidden">
                    {include file="$template/includes/alert.tpl" type="secondary" msg={lang key='ssl.dnsMethodDescription'}}
                </div>
                <div id="containerApprovalMethodFile" class="w-hidden">
                    {include file="$template/includes/alert.tpl" type="secondary" msg={lang key='ssl.fileMethodDescription'}}
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

