{if $modulecustombuttonresult}
    {if $modulecustombuttonresult == "success"}
        {include file="$template/includes/alert.tpl" type="success" msg="{lang key='moduleactionsuccess'}" textcenter=true idname="alertModuleCustomButtonSuccess"}
    {else}
        {include file="$template/includes/alert.tpl" type="error" msg="{lang key='moduleactionfailed'}"|cat:' ':$modulecustombuttonresult textcenter=true idname="alertModuleCustomButtonFailed"}
    {/if}
{/if}

{if $pendingcancellation}
    {include file="$template/includes/alert.tpl" type="error" msg="{lang key='cancellationrequestedexplanation'}" textcenter=true idname="alertPendingCancellation"}
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
    <div class="tab-pane fade show active" role="tabpanel" id="tabOverview">
        {if $tplOverviewTabOutput}
            {$tplOverviewTabOutput}
        {else}

        <div class="card">
            <div class="card-body">

                <div class="product-details">

                    <div class="row">
                        <div class="col-md-6">

                            <div class="product-status product-status-{$rawstatus|strtolower} mb-3">
                                <div class="product-icon text-center">
                                    <span class="fa-stack fa-lg">
                                        <i class="fas fa-circle fa-stack-2x"></i>
                                        <i class="fas fa-{if $type eq "hostingaccount" || $type == "reselleraccount"}hdd{elseif $type eq "server"}database{else}archive{/if} fa-stack-1x fa-inverse"></i>
                                    </span>
                                    <h3>{$product}</h3>
                                    <h4>{$groupname}</h4>
                                </div>
                                <div class="product-status-text">
                                    {$status}
                                </div>
                            </div>

                            {if $showcancelbutton || $packagesupgrade}
                                <div class="row">
                                    {if $packagesupgrade}
                                        <div class="col-{if $showcancelbutton}6{else}12{/if}">
                                            <a href="upgrade.php?type=package&amp;id={$id}" class="btn btn-block btn-success">{lang key='upgrade'}</a>
                                        </div>
                                    {/if}
                                    {if $showcancelbutton}
                                        <div class="col-{if $packagesupgrade}6{else}12{/if}">
                                            <a href="clientarea.php?action=cancel&amp;id={$id}" class="btn btn-block btn-danger {if $pendingcancellation}disabled{/if}">{if $pendingcancellation}{lang key='cancellationrequested'}{else}{lang key='clientareacancelrequestbutton'}{/if}</a>
                                        </div>
                                    {/if}
                                </div>
                            {/if}

                        </div>
                        <div class="col-md-6 text-center">

                            <h4>{lang key='clientareahostingregdate'}</h4>
                            {$regdate}

                            {if $firstpaymentamount neq $recurringamount}
                                <h4>{lang key='firstpaymentamount'}</h4>
                                {$firstpaymentamount}
                            {/if}

                            {if $billingcycle != "{lang key='orderpaymenttermonetime'}" && $billingcycle != "{lang key='orderfree'}"}
                                <h4>{lang key='recurringamount'}</h4>
                                {$recurringamount}
                            {/if}

                            {if $quantitySupported && $quantity > 1}
                                <h4>{lang key='quantity'}</h4>
                                {$quantity}
                            {/if}

                            <h4>{lang key='orderbillingcycle'}</h4>
                            {$billingcycle}

                            <h4>{lang key='clientareahostingnextduedate'}</h4>
                            {$nextduedate}

                            <h4>{lang key='orderpaymentmethod'}</h4>
                            {$paymentmethod}

                            {if $suspendreason}
                                <h4>{lang key='suspendreason'}</h4>
                                {$suspendreason}
                            {/if}

                        </div>
                    </div>

                </div>
            </div>
        </div>

            {foreach $hookOutput as $output}
                <div>
                    {$output}
                </div>
            {/foreach}

            {if $domain || $moduleclientarea || $configurableoptions || $customfields || $lastupdate}

                <ul class="nav nav-tabs responsive-tabs-sm">
                    {if $domain}
                        <li class="nav-item">
                            <a href="#domain" data-toggle="tab" class="nav-link active"><i class="fas fa-globe fa-fw"></i> {if $type eq "server"}{lang key='sslserverinfo'}{elseif ($type eq "hostingaccount" || $type eq "reselleraccount") && $serverdata}{lang key='hostingInfo'}{else}{lang key='clientareahostingdomain'}{/if}</a>
                        </li>
                    {elseif $moduleclientarea}
                        <li class="nav-item">
                            <a href="#manage" data-toggle="tab" class="nav-link active"><i class="fas fa-globe fa-fw"></i> {lang key='manage'}</a>
                        </li>
                    {/if}
                    {if $configurableoptions}
                        <li class="nav-item">
                            <a href="#configoptions" data-toggle="tab" class="nav-link{if !$domain && !$moduleclientarea} active{/if}"><i class="fas fa-cubes fa-fw"></i> {lang key='orderconfigpackage'}</a>
                        </li>
                    {/if}
                    {if $metricStats}
                        <li class="nav-item">
                            <a href="#metrics" data-toggle="tab" class="nav-link{if !$domain && !$moduleclientarea && !$configurableoptions} active{/if}"><i class="fas fa-chart-line fa-fw"></i> {lang key='metrics.title'}</a>
                        </li>
                    {/if}
                    {if $customfields}
                        <li class="nav-item">
                            <a href="#additionalinfo" data-toggle="tab" class="nav-link{if !$domain && !$moduleclientarea && !$metricStats && !$configurableoptions} active{/if}"><i class="fas fa-info fa-fw"></i> {lang key='additionalInfo'}</a>
                        </li>
                    {/if}
                    {if $lastupdate}
                        <li class="nav-item">
                            <a href="#resourceusage" data-toggle="tab" class="nav-link{if !$domain && !$moduleclientarea && !$configurableoptions && !$customfields} active{/if}"><i class="fas fa-inbox fa-fw"></i> {lang key='resourceUsage'}</a>
                        </li>
                    {/if}
                </ul>
                <div class="responsive-tabs-sm-connector"><div class="channel"></div><div class="bottom-border"></div></div>
                <div class="tab-content bg-white product-details-tab-container">
                    {if $domain}
                        <div class="tab-pane fade show active text-center" role="tabpanel" id="domain">
                            {if $type eq "server"}
                                <div class="row">
                                    <div class="col-sm-5 text-right">
                                        <strong>{lang key='serverhostname'}</strong>
                                    </div>
                                    <div class="col-sm-7 text-left">
                                        {$domain}
                                    </div>
                                </div>
                                {if $dedicatedip}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='primaryIP'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$dedicatedip}
                                        </div>
                                    </div>
                                {/if}
                                {if $assignedips}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='assignedIPs'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$assignedips|nl2br}
                                        </div>
                                    </div>
                                {/if}
                                {if $ns1 || $ns2}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='domainnameservers'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$ns1}<br />{$ns2}
                                        </div>
                                    </div>
                                {/if}
                            {else}
                                {if $domain}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='orderdomain'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$domain}
                                        </div>
                                    </div>
                                {/if}
                                {if $username}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='serverusername'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$username}
                                        </div>
                                    </div>
                                {/if}
                                {if $serverdata}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='servername'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$serverdata.hostname}
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='domainregisternsip'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$serverdata.ipaddress}
                                        </div>
                                    </div>
                                    {if $serverdata.nameserver1 || $serverdata.nameserver2 || $serverdata.nameserver3 || $serverdata.nameserver4 || $serverdata.nameserver5}
                                        <div class="row">
                                            <div class="col-sm-5 text-right">
                                                <strong>{lang key='domainnameservers'}</strong>
                                            </div>
                                            <div class="col-sm-7 text-left">
                                                {if $serverdata.nameserver1}{$serverdata.nameserver1} ({$serverdata.nameserver1ip})<br />{/if}
                                                {if $serverdata.nameserver2}{$serverdata.nameserver2} ({$serverdata.nameserver2ip})<br />{/if}
                                                {if $serverdata.nameserver3}{$serverdata.nameserver3} ({$serverdata.nameserver3ip})<br />{/if}
                                                {if $serverdata.nameserver4}{$serverdata.nameserver4} ({$serverdata.nameserver4ip})<br />{/if}
                                                {if $serverdata.nameserver5}{$serverdata.nameserver5} ({$serverdata.nameserver5ip})<br />{/if}
                                            </div>
                                        </div>
                                    {/if}
                                {/if}
                                {if $domain && $sslStatus}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{lang key='sslState.sslStatus'}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left{if $sslStatus->isInactive()} ssl-inactive{/if}">
                                            <img src="{$sslStatus->getImagePath()}" width="12" data-type="service" data-domain="{$domain}" data-showlabel="1" class="{$sslStatus->getClass()}"/>
                                            <span id="statusDisplayLabel">
                                                {if !$sslStatus->needsResync()}
                                                    {$sslStatus->getStatusDisplayLabel()}
                                                {else}
                                                    {lang key='loading'}
                                                {/if}
                                            </span>
                                        </div>
                                    </div>
                                    {if $sslStatus->isActive() || $sslStatus->needsResync()}
                                        <div class="row">
                                            <div class="col-sm-5 text-right">
                                                <strong>{lang key='sslState.startDate'}</strong>
                                            </div>
                                            <div class="col-sm-7 text-left" id="ssl-startdate">
                                                {if !$sslStatus->needsResync() || $sslStatus->startDate}
                                                    {$sslStatus->startDate->toClientDateFormat()}
                                                {else}
                                                    {lang key='loading'}
                                                {/if}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-5 text-right">
                                                <strong>{lang key='sslState.expiryDate'}</strong>
                                            </div>
                                            <div class="col-sm-7 text-left" id="ssl-expirydate">
                                                {if !$sslStatus->needsResync() || $sslStatus->expiryDate}
                                                    {$sslStatus->expiryDate->toClientDateFormat()}
                                                {else}
                                                    {lang key='loading'}
                                                {/if}
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-5 text-right">
                                                <strong>{lang key='sslState.issuerName'}</strong>
                                            </div>
                                            <div class="col-sm-7 text-left" id="ssl-issuer">
                                                {if !$sslStatus->needsResync() || $sslStatus->issuerName}
                                                    {$sslStatus->issuerName}
                                                {else}
                                                    {lang key='loading'}
                                                {/if}
                                            </div>
                                        </div>
                                    {/if}
                                {/if}
                                <br>
                                <p>
                                    <a href="http://{$domain}" class="btn btn-default" target="_blank">{lang key='visitwebsite'}</a>
                                    {if $domainId}
                                        <a href="clientarea.php?action=domaindetails&id={$domainId}" class="btn btn-default" target="_blank">{lang key='managedomain'}</a>
                                    {/if}
                                </p>
                            {/if}
                            {if $moduleclientarea}
                                <div class="text-center module-client-area">
                                    {$moduleclientarea}
                                </div>
                            {/if}
                        </div>
                        {if $sslStatus}
                            <div class="tab-pane fade text-center" role="tabpanel" id="ssl-info">
                                {if $sslStatus->isActive()}
                                    <div class="alert alert-success" role="alert">
                                        {lang key='sslActive' expiry=$sslStatus->expiryDate->toClientDateFormat()}
                                    </div>
                                {else}
                                    <div class="alert alert-warning ssl-required" role="alert">
                                        {lang key='sslInactive'}
                                    </div>
                                {/if}
                            </div>
                        {/if}
                    {elseif $moduleclientarea}
                        <div class="tab-pane fade{if !$domain} show active{/if} text-center" role="tabpanel" id="manage">
                            {if $moduleclientarea}
                                <div class="text-center module-client-area">
                                    {$moduleclientarea}
                                </div>
                            {/if}
                        </div>
                    {/if}
                    {if $configurableoptions}
                        <div class="tab-pane fade{if !$domain && !$moduleclientarea} show active{/if} text-center" role="tabpanel" id="configoptions">
                            {foreach from=$configurableoptions item=configoption}
                                <div class="row">
                                    <div class="col-sm-5">
                                        <strong>{$configoption.optionname}</strong>
                                    </div>
                                    <div class="col-sm-7 text-left">
                                        {if $configoption.optiontype eq 3}{if $configoption.selectedqty}{lang key='yes'}{else}{lang key='no'}{/if}{elseif $configoption.optiontype eq 4}{$configoption.selectedqty} x {$configoption.selectedoption}{else}{$configoption.selectedoption}{/if}
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                    {if $metricStats}
                        <div class="tab-pane fade{if !$domain && !$moduleclientarea && !$configurableoptions} show active{/if}" role="tabpanel" id="metrics">
                            {include file="$template/clientareaproductusagebilling.tpl"}
                        </div>
                    {/if}
                    {if $customfields}
                        <div class="tab-pane fade{if !$domain && !$moduleclientarea && !$configurableoptions && !$metricStats} show active{/if} text-center" role="tabpanel" id="additionalinfo">
                            {foreach from=$customfields item=field}
                                <div class="row">
                                    <div class="col-sm-5">
                                        <strong>{$field.name}</strong>
                                    </div>
                                    <div class="col-sm-7 text-left">
                                        {$field.value}
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                    {if $lastupdate}
                        <div class="tab-pane fade text-center" role="tabpanel" id="resourceusage">
                            <div class="row">
                                <div class="col-sm-10 offset-sm-1">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <h4>{lang key='diskSpace'}</h4>
                                            <input type="text" value="{$diskpercent|substr:0:-1}" class="dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
                                            <p>{$diskusage}MB / {$disklimit}MB</p>
                                        </div>
                                        <div class="col-sm-6">
                                            <h4>{lang key='bandwidth'}</h4>
                                            <input type="text" value="{$bwpercent|substr:0:-1}" class="dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
                                            <p>{$bwusage}MB / {$bwlimit}MB</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <p class="text-muted mb-0">{lang key='clientarealastupdated'}: {$lastupdate}</p>
                            <script src="{$BASE_PATH_JS}/jquery.knob.js"></script>
                            <script>
                                jQuery(function() {
                                    jQuery(".dial-usage").knob({
                                        'format': function(v) {
                                            alert(v);
                                        }
                                    });
                                });
                            </script>
                        </div>

                    {/if}
                </div>
            {/if}

        {/if}

    </div>
    <div class="tab-pane fade" role="tabpanel" id="tabDownloads">

        <h3>{lang key='downloadstitle'}</h3>

        {include file="$template/includes/alert.tpl" type="info" msg="{lang key="clientAreaProductDownloadsAvailable"}" textcenter=true}

        <div class="row">
            {foreach from=$downloads item=download}
                <div class="col-10 offset-1">
                    <h4>{$download.title}</h4>
                    <p>
                        {$download.description}
                    </p>
                    <p>
                        <a href="{$download.link}" class="btn btn-default"><i class="fas fa-download"></i> {lang key='downloadname'}</a>
                    </p>
                </div>
            {/foreach}
        </div>

    </div>
    <div class="tab-pane fade" id="tabAddons">

        <h3>{lang key='clientareahostingaddons'}</h3>

        {if $addonsavailable}
            {include file="$template/includes/alert.tpl" type="info" msg="{lang key="clientAreaProductAddonsAvailable"}" textcenter=true}
        {/if}

        <div class="row">
            {foreach from=$addons item=addon}
                <div class="col-10 offset-1">
                    <div class="card bg-default card-accent-blue">
                        <div class="card-header">
                            {$addon.name}
                            <div class="float-right label status-{$addon.rawstatus|strtolower}">{$addon.status}</div>
                        </div>
                        <div class="row card-body">
                            <div class="col-md-6">
                                <p>
                                    {$addon.pricing}
                                </p>
                                <p>
                                    {lang key='registered'}: {$addon.regdate}
                                </p>
                                <p>
                                    {lang key='clientareahostingnextduedate'}: {$addon.nextduedate}
                                </p>
                            </div>
                        </div>
                        <div class="card-footer">
                            {$addon.managementActions}
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>

    </div>
    <div class="tab-pane fade" id="tabChangepw">

        <div class="card">
            <div class="card-body">
                <h3 class="card-title">{lang key='serverchangepassword'}</h3>

                {if $modulechangepwresult}
                    {if $modulechangepwresult == "success"}
                        {include file="$template/includes/alert.tpl" type="success" msg=$modulechangepasswordmessage textcenter=true}
                    {elseif $modulechangepwresult == "error"}
                        {include file="$template/includes/alert.tpl" type="error" msg=$modulechangepasswordmessage|strip_tags textcenter=true}
                    {/if}
                {/if}

                <form class="using-password-strength" method="post" action="{$smarty.server.PHP_SELF}?action=productdetails#tabChangepw" role="form">
                    <input type="hidden" name="id" value="{$id}" />
                    <input type="hidden" name="modulechangepassword" value="true" />

                    <div id="newPassword1" class="form-group row has-feedback">
                        <label for="inputNewPassword1" class="col-xl-4 col-form-label">{lang key='newpassword'}</label>
                        <div class="col-xl-5">
                            <input type="password" class="form-control" id="inputNewPassword1" name="newpw" autocomplete="off" />
                            {include file="$template/includes/pwstrength.tpl"}
                        </div>
                        <div class="col-xl-3">
                            <button type="button" class="btn btn-default btn-block generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
                                {lang key='generatePassword.btnLabel'}
                            </button>
                        </div>
                    </div>
                    <div id="newPassword2" class="form-group row has-feedback">
                        <label for="inputNewPassword2" class="col-xl-4 col-form-label">{lang key='confirmnewpassword'}</label>
                        <div class="col-xl-5">
                            <input type="password" class="form-control" id="inputNewPassword2" name="confirmpw" autocomplete="off" />
                            <div id="inputNewPassword2Msg">
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-xl-4 col-xl-6">
                            <input class="btn btn-primary" type="submit" value="{lang key='clientareasavechanges'}" />
                            <input class="btn" type="reset" value="{lang key='cancel'}" />
                        </div>
                    </div>

                </form>
            </div>
        </div>

    </div>
</div>
