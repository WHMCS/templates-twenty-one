{if $invalid}

    {include file="$template/includes/alert.tpl" type="error" msg="{lang key='clientareacancelinvalid'}" textcenter=true}
    <p class="text-center">
        <a href="clientarea.php?action=productdetails&amp;id={$id}" class="btn btn-primary">{lang key='clientareabacklink'}</a>
    </p>

{elseif $requested}

    {include file="$template/includes/alert.tpl" type="success" msg="{lang key='clientareacancelconfirmation'}" textcenter=true}

    <p class="text-center">
        <a href="clientarea.php?action=productdetails&amp;id={$id}" class="btn btn-primary">{lang key='clientareabacklink'}</a>
    </p>

{else}

    {if $error}
        {include file="$template/includes/alert.tpl" type="error" errorshtml="<li>{lang key='clientareacancelreasonrequired'}</li>"}
    {/if}

    {include file="$template/includes/alert.tpl" type="info" textcenter=true msg="{lang key='clientareacancelproduct'}: <strong>{$groupname} - {$productname}</strong>{if $domain} ({$domain}){/if}"}

    <div class="card">
        <div class="card-body">

            <form method="post" action="{$smarty.server.PHP_SELF}?action=cancel&amp;id={$id}" class="form-stacked">
                <input type="hidden" name="sub" value="submit" />

                <fieldset>
                    <div class="form-group">
                        <label for="cancellationreason">{lang key='clientareacancelreason'}</label>
                    <textarea name="cancellationreason" id="cancellationreason" class="form-control fullwidth" rows="6"></textarea>
                    </div>

                    {if $domainid}
                        <div class="alert alert-warning">
                            <p><strong>{lang key='cancelrequestdomain'}</strong></p>
                            <p>{"{lang key='cancelrequestdomaindesc'}"|sprintf2:$domainnextduedate:$domainprice:$domainregperiod}</p>
                            <label class="form-check text-center">
                                <input type="checkbox" class="form-check-input" name="canceldomain" id="canceldomain" /> {lang key='cancelrequestdomainconfirm'}
                            </label>
                        </div>
                    {/if}

                    <div class="form-group text-center">
                        <label class="col-form-label" for="type">{lang key='clientareacancellationtype'}</label>
                        <span class="d-inline-block">
                            <select name="type" id="type" class="form-control">
                                <option value="Immediate">{lang key='clientareacancellationimmediate'}</option>
                                <option value="End of Billing Period">{lang key='clientareacancellationendofbillingperiod'}</option>
                            </select>
                        </span>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-danger">
                            {lang key='clientareacancelrequestbutton'}
                        </button>
                        <a href="clientarea.php?action=productdetails&id={$id}" class="btn btn-default">{lang key='cancel'}</a>
                    </div>
                </fieldset>

            </form>

        </div>
    </div>

{/if}
