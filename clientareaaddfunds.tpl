{if $addfundsdisabled}
    {include file="$template/includes/alert.tpl" type="error" msg="{lang key='clientareaaddfundsdisabled'}" textcenter=true}
{elseif $notallowed}
    {include file="$template/includes/alert.tpl" type="error" msg="{lang key='clientareaaddfundsnotallowed'}" textcenter=true}
{elseif $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage textcenter=true}
{/if}

{if !$addfundsdisabled}

    <div class="row">

        <div class="col-md-8 offset-md-2">
            <div class="card">
                <table class="table table-striped">
                    <tbody>
                        <tr>
                            <td class="textright"><strong>{lang key='addfundsminimum'}</strong></td>
                            <td>{$minimumamount}</td>
                        </tr>
                        <tr>
                            <td class="textright"><strong>{lang key='addfundsmaximum'}</strong></td>
                            <td>{$maximumamount}</td>
                        </tr>
                        <tr>
                            <td class="textright"><strong>{lang key='addfundsmaximumbalance'}</strong></td>
                            <td>{$maximumbalance}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-body">
                    <form method="post" action="{$smarty.server.PHP_SELF}?action=addfunds">
                        <fieldset>
                            <div class="form-group">
                                <label for="amount" class="col-form-label">{lang key='addfundsamount'}:</label>
                                <input type="text" name="amount" id="amount"
                                       value="{$amount}" class="form-control" required />
                            </div>
                            <div class="form-group">
                                <label for="paymentmethod" class="col-form-label">{lang key='orderpaymentmethod'}:</label><br/>
                                <select name="paymentmethod" id="paymentmethod" class="form-control custom-select">
                                    {foreach $gateways as $gateway}
                                        <option value="{$gateway.sysname}">{$gateway.name}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">
                                {lang key='addfunds'}
                            </button>
                        </fieldset>
                    </form>
                </div>
                <div class="card-footer">
                    <small>{lang key='addfundsnonrefundable'}</small>
                </div>
            </div>
        </div>

    </div>

{/if}
