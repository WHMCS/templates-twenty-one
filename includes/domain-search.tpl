<form method="post" action="domainchecker.php" id="frmDomainHomepage">
    <div class="home-domain-search bg-white">
        <div class="container">
            <div class="p-5 clearfix">
                <h2 class="text-center">{lang key="secureYourDomainShort"}</h2>
                <input type="hidden" name="transfer" />
                <div class="input-group-wrapper">
                    <div class="input-group{if $showAdvancedSearchOptions} advanced-input{/if}">
                        {if $showAdvancedSearchOptions}
                            <textarea name="message"
                                      id="message"
                                      title="{lang key='domainSearch.domainOrAiPrompt'}"
                                      data-placement="left"
                                      data-trigger="manual"
                                      placeholder="{lang key='domainSearch.domainOrAiInstruction'}"></textarea>
                            <select name="tlds[]" class="multiselect multiselect-filter" multiple="multiple" data-placeholder="{lang key='domainSearch.tlds'}" data-min-selection="1">
                                {foreach $tlds as $tld}
                                    <option{if in_array($tld, $selectedTlds)} selected {if count($selectedTlds) <= 1}disabled="disabled"{/if}{/if} value="{$tld}">{$tld}</option>
                                {/foreach}
                            </select>
                            <select name="maxLength" class="multiselect" data-placeholder="{lang key='domainSearch.maxLength'}">
                                {foreach $searchLengths as $len}
                                    <option value="{$len}" {if $maxLength === $len}selected{/if}>{$len}</option>
                                {/foreach}
                            </select>
                            <label>
                                <input type="checkbox" class="no-icheck" name="filter" {if $safeSearchSelected}checked{/if}>{lang key="domainSearch.safeSearch"}
                            </label>
                        {else}
                            <input type="text" class="form-control" name="domain" placeholder="{lang key="exampledomain"}" autocapitalize="none">
                        {/if}
                            <span class="input-group-append d-none d-sm-block">
                                {if $registerdomainenabled}
                                    <button type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}" id="btnDomainSearch">
                                        {lang key="search"}{if $showAdvancedSearchOptions}  <i class="fa-regular fa-sparkles"></i>{/if}
                                    </button>
                                {/if}
                                {if $transferdomainenabled}
                                    <button type="submit" id="btnTransfer" data-domain-action="transfer" class="btn btn-success{$captcha->getButtonClass($captchaForm)}">
                                        {lang key="domainstransfer"}
                                    </button>
                                {/if}
                            </span>
                    </div>
                </div>
                <div class="row d-sm-none">
                    {if $registerdomainenabled}
                        <div class="col-6">
                            <button type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)} btn-block" id="btnDomainSearch2">
                                {lang key="search"}{if $showAdvancedSearchOptions}  <i class="fa-regular fa-sparkles"></i>{/if}
                            </button>
                        </div>
                    {/if}
                    {if $transferdomainenabled}
                        <div class="col-6">
                            <button type="submit" id="btnTransfer2" data-domain-action="transfer" class="btn btn-success{$captcha->getButtonClass($captchaForm)} btn-block">
                                {lang key="domainstransfer"}
                            </button>
                        </div>
                    {/if}
                </div>
                {include file="$template/includes/captcha.tpl"}

                {if $featuredTlds}
                    <ul class="tld-logos">
                        {foreach $featuredTlds as $num => $tldinfo}
                            {if $num < 3}
                                <li>
                                    <img src="{$BASE_PATH_IMG}/tld_logos/{$tldinfo.tldNoDots}.png" alt="{$tldinfo.tld}">
                                    {if is_object($tldinfo.register)}
                                        {$tldinfo.register->toFull()}
                                    {else}
                                        {lang key="domainregnotavailable"}
                                    {/if}
                                </li>
                            {/if}
                        {/foreach}
                    </ul>
                {/if}

                <a href="{routePath('domain-pricing')}" class="btn btn-link btn-sm float-right">{lang key='viewAllPricing'}</a>
            </div>
        </div>
    </div>
</form>

{if $showAdvancedSearchOptions}
<script>
    $(document).ready(function() {
        jQuery('#frmDomainHomepage .multiselect').each(function () {
            const enableFiltering = $(this).hasClass('multiselect-filter');
            const minSelection = jQuery(this).data('min-selection');
            $(this).multiselect({
                onChange: function (element) {
                    const closestSelect = element.closest('select');
                    const selectedOptions = closestSelect.find('option:selected');
                    if (minSelection === undefined) {
                        return;
                    }
                    const atMinOptions = selectedOptions.length <= minSelection;
                    const targetOptions = atMinOptions ? selectedOptions : closestSelect.find('option');
                    targetOptions.each(function () {
                        const inputElement = jQuery('input[value="' + jQuery(this).val() + '"]');
                        inputElement.prop('disabled', atMinOptions ? 'disabled' : false);
                    });
                },
                buttonText: function(options, select) {
                    return select.data('placeholder');
                },
                maxHeight: 200,
                includeFilterClearBtn: false,
                enableCaseInsensitiveFiltering: enableFiltering,
            });
        })
    });
</script>
{/if}

