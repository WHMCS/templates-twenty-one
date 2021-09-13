{if !$status}
    <div class="card py-3">
        <div class="card-body text-center">
            {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='sslinvalidlink'}" textcenter=true}
            <button type="button" onclick="history.go(-1)" class="btn btn-primary">
                {lang key='clientareabacklink'}
            </button>
        </div>
    </div>

{else}

    <form method="post" action="{if $status == 'Awaiting Configuration'}{$smarty.server.PHP_SELF}?cert={$cert}&step=2{else}clientarea.php?action=productdetails{/if}">
        <div class="card">
            <div class="card-body">
                {if $errormessage}
                    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
                {/if}
                {if $status eq "Awaiting Configuration"}

                    <h2 class="card-title">{lang key='sslserverinfo'}</h2>

                    {include file="$template/includes/alert.tpl" type="info" msg={lang key='sslserverinfodetails'}}

                    <div class="form-group pt-3">
                        <label for="inputServerType" class="text-md-right">{lang key='sslservertype'}</label>
                        <select name="servertype" id="inputServerType" class="custom-select">
                            <option value="" selected>{lang key='ssl.selectWebserver' serverType={lang key='sslservertype'}}</option>
                            {foreach $webservertypes as $webservertypeid => $webservertype}
                                <option value="{$webservertypeid}"{if $servertype eq $webservertypeid} selected{/if}>
                                    {$webservertype}
                                </option>
                            {/foreach}
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="inputCsr" class="text-md-right">{lang key='sslcsr'}</label>
                        <textarea name="csr" id="inputCsr" rows="7" class="form-control">{if $csr}{$csr}{else}-----BEGIN CERTIFICATE REQUEST-----
-----END CERTIFICATE REQUEST-----{/if}</textarea>
                    </div>

                    {foreach $additionalfields as $heading => $fields}
                        <div><strong>{$heading}</strong></div>
                        <fieldset>
                            {foreach $fields as $vals}
                                <div class="form-group row">
                                    <label class="col-md-4 col-form-label text-md-right" for="inputAdditionalField">{$vals.name}</label>
                                    <div class="col-md-8">
                                        {$vals.input} {$vals.description}
                                    </div>
                                </div>
                            {/foreach}
                        </fieldset>
                    {/foreach}
                </div>
            </div>
            <div class="card">
                <div class="card-body">

                    <h2 class="card-title">{lang key='ssladmininfo'}</h2>

                    {include file="$template/includes/alert.tpl" type="info" msg={lang key='ssladmininfodetails'}}

                    <fieldset class="pt-3">
                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label text-md-right" for="inputFirstName">{lang key='clientareafirstname'}</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="firstname" id="inputFirstName" value="{$firstname}" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label text-md-right" for="inputLastName">{lang key='clientarealastname'}</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="lastname" id="inputLastName" value="{$lastname}" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label text-md-right" for="inputOrgName">{lang key='organizationname'}</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="orgname" id="inputOrgName" value="{$orgname}" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label text-md-right" for="inputJobTitle">{lang key='jobtitle'}</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="jobtitle" id="inputJobTitle" value="{$jobtitle}" />
                                <p class="form-text text-muted">{lang key='jobtitlereqforcompany'}</p>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label text-md-right" for="inputEmail">{lang key='clientareaemail'}</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="email" id="inputEmail" value="{$email}" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label text-md-right" for="inputAddress1">{lang key='clientareaaddress1'}</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="address1" id="inputAddress1" value="{$address1}" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label text-md-right" for="inputAddress2">{lang key='clientareaaddress2'}</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="address2" id="inputAddress2" value="{$address2}" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label text-md-right" for="inputCity">{lang key='clientareacity'}</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="city" id="inputCity" value="{$city}" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label text-md-right" for="inputState">{lang key='clientareastate'}</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="state" id="inputState" value="{$state}" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label text-md-right" for="inputPostcode">{lang key='clientareapostcode'}</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="postcode" id="inputPostcode" value="{$postcode}" />
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label text-md-right" for="inputCountry">{lang key='clientareacountry'}</label>
                            <div class="col-sm-8">
                                <select name="country" id="inputCountry" class="custom-select">
                                    {foreach $clientcountries as $thisCountryCode => $thisCountryName}
                                        <option value="{$thisCountryCode}" {if $thisCountryCode eq $country}selected="selected"{/if}>{$thisCountryName}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-4 col-form-label text-md-right" for="inputPhoneNumber">{lang key='clientareaphonenumber'}</label>
                            <div class="col-sm-8">
                                <input type="tel" class="form-control" name="phonenumber" id="inputPhoneNumber" value="{$phonenumber}" />
                            </div>
                        </div>

                    </fieldset>

                    <div class="text-center">
                        <button type="submit" class="btn btn-primary" id="btnOrderContinue">
                            {lang key='ordercontinuebutton'}
                        </button>
                    </div>
                {else}

                    {include file="$template/includes/alert.tpl" type="info" msg="{lang key='sslnoconfigurationpossible'}" textcenter=true}

                    <input type="hidden" name="id" value="{$serviceid}" />
                    <div class="text-center">
                        <button type="submit" class="btn btn-default">
                            {lang key='invoicesbacktoclientarea'}
                        </button>
                    </div>

                {/if}
            </div>
        </div>
    </form>
{/if}
