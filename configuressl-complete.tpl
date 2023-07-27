{if $errormessage}

    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage textcenter=true}

{else}

    <div class="card py-3">
        <div class="card-body">
            {include file="$template/includes/alert.tpl" type="success" msg="{lang key='sslconfigcomplete'}" textcenter=true}

            <h4 class="text-center">{lang key='ssl.nextSteps'}</h4>

            {if is_null($authData) || (!is_null($authData) && $authData->methodNameConstant() == 'emailauth')}
                {include file="$template/includes/alert.tpl" type="info" msg="{lang key='ssl.emailSteps'}"}
                {if !is_null($authData)}
                    <div class="pb-3 text-center">{lang key='ssl.emailInformation'}</div>
                    <div class="form-group row">
                        <label for="emailApprover" class="control-label col-md-4 col-form-label text-md-right">{lang key='email'}</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="emailApprover" value="{$authData->email}" readonly/>
                        </div>
                    </div>
                {/if}
            {elseif !is_null($authData) && $authData->methodNameConstant() == 'dnsauth'}
                {include file="$template/includes/alert.tpl" type="info" msg="{lang key='ssl.dnsSteps'}"}
                <div class="pb-3 text-center">{lang key='ssl.dnsRecordInformation'}</div>
                <div class="form-group row">
                    <label for="recordType" class="control-label col-md-4 col-form-label text-md-right">{lang key='ssl.type'}</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="recordType" value="{$authData->type}" readonly/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="host" class="control-label col-md-4 col-form-label text-md-right">{lang key='ssl.host'}</label>
                    <div class="col-md-8">
                        <div class="input-group">
                            <input type="text" class="form-control" id="host" value="{$authData->host}" readonly/>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-default btn-sm copy-to-clipboard" data-clipboard-target="#host">
                                    <img src="{$WEB_ROOT}/assets/img/clippy.svg" alt="Copy to clipboard" width="15">
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="dnsContents" class="control-label col-md-4 col-form-label text-md-right">{lang key='ssl.value'}</label>
                    <div class="col-md-8">
                        <div class="input-group">
                            <input type="text" class="form-control" id="dnsContents" value="{$authData->value}" readonly/>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-default btn-sm copy-to-clipboard" data-clipboard-target="#dnsContents">
                                    <img src="{$WEB_ROOT}/assets/img/clippy.svg" alt="Copy to clipboard" width="15">
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            {elseif !empty($authData) && $authData->methodNameConstant() == 'fileauth'}
                {include file="$template/includes/alert.tpl" type="info" msg="{lang key='ssl.fileSteps'}"}
                <div class="pb-3 text-center">{lang key='ssl.fileInformation'}</div>
                <div class="form-group row">
                    <label for="fileName" class="control-label col-md-4 col-form-label text-md-right">{lang key='ssl.url'}</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" id="fileName"
                               value="http://{$domain}/{$authData->filePath()}" readonly/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="fileContents" class="control-label col-md-4 col-form-label text-md-right">{lang key='ssl.value'}</label>
                    <div class="col-md-8">
                        <div class="input-group">
                            <input type="text" class="form-control" id="fileContents" value="{$authData->contents}" readonly/>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-default btn-sm copy-to-clipboard" data-clipboard-target="#fileContents">
                                    <img src="{$WEB_ROOT}/assets/img/clippy.svg" alt="Copy to clipboard" width="15">
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            {/if}

            <form method="post" action="clientarea.php?action=productdetails">
                <input type="hidden" name="id" value="{$serviceid}" />
                <p class="text-center mt-3">
                    <button type="submit" class="btn btn-default">
                        {lang key='invoicesbacktoclientarea'}
                    </button>
                </p>
            </form>
        </div>
    </div>
{/if}
