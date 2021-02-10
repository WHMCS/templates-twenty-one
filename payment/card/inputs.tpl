<div{if !$addingNewCard} class="w-hidden"{/if}>
    <div class="form-group cc-details row">
        <label for="inputCardNumber" class="col-sm-4 text-md-right col-form-label">{lang key='creditcardcardnumber'}</label>
        <div class="col-sm-7">
            <input type="tel" name="ccnumber" id="inputCardNumber" size="30" value="{if $ccnumber}{$ccnumber}{/if}" autocomplete="off" class="form-control newccinfo cc-number-field" data-message-unsupported="{lang key='paymentMethodsManage.unsupportedCardType'}" data-message-invalid="{lang key='paymentMethodsManage.cardNumberNotValid'}" data-supported-cards="{$supportedCardTypes}"/>
            <span class="field-error-msg"></span>
        </div>
    </div>
    {if $showccissuestart}
        <div class="form-group cc-details row">
            <label for="inputCardStart" class="col-sm-4 text-md-right col-form-label">{lang key='creditcardcardstart'}</label>
            <div class="col-sm-8">
                <input type="tel" name="ccstartdate" id="inputCardStart" value="{$ccstartdate}" class="form-control field input-inline input-inline-100" placeholder="MM / YY ({lang key='creditcardcardstart'})">
            </div>
        </div>
    {/if}
    <div class="form-group cc-details row">
        <label for="inputCardExpiry" class="col-sm-4 text-md-right col-form-label">{lang key='creditcardcardexpires'}</label>
        <div class="col-sm-8">
            <input type="tel" name="ccexpirydate" id="inputCardExpiry" value="{$ccexpirydate}" class="form-control field input-inline input-inline-100" placeholder="MM / YY{if $showccissuestart} ({lang key='creditcardcardexpires'}){/if}" autocomplete="cc-exp">
            <span class="field-error-msg">{lang key="paymentMethodsManage.expiryDateNotValid"}</span>
        </div>
    </div>
    {if $showccissuestart}
        <div class="form-group row cc-details">
            <label for="inputIssueNum" class="col-sm-4 text-md-right col-form-label">{lang key='creditcardcardissuenum'}</label>
            <div class="col-2">
                <input type="number" name="ccissuenum" id="inputIssueNum" value="{$ccissuenum}" class="form-control  input-inline input-inline-100" />
            </div>
        </div>
    {/if}
</div>
<div class="form-group row">
    <label for="inputCardCvv" class="col-sm-4 text-md-right col-form-label">{lang key='creditcardcvvnumber'}</label>
    <div class="col-sm-7">
        <input type="tel" name="cccvv" id="inputCardCvv" value="{$cccvv}" autocomplete="off" class="form-control input-inline input-inline-100" />
        <button id="cvvWhereLink" type="button" class="btn btn-link btn-sm" data-toggle="popover" data-content="<img src='{$BASE_PATH_IMG}/ccv.gif' width='210'>">
            {lang key='creditcardcvvwhere'}
        </button>
        <br>
        <span class="field-error-msg">{lang key="paymentMethodsManage.cvcNumberNotValid"}</span>
    </div>
</div>
{include file="$template/payment/billing-address.tpl"}
{if $allowClientsToRemoveCards}
    <div{if !$addingNewCard} class="w-hidden"{/if}>
        <div class="form-group cc-details row">
            <div class="offset-sm-4 col-sm-8 text-md-right">
                <input type="hidden" name="nostore" value="1">
                <input type="checkbox" class="toggle-switch-success" data-size="mini" checked="checked" name="nostore" id="inputNoStore" value="0" data-on-text="{lang key='yes'}" data-off-text="{lang key='no'}">
                <label class="form-check form-check-inline no-padding" for="inputNoStore">
                    &nbsp;&nbsp;
                    {lang key='creditCardStore'}
                </label>

            </div>
        </div>
    </div>
{/if}
<div{if !$addingNewCard} class="w-hidden"{/if}>
    <div id="inputDescriptionContainer" class="form-group cc-details row">
        <label for="inputDescription" class="col-sm-4 text-md-right col-form-label">{lang key='paymentMethods.cardDescription'}</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="inputDescription" name="ccdescription" autocomplete="off" value="" placeholder="{lang key='paymentMethods.descriptionInput'} {lang key='paymentMethodsManage.optional'}" />
        </div>
    </div>
</div>

