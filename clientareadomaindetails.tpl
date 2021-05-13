{if $registrarcustombuttonresult=="success"}
    {include file="$template/includes/alert.tpl" type="success" msg="{lang key='moduleactionsuccess'}" textcenter=true}
{elseif $registrarcustombuttonresult}
    {include file="$template/includes/alert.tpl" type="error" msg="{lang key='moduleactionfailed'}" textcenter=true}
{/if}

{if $unpaidInvoice}
    <div class="alert alert-{if $unpaidInvoiceOverdue}danger{else}warning{/if}" id="alert{if $unpaidInvoiceOverdue}Overdue{else}Unpaid{/if}Invoice">
        <div class="float-right">
            <a href="viewinvoice.php?id={$unpaidInvoice}" class="btn btn-xs btn-default">
                {lang key='payInvoice'}
            </a>
        </div>
        {$unpaidInvoiceMessage}
    </div>
{/if}

<div class="tab-content margin-bottom">
    <div class="tab-pane fade show active" id="tabOverview">

        <div class="card">
            <div class="card-body">

                <h3 class="card-title">{lang key='overview'}</h3>

                {if $alerts}
                    {foreach $alerts as $alert}
                        {include file="$template/includes/alert.tpl" type=$alert.type msg="<strong>{$alert.title}</strong><br>{$alert.description}" textcenter=true}
                    {/foreach}
                {/if}

                {if $systemStatus != 'Active'}
                    <div class="alert alert-warning text-center" role="alert">
                        {lang key='domainCannotBeManagedUnlessActive'}
                    </div>
                {/if}

                {if $lockstatus eq "unlocked"}
                    {capture name="domainUnlockedMsg"}<strong>{lang key='domaincurrentlyunlocked'}</strong><br />{lang key='domaincurrentlyunlockedexp'}{/capture}
                    {include file="$template/includes/alert.tpl" type="error" msg=$smarty.capture.domainUnlockedMsg}
                {/if}

                <div class="row mb-3">
                    <div class="col-lg-6">
                        <h5>{lang key='clientareahostingdomain'}:</h5>
                        <a href="http://{$domain}" target="_blank">{$domain}</a>
                    </div>
                    <div class="col-lg-6">
                        <h5>{lang key='firstpaymentamount'}:</h5>
                        <span>{$firstpaymentamount}</span>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-lg-6">
                        <h5>{lang key='clientareahostingregdate'}:</h5>
                        <span>{$registrationdate}</span>
                    </div>
                    <div class="col-lg-6">
                        <h5>{lang key='recurringamount'}:</h5>
                        {$recurringamount} {lang key='every'} {$registrationperiod} {lang key='orderyears'}
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-lg-6">
                        <h5>{lang key='clientareahostingnextduedate'}:</h5>
                        {$nextduedate}
                    </div>
                    <div class="col-lg-6">
                        <h5>{lang key='orderpaymentmethod'}:</h5>
                        {$paymentmethod}
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-lg-6">
                        <h5>{lang key='clientareastatus'}:</h5>
                        {$status}
                    </div>
                </div>
                {if $sslStatus}
                    <div class="row mb-3">
                        <div class="col-lg-6{if $sslStatus->isInactive()} ssl-inactive{/if}">
                            <h5>{lang key='sslState.sslStatus'}</h5>
                            <img src="{$sslStatus->getImagePath()}" width="16" data-type="domain" data-domain="{$domain}" data-showlabel="1" class="{$sslStatus->getClass()}"/>
                            <span id="statusDisplayLabel">
                                {if !$sslStatus->needsResync()}
                                    {$sslStatus->getStatusDisplayLabel()}
                                {else}
                                    {lang key='loading'}
                                {/if}
                            </span>
                        </div>
                        {if $sslStatus->isActive() || $sslStatus->needsResync()}
                            <div class="col-lg-6">
                                <h5>{lang key='sslState.startDate'}</h5>
                                <span id="ssl-startdate">
                                    {if !$sslStatus->needsResync() || $sslStatus->startDate}
                                        {$sslStatus->startDate->toClientDateFormat()}
                                    {else}
                                        {lang key='loading'}
                                    {/if}
                                </span>
                            </div>
                        {/if}
                    </div>
                    {if $sslStatus->isActive() || $sslStatus->needsResync()}
                        <div class="row">
                            <div class="col-lg-6">
                                <h5>{lang key='sslState.issuerName'}</h5>
                                <span id="ssl-issuer">
                                    {if !$sslStatus->needsResync() || $sslStatus->issuerName}
                                        {$sslStatus->issuerName}
                                    {else}
                                        {lang key='loading'}
                                    {/if}
                                </span>
                            </div>
                            <div class="col-lg-6">
                                <h5>{lang key='sslState.expiryDate'}</h5>
                                <span id="ssl-expirydate">
                                    {if !$sslStatus->needsResync() || $sslStatus->expiryDate}
                                        {$sslStatus->expiryDate->toClientDateFormat()}
                                    {else}
                                        {lang key='loading'}
                                    {/if}
                                </span>
                            </div>
                        </div>
                    {/if}
                {/if}

                {if $registrarclientarea}
                    <div class="moduleoutput">
                        {$registrarclientarea|replace:'modulebutton':'btn'}
                    </div>
                {/if}

                {foreach $hookOutput as $output}
                    <div>
                        {$output}
                    </div>
                {/foreach}

                <br />

                {if $canDomainBeManaged
                    and (
                        $managementoptions.nameservers or
                        $managementoptions.contacts or
                        $managementoptions.locking or
                        $renew)}
                        {* No reason to show this section if nothing can be done here! *}

                    <h3 class="card-title">{lang key='doToday'}</h3>

                    <ul>
                        {if $systemStatus == 'Active' && $managementoptions.nameservers}
                            <li>
                                <a class="tabControlLink" data-toggle="tab" href="#tabNameservers">
                                    {lang key='changeDomainNS'}
                                </a>
                            </li>
                        {/if}
                        {if $systemStatus == 'Active' && $managementoptions.contacts}
                            <li>
                                <a href="clientarea.php?action=domaincontacts&domainid={$domainid}">
                                    {lang key='updateWhoisContact'}
                                </a>
                            </li>
                        {/if}
                        {if $systemStatus == 'Active' && $managementoptions.locking}
                            <li>
                                <a class="tabControlLink" data-toggle="tab" href="#tabReglock">
                                    {lang key='changeRegLock'}
                                </a>
                            </li>
                        {/if}
                        {if $renew}
                            <li>
                                <a href="{routePath('domain-renewal', $domain)}">
                                    {lang key='renewYourDomain'}
                                </a>
                            </li>
                        {/if}
                    </ul>

                {/if}

            </div>
        </div>

    </div>
    <div class="tab-pane fade" id="tabAutorenew">

        <div class="card">
            <div class="card-body">

                <h3 class="card-title">{lang key='domainsautorenew'}</h3>

                {if $changeAutoRenewStatusSuccessful}
                    {include file="$template/includes/alert.tpl" type="success" msg="{lang key='changessavedsuccessfully'}" textcenter=true}
                {/if}

                <p>{lang key='domainrenewexp'}</p>

                <h4 class="text-center mb-4">{lang key='domainautorenewstatus'}: <span class="label label-{if $autorenew}success{else}danger{/if}">{if $autorenew}{lang key='domainsautorenewenabled'}{else}{lang key='domainsautorenewdisabled'}{/if}</span></h4>

                <form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabAutorenew">
                    <input type="hidden" name="id" value="{$domainid}">
                    <input type="hidden" name="sub" value="autorenew" />
                    {if $autorenew}
                        <input type="hidden" name="autorenew" value="disable">
                        <p class="text-center">
                            <button type="submit" class="btn btn-lg btn-danger">
                                {lang key='domainsautorenewdisable'}
                            </button>
                        </p>
                    {else}
                        <input type="hidden" name="autorenew" value="enable">
                        <p class="text-center">
                            <button type="submit" class="btn btn-lg btn-success">
                                {lang key='domainsautorenewenable'}
                            </button>
                        </p>
                    {/if}
                </form>

            </div>
        </div>

    </div>
    <div class="tab-pane fade" id="tabNameservers">

        <div class="card">
            <div class="card-body">

                <h3 class="card-title">{lang key='domainnameservers'}</h3>

                {if $nameservererror}
                    {include file="$template/includes/alert.tpl" type="error" msg=$nameservererror textcenter=true}
                {/if}
                {if $subaction eq "savens"}
                    {if $updatesuccess}
                        {include file="$template/includes/alert.tpl" type="success" msg="{lang key='changessavedsuccessfully'}" textcenter=true}
                    {elseif $error}
                        {include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
                    {/if}
                {/if}

                {include file="$template/includes/alert.tpl" type="info" msg="{lang key='domainnsexp'}"}

                <form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabNameservers">
                    <input type="hidden" name="id" value="{$domainid}" />
                    <input type="hidden" name="sub" value="savens" />
                    <div class="form-check">
                        <label>
                            <input type="radio" class="form-check-input" name="nschoice" value="default" onclick="disableFields('domnsinputs',true)"{if $defaultns} checked{/if} /> {lang key='nschoicedefault'}
                        </label>
                    </div>
                    <div class="form-check mb-3">
                        <label>
                            <input type="radio" class="form-check-input" name="nschoice" value="custom" onclick="disableFields('domnsinputs',false)"{if !$defaultns} checked{/if} /> {lang key='nschoicecustom'}
                        </label>
                    </div>

                    {for $num=1 to 5}
                        <div class="form-group row">
                            <label for="inputNs{$num}" class="col-sm-4 col-form-label">{lang key='clientareanameserver'} {$num}</label>
                            <div class="col-md-7">
                                <input type="text" name="ns{$num}" class="form-control domnsinputs" id="inputNs{$num}" value="{$nameservers[$num].value}" />
                            </div>
                        </div>
                    {/for}

                    <div class="row">
                        <div class="col-sm-8 offset-sm-4">
                            <button type="submit" class="btn btn-primary">
                                {lang key='changenameservers'}
                            </button>
                        </div>
                    </div>
                </form>

            </div>
        </div>

    </div>
    <div class="tab-pane fade" id="tabReglock">

        <div class="card">
            <div class="card-body">

                <h3 class="card-title">{lang key='domainregistrarlock'}</h3>

                {if $subaction eq "savereglock"}
                    {if $updatesuccess}
                        {include file="$template/includes/alert.tpl" type="success" msg="{lang key='changessavedsuccessfully'}" textcenter=true}
                    {elseif $error}
                        {include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
                    {/if}
                {/if}

                {include file="$template/includes/alert.tpl" type="info" msg="{lang key='domainlockingexp'}"}

                <br />

                <h2 class="text-center">{lang key='domainreglockstatus'}: <span class="label label-{if $lockstatus == "locked"}success{else}danger{/if}">{if $lockstatus == "locked"}{lang key='domainsautorenewenabled'}{else}{lang key='domainsautorenewdisabled'}{/if}</span></h2>

                <br />
                <br />

                <form method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabReglock">
                    <input type="hidden" name="id" value="{$domainid}">
                    <input type="hidden" name="sub" value="savereglock" />
                    {if $lockstatus=="locked"}
                        <p class="text-center">
                            <button type="submit" class="btn btn-lg btn-danger">
                                {lang key='domainreglockdisable'}
                            </button>
                        </p>
                    {else}
                        <p class="text-center">
                            <button type="submit" class="btn btn-lg btn-success" name="reglock" value="1" />
                                {lang key='domainreglockenable'}
                            </button>
                        </p>
                    {/if}
                </form>

            </div>
        </div>

    </div>
    <div class="tab-pane fade" id="tabRelease">

        <div class="card">
            <div class="card-body">

                <h3 class="card-title">{lang key='domainrelease'}</h3>

                {if $releaseDomainSuccessful}
                    {include file="$template/includes/alert.tpl" type="success" msg="{lang key='changessavedsuccessfully'}" textcenter="true"}
                {elseif !empty($error)}
                    {include file="$template/includes/alert.tpl" type="error" msg="$error" textcenter="true"}
                {/if}

                {include file="$template/includes/alert.tpl" type="info" msg="{lang key='domainreleasedescription'}"}

                <form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabRelease">
                    <input type="hidden" name="sub" value="releasedomain">
                    <input type="hidden" name="id" value="{$domainid}">

                    <div class="form-group row">
                        <label for="inputReleaseTag" class="col-4 col-form-label">{lang key='domainreleasetag'}</label>
                        <div class="col-6 col-sm-5">
                            <input type="text" class="form-control" id="inputReleaseTag" name="transtag" />
                        </div>
                    </div>

                    <p class="text-center">
                        <button type="submit" class="btn btn-primary">
                            {lang key='domainrelease'}
                        </button>
                    </p>
                </form>

            </div>
        </div>

    </div>
    <div class="tab-pane fade" id="tabAddons">

        <div class="card">
            <div class="card-body">
                <h3 class="card-title">{lang key='domainaddons'}</h3>

                <p>{lang key='domainaddonsinfo'}</p>

                <hr>

                {if $addons.idprotection}
                    <div class="row mb-3">
                        <div class="col-3 col-md-2 text-center">
                            <i class="fas fa-shield-alt fa-3x"></i>
                        </div>
                        <div class="col-9 col-md-10">
                            <strong>{lang key='domainidprotection'}</strong><br />
                            {lang key='domainaddonsidprotectioninfo'}<br />
                            <form action="clientarea.php?action=domainaddons" method="post">
                                <input type="hidden" name="id" value="{$domainid}"/>
                                {if $addonstatus.idprotection}
                                    <input type="hidden" name="disable" value="idprotect"/>
                                    <button type="submit" class="btn btn-danger">
                                        {lang key='disable'}
                                    </button>
                                {else}
                                    <input type="hidden" name="buy" value="idprotect"/>
                                    <button type="submit" class="btn btn-success">
                                        {lang key='domainaddonsbuynow'} {$addonspricing.idprotection}
                                    </button>
                                {/if}
                            </form>
                        </div>
                    </div>
                {/if}

                {if $addons.dnsmanagement}
                    <hr>
                    <div class="row margin-bottom">
                        <div class="col-3 col-md-2 text-center">
                            <i class="fas fa-cloud fa-3x"></i>
                        </div>
                        <div class="col-9 col-md-10">
                            <strong>{lang key='domainaddonsdnsmanagement'}</strong><br />
                            {lang key='domainaddonsdnsmanagementinfo'}<br />
                            <form action="clientarea.php?action=domainaddons" method="post">
                                <input type="hidden" name="id" value="{$domainid}"/>
                                {if $addonstatus.dnsmanagement}
                                    <input type="hidden" name="disable" value="dnsmanagement"/>
                                    <a class="btn btn-success" href="clientarea.php?action=domaindns&domainid={$domainid}">{lang key='manage'}</a>
                                    <button type="submit" class="btn btn-danger">
                                        {lang key='disable'}
                                    </button>
                                {else}
                                    <input type="hidden" name="buy" value="dnsmanagement"/>
                                    <button type="submit" class="btn btn-success">
                                        {lang key='domainaddonsbuynow'} {$addonspricing.dnsmanagement}
                                    </button>
                                {/if}
                            </form>
                        </div>
                    </div>
                {/if}

                {if $addons.emailforwarding}
                    <hr>
                    <div class="row mb-3">
                        <div class="col-3 col-md-2 text-center">
                            <i class="fas fa-envelope fa-3x">&nbsp;</i><i class="fas fa-share fa-2x"></i>
                        </div>
                        <div class="col-9 col-md-10">
                            <strong>{lang key='domainemailforwarding'}</strong><br />
                            {lang key='domainaddonsemailforwardinginfo'}<br />
                            <form action="clientarea.php?action=domainaddons" method="post">
                                <input type="hidden" name="id" value="{$domainid}"/>
                                {if $addonstatus.emailforwarding}
                                    <input type="hidden" name="disable" value="emailfwd"/>
                                    <a class="btn btn-success" href="clientarea.php?action=domainemailforwarding&domainid={$domainid}">{lang key='manage'}</a>
                                    <button type="submit" class="btn btn-danger">
                                        {lang key='disable'}
                                    </button>
                                {else}
                                    <input type="hidden" name="buy" value="emailfwd"/>
                                    <button type="submit" class="btn btn-success">
                                        {lang key='domainaddonsbuynow'} {$addonspricing.emailforwarding}
                                    </button>
                                {/if}
                            </form>
                        </div>
                    </div>
                {/if}

                <hr>

            </div>
        </div>
    </div>
</div>

