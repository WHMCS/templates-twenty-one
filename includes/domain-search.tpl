<form method="post" action="domainchecker.php" id="frmDomainHomepage">
    <div class="home-domain-search bg-white">
        <div class="container">
            <div class="p-5 clearfix">
                <h2 class="text-center">{lang key="secureYourDomainShort"}</h2>
                <input type="hidden" name="transfer" />
                <div class="input-group-wrapper">
                    <div class="input-group">
                        <input type="text" class="form-control" name="domain" placeholder="{lang key="exampledomain"}" autocapitalize="none">
                        <span class="input-group-append d-none d-sm-block">
                            {if $registerdomainenabled}
                                <button type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}" id="btnDomainSearch">
                                    {lang key="search"}
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
                                {lang key="search"}
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
                                    <img src="{$BASE_PATH_IMG}/tld_logos/{$tldinfo.tldNoDots}.png">
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
