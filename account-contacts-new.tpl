{if $errorMessageHtml}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errorMessageHtml}
{/if}

<script>
    var stateNotRequired = true;
    jQuery(document).ready(function() {
        WHMCS.form.register();
    });
</script>
<script src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

<div class="alert alert-block alert-info">
    <form role="form" method="post" action="{routePath('account-contacts')}">
        <div class="row">
            <label for="inputContactId" class="col-md-3 col-form-label">{lang key='clientareachoosecontact'}</label>
            <div class="col-md-6">
                <select name="contactid" id="inputContactId" onchange="submit()" class="form-control custom-select">
                    {foreach $contacts as $contact}
                        <option value="{$contact.id}">{$contact.name} - {$contact.email}</option>
                    {/foreach}
                    <option value="new" selected="selected">{lang key='clientareanavaddcontact'}</option>
                </select>
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-default btn-block mt-2 mt-md-0">{lang key='go'}</button>
            </div>
        </div>
    </form>
</div>

<div class="card">
    <div class="card-body">

        <h3 class="card-title">{lang key='clientareanavaddcontact'}</h3>

        <form role="form" method="post" action="{routePath('account-contacts-new')}">

            <div class="row">
                <div class="col-md-6">

                    <div class="form-group">
                        <label for="inputFirstName" class="col-form-label">{lang key='clientareafirstname'}</label>
                        <input type="text" name="firstname" id="inputFirstName" value="{$formdata.firstname}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputLastName" class="col-form-label">{lang key='clientarealastname'}</label>
                        <input type="text" name="lastname" id="inputLastName" value="{$formdata.lastname}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputCompanyName" class="col-form-label">{lang key='clientareacompanyname'}</label>
                        <input type="text" name="companyname" id="inputCompanyName" value="{$formdata.companyname}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputEmail" class="col-form-label">{lang key='clientareaemail'}</label>
                        <input type="email" name="email" id="inputEmail" value="{$formdata.email}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputPhone" class="col-form-label">{lang key='clientareaphonenumber'}</label>
                        <input type="tel" name="phonenumber" id="inputPhone" value="{$formdata.phonenumber}" class="form-control" />
                    </div>

                    {if $showTaxIdField}
                        <div class="form-group">
                            <label for="inputTaxId" class="col-form-label">{lang key=$taxIdLabel}</label>
                            <input type="text" name="tax_id" id="inputTaxId" class="form-control" value="{$formdata.tax_id}" />
                        </div>
                    {/if}

                </div>
                <div class="col-md-6 col-12 float-right">

                    <div class="form-group">
                        <label for="inputAddress1" class="col-form-label">{lang key='clientareaaddress1'}</label>
                        <input type="text" name="address1" id="inputAddress1" value="{$formdata.address1}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputAddress2" class="col-form-label">{lang key='clientareaaddress2'}</label>
                        <input type="text" name="address2" id="inputAddress2" value="{$formdata.address2}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputCity" class="col-form-label">{lang key='clientareacity'}</label>
                        <input type="text" name="city" id="inputCity" value="{$formdata.city}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputState" class="col-form-label">{lang key='clientareastate'}</label>
                        <input type="text" name="state" id="inputState" value="{$formdata.state}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label for="inputPostcode" class="col-form-label">{lang key='clientareapostcode'}</label>
                        <input type="text" name="postcode" id="inputPostcode" value="{$formdata.postcode}" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label class="col-form-label" for="country">{lang key='clientareacountry'}</label>
                        {$countriesdropdown}
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">

            <h3 class="card-title">{lang key='clientareacontactsemails'}</h3>
            <div class="controls form-check">
                {foreach $formdata.emailPreferences as $emailType => $value}
                    <label>
                    <input type="hidden" name="email_preferences[{$emailType}]" value="0">
                    <input type="checkbox" class="form-check-input" name="email_preferences[{$emailType}]" id="{$emailType}emails" value="1"{if $value} checked="checked"{/if} />
                    {lang key="clientareacontactsemails"|cat:$emailType}
                    </label>{if !($emailType@last)}<br />{/if}
                {/foreach}
            </div>
        </div>
    </div>

    <div class="form-group text-center">
        <input class="btn btn-primary" type="submit" name="save" value="{lang key='clientareasavechanges'}" />
        <input class="btn btn-default" type="reset" value="{lang key='cancel'}" />
    </div>

</form>
