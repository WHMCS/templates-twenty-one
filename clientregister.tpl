{if in_array('state', $optionalFields)}
    <script>
        var statesTab = 10,
            stateNotRequired = true;
    </script>
{/if}

<script src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<script src="{$BASE_PATH_JS}/PasswordStrength.js"></script>
<script>
    window.langPasswordStrength = "{lang key='pwstrength'}";
    window.langPasswordWeak = "{lang key='pwstrengthweak'}";
    window.langPasswordModerate = "{lang key='pwstrengthmoderate'}";
    window.langPasswordStrong = "{lang key='pwstrengthstrong'}";
    jQuery(document).ready(function() {
        jQuery("#inputNewPassword1").keyup(registerFormPasswordStrengthFeedback);
    });
</script>
{if $registrationDisabled}
    {include file="$template/includes/alert.tpl" type="error" msg="{lang key='registerCreateAccount'}"|cat:' <strong><a href="cart.php" class="alert-link">'|cat:"{lang key='registerCreateAccountOrder'}"|cat:'</a></strong>'}
{/if}

{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}

{if !$registrationDisabled}
    <div id="registration">
        <form method="post" class="using-password-strength" action="{$smarty.server.PHP_SELF}" role="form" name="orderfrm" id="frmCheckout">
            <input type="hidden" name="register" value="true"/>

            <div id="containerNewUserSignup">

                {include file="$template/includes/linkedaccounts.tpl" linkContext="registration"}

                <div class="card mb-4">
                    <div class="card-body p-4">
                        <h3 class="card-title">{lang key='orderForm.personalInformation'}</h3>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group prepend-icon">
                                    <label for="inputFirstName" class="field-icon">
                                        <i class="fas fa-user"></i>
                                    </label>
                                    <input type="text" name="firstname" id="inputFirstName" class="field form-control" placeholder="{lang key='orderForm.firstName'}" value="{$clientfirstname}" {if !in_array('firstname', $optionalFields)}required{/if} autofocus>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group prepend-icon">
                                    <label for="inputLastName" class="field-icon">
                                        <i class="fas fa-user"></i>
                                    </label>
                                    <input type="text" name="lastname" id="inputLastName" class="field form-control" placeholder="{lang key='orderForm.lastName'}" value="{$clientlastname}" {if !in_array('lastname', $optionalFields)}required{/if}>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group prepend-icon">
                                    <label for="inputEmail" class="field-icon">
                                        <i class="fas fa-envelope"></i>
                                    </label>
                                    <input type="email" name="email" id="inputEmail" class="field form-control" placeholder="{lang key='orderForm.emailAddress'}" value="{$clientemail}">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group prepend-icon">
                                    <label for="inputPhone" class="field-icon">
                                        <i class="fas fa-phone"></i>
                                    </label>
                                    <input type="tel" name="phonenumber" id="inputPhone" class="field" placeholder="{lang key='orderForm.phoneNumber'}" value="{$clientphonenumber}">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-body p-4">
                        <h3 class="card-title">{lang key='orderForm.billingAddress'}</h3>

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group prepend-icon">
                                    <label for="inputCompanyName" class="field-icon">
                                        <i class="fas fa-building"></i>
                                    </label>
                                    <input type="text" name="companyname" id="inputCompanyName" class="field" placeholder="{lang key='orderForm.companyName'} ({lang key='orderForm.optional'})" value="{$clientcompanyname}">
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group prepend-icon">
                                    <label for="inputAddress1" class="field-icon">
                                        <i class="far fa-building"></i>
                                    </label>
                                    <input type="text" name="address1" id="inputAddress1" class="field form-control" placeholder="{lang key='orderForm.streetAddress'}" value="{$clientaddress1}"  {if !in_array('address1', $optionalFields)}required{/if}>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group prepend-icon">
                                    <label for="inputAddress2" class="field-icon">
                                        <i class="fas fa-map-marker-alt"></i>
                                    </label>
                                    <input type="text" name="address2" id="inputAddress2" class="field" placeholder="{lang key='orderForm.streetAddress2'}" value="{$clientaddress2}">
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group prepend-icon">
                                    <label for="inputCity" class="field-icon">
                                        <i class="far fa-building"></i>
                                    </label>
                                    <input type="text" name="city" id="inputCity" class="field form-control" placeholder="{lang key='orderForm.city'}" value="{$clientcity}"  {if !in_array('city', $optionalFields)}required{/if}>
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="form-group prepend-icon">
                                    <label for="state" class="field-icon" id="inputStateIcon">
                                        <i class="fas fa-map-signs"></i>
                                    </label>
                                    <label for="stateinput" class="field-icon" id="inputStateIcon">
                                        <i class="fas fa-map-signs"></i>
                                    </label>
                                    <input type="text" name="state" id="state" class="field form-control" placeholder="{lang key='orderForm.state'}" value="{$clientstate}"  {if !in_array('state', $optionalFields)}required{/if}>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group prepend-icon">
                                    <label for="inputPostcode" class="field-icon">
                                        <i class="fas fa-certificate"></i>
                                    </label>
                                    <input type="text" name="postcode" id="inputPostcode" class="field form-control" placeholder="{lang key='orderForm.postcode'}" value="{$clientpostcode}" {if !in_array('postcode', $optionalFields)}required{/if}>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group prepend-icon">
                                    <label for="inputCountry" class="field-icon" id="inputCountryIcon">
                                        <i class="fas fa-globe"></i>
                                    </label>
                                    <select name="country" id="inputCountry" class="field form-control">
                                        {foreach $clientcountries as $countryCode => $countryName}
                                            <option value="{$countryCode}"{if (!$clientcountry && $countryCode eq $defaultCountry) || ($countryCode eq $clientcountry)} selected="selected"{/if}>
                                                {$countryName}
                                            </option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            {if $showTaxIdField}
                                <div class="col-sm-12">
                                    <div class="form-group prepend-icon">
                                        <label for="inputTaxId" class="field-icon">
                                            <i class="fas fa-building"></i>
                                        </label>
                                        <input type="text" name="tax_id" id="inputTaxId" class="field" placeholder="{$taxLabel} ({lang key='orderForm.optional'})" value="{$clientTaxId}">
                                    </div>
                                </div>
                            {/if}
                        </div>

                    </div>
                </div>

                {if $customfields || $currencies}

                    <div class="card mb-4">
                        <div class="card-body p-4">
                            <h3 class="card-title">{lang key='orderadditionalrequiredinfo'}<br><i><small>{lang key='orderForm.requiredField'}</small></i></h3>

                            <div class="row">
                                {if $customfields}
                                    {foreach $customfields as $customfield}
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="customfield{$customfield.id}">{$customfield.name} {$customfield.required}</label>
                                                <div class="control">
                                                    {$customfield.input}
                                                {if $customfield.description}
                                                    <span class="field-help-text">{$customfield.description}</span>
                                                {/if}
                                                </div>
                                            </div>
                                        </div>
                                    {/foreach}
                                {/if}
                                {if $customfields && count($customfields)%2 > 0 }
                                    <div class="clearfix"></div>
                                {/if}
                                {if $currencies}
                                    <div class="col-sm-6">
                                        <div class="form-group prepend-icon">
                                            <label for="inputCurrency" class="field-icon">
                                                <i class="far fa-money-bill-alt"></i>
                                            </label>
                                            <select id="inputCurrency" name="currency" class="field form-control">
                                                {foreach $currencies as $curr}
                                                    <option value="{$curr.id}"{if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>{$curr.code}</option>
                                                {/foreach}
                                            </select>
                                        </div>
                                    </div>
                                {/if}
                            </div>

                        </div>
                    </div>
                {/if}
            </div>

            <div id="containerNewUserSecurity" {if $remote_auth_prelinked && !$securityquestions } class="w-hidden"{/if}>

                <div class="card mb-4">
                    <div class="card-body p-4">
                        <h3 class="card-title">{lang key='orderForm.accountSecurity'}</h3>

                        <div id="containerPassword" class="row{if $remote_auth_prelinked && $securityquestions} hidden{/if}">
                            <div id="passwdFeedback" class="alert alert-info text-center col-sm-12 w-hidden"></div>
                            <div class="col-sm-6">
                                <div class="form-group prepend-icon">
                                    <label for="inputNewPassword1" class="field-icon">
                                        <i class="fas fa-lock"></i>
                                    </label>
                                    <input type="password" name="password" id="inputNewPassword1" data-error-threshold="{$pwStrengthErrorThreshold}" data-warning-threshold="{$pwStrengthWarningThreshold}" class="field" placeholder="{lang key='clientareapassword'}" autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group prepend-icon">
                                    <label for="inputNewPassword2" class="field-icon">
                                        <i class="fas fa-lock"></i>
                                    </label>
                                    <input type="password" name="password2" id="inputNewPassword2" class="field" placeholder="{lang key='clientareaconfirmpassword'}" autocomplete="off"{if $remote_auth_prelinked} value="{$password}"{/if}>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <button type="button" class="btn btn-default btn-sm btn-sm-block generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
                                        {lang key='generatePassword.btnLabel'}
                                    </button>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="password-strength-meter">
                                    <div class="progress">
                                        <div class="progress-bar bg-success bg-striped" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" id="passwordStrengthMeterBar">
                                        </div>
                                    </div>
                                    <p class="text-center small text-muted" id="passwordStrengthTextLabel">{lang key='pwstrength'}: {lang key='pwstrengthenter'}</p>
                                </div>
                            </div>
                        </div>
                        {if $securityquestions}
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <select name="securityqid" id="inputSecurityQId" class="field form-control">
                                        <option value="">{lang key='clientareasecurityquestion'}</option>
                                        {foreach $securityquestions as $question}
                                            <option value="{$question.id}"{if $question.id eq $securityqid} selected{/if}>
                                                {$question.question}
                                            </option>
                                        {/foreach}
                                    </select>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group prepend-icon">
                                        <label for="inputSecurityQAns" class="field-icon">
                                            <i class="fas fa-lock"></i>
                                        </label>
                                        <input type="password" name="securityqans" id="inputSecurityQAns" class="field form-control" placeholder="{lang key='clientareasecurityanswer'}" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        {/if}
                    </div>

                </div>
            </div>

            {if $showMarketingEmailOptIn}
                <div class="card mb-4">
                    <div class="card-body p-4">
                        <h3 class="card-title">{lang key='emailMarketing.joinOurMailingList'}</h3>
                        <p>{$marketingEmailOptInMessage}</p>
                        <input type="checkbox" name="marketingoptin" value="1"{if $marketingEmailOptIn} checked{/if} class="no-icheck toggle-switch-success" data-size="small" data-on-text="{lang key='yes'}" data-off-text="{lang key='no'}">
                    </div>
                </div>
            {/if}

            {include file="$template/includes/captcha.tpl"}

            {if $accepttos}
                <p class="text-center">
                    <label class="form-check">
                        <input type="checkbox" name="accepttos" class="form-check-input accepttos">
                        {lang key='ordertosagreement'} <a href="{$tosurl}" target="_blank">{lang key='ordertos'}</a>
                    </label>
                </p>
            {/if}

            <p align="center">
                <input class="btn btn-large btn-primary{$captcha->getButtonClass($captchaForm)}" type="submit" value="{lang key='clientregistertitle'}"/>
            </p>
        </form>
    </div>
{/if}
