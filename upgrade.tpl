<div class="card">
    <div class="card-body">
        {if $overdueinvoice}
            {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='upgradeerroroverdueinvoice'}"}
        {elseif $existingupgradeinvoice}
            {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='upgradeexistingupgradeinvoice'}"}
        {elseif $upgradenotavailable}
            {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='upgradeNotPossible'}" textcenter=true}
        {/if}

        {if $overdueinvoice}

            <p>
                <a href="clientarea.php?action=productdetails&id={$id}" class="btn btn-default">{lang key='clientareabacklink'}</a>
            </p>

        {elseif $existingupgradeinvoice}

            <p>
                <a href="clientarea.php?action=productdetails&id={$id}" class="btn btn-default btn-lg">{lang key='clientareabacklink'}</a>
                <a href="submitticket.php" class="btn btn-default btn-lg">{lang key='submitticketdescription'}</a>
            </p>

        {elseif $upgradenotavailable}

            <p>
                <a href="clientarea.php?action=productdetails&id={$id}" class="btn btn-default btn-lg">{lang key='clientareabacklink'}</a>
                <a href="submitticket.php" class="btn btn-default btn-lg">{lang key='submitticketdescription'}</a>
            </p>

        {else}

            {if $type eq "package"}

                <p>{lang key='upgradechoosepackage'}</p>

                <p>{lang key='upgradecurrentconfig'}:<br/><strong>{$groupname} - {$productname}</strong>{if $domain} ({$domain}){/if}</p>

                <p>{lang key='upgradenewconfig'}:</p>

                <table class="table table-striped">
                    {foreach $upgradepackages as $upgradepackage}
                        <tr>
                            <td>
                                <strong>
                                    {$upgradepackage.groupname} - {$upgradepackage.name}
                                </strong>
                                <br />
                                {$upgradepackage.description}
                            </td>
                            <td width="300" class="text-center">
                                <form method="post" action="{$smarty.server.PHP_SELF}">
                                    <input type="hidden" name="step" value="2">
                                    <input type="hidden" name="type" value="{$type}">
                                    <input type="hidden" name="id" value="{$id}">
                                    <input type="hidden" name="pid" value="{$upgradepackage.pid}">
                                    <div class="form-group">
                                        {if $upgradepackage.pricing.type eq "free"}
                                            {lang key='orderfree'}<br />
                                            <input type="hidden" name="billingcycle" value="free">
                                        {elseif $upgradepackage.pricing.type eq "onetime"}
                                            {$upgradepackage.pricing.onetime} {lang key='orderpaymenttermonetime'}
                                            <input type="hidden" name="billingcycle" value="onetime">
                                        {elseif $upgradepackage.pricing.type eq "recurring"}
                                            <select name="billingcycle" class="form-control custom-select">
                                                {if $upgradepackage.pricing.monthly}<option value="monthly">{$upgradepackage.pricing.monthly}</option>{/if}
                                                {if $upgradepackage.pricing.quarterly}<option value="quarterly">{$upgradepackage.pricing.quarterly}</option>{/if}
                                                {if $upgradepackage.pricing.semiannually}<option value="semiannually">{$upgradepackage.pricing.semiannually}</option>{/if}
                                                {if $upgradepackage.pricing.annually}<option value="annually">{$upgradepackage.pricing.annually}</option>{/if}
                                                {if $upgradepackage.pricing.biennially}<option value="biennially">{$upgradepackage.pricing.biennially}</option>{/if}
                                                {if $upgradepackage.pricing.triennially}<option value="triennially">{$upgradepackage.pricing.triennially}</option>{/if}
                                            </select>
                                        {/if}
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-block" id="btnUpgradeDowngradeChooseProduct">
                                        {lang key='upgradedowngradechooseproduct'}
                                    </button>
                                </form>
                            </td>
                        </tr>
                    {/foreach}
                </table>

            {elseif $type eq "configoptions"}

                <p>{lang key='upgradechooseconfigoptions'}</p>

                {if $errormessage}
                    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
                {/if}

                <form method="post" action="{$smarty.server.PHP_SELF}">
                    <input type="hidden" name="step" value="2" />
                    <input type="hidden" name="type" value="{$type}" />
                    <input type="hidden" name="id" value="{$id}" />

                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th></th>
                            <th>{lang key='upgradecurrentconfig'}</th>
                            <th></th>
                            <th>{lang key='upgradenewconfig'}</th>
                        </tr>
                        </thead>
                        <tbody>
                        {foreach $configoptions as $configoption}
                            <tr>
                                <td>{$configoption.optionname}</td>
                                <td>
                                    {if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}
                                        {$configoption.selectedname}
                                    {elseif $configoption.optiontype eq 3}
                                        {if $configoption.selectedqty}{lang key='yes'}{else}{lang key='no'}{/if}
                                    {elseif $configoption.optiontype eq 4}
                                        {$configoption.selectedqty} x {$configoption.options.0.name}
                                    {/if}
                                </td>
                                <td><i class="far fa-angle-double-right"></i></td>
                                <td>
                                    <div class="form-group">
                                        {if $configoption.optiontype eq 1 || $configoption.optiontype eq 2}
                                            <select name="configoption[{$configoption.id}]" class="form-control custom-select">
                                                {foreach $configoption.options as $option}
                                                    {if !empty($option.selected)}
                                                        <option value="{$option.id}" selected>{lang key='upgradenochange'}</option>
                                                    {else}
                                                        <option value="{$option.id}">{$option.nameonly} {$option.price}</option>
                                                    {/if}
                                                {/foreach}
                                            </select>
                                        {elseif $configoption.optiontype eq 3}
                                            <input type="checkbox" name="configoption[{$configoption.id}]" value="1"{if $configoption.selectedqty} checked{/if}> {$configoption.options.0.name}
                                        {elseif $configoption.optiontype eq 4}
                                            <div class="form-inline">
                                                <input type="text" class="form-control" name="configoption[{$configoption.id}]" value="{$configoption.selectedqty}" size="5"><span class="pl-1"> x {$configoption.options.0.name}</span>
                                            </div>
                                        {/if}
                                    </div>
                                </td>
                            </tr>
                        {/foreach}
                        </tbody>
                    </table>

                    <p class="text-center">
                        <button type="submit" class="btn btn-primary">
                            {lang key='continue'} <i class="fas fa-arrow-right"></i>
                        </button>
                    </p>

                </form>
            {/if}
        {/if}
    </div>
</div>