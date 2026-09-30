<br />

<div class="progress mb-3" id="passwordStrengthBar">
    <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
        <span class="sr-only">{lang key='pwstrengthrating'}: 0%</span>
    </div>
</div>

{* minimumPasswordLength is only assigned on surfaces where WHMCS\Security\PasswordPolicy is
   actually enforced; a service/module password (e.g. modulechangepassword) is validated by the
   remote module, not this policy, so this tip must not claim a minimum that isn't checked. *}
{if $minimumPasswordLength}
    {assign var="passwordTipsText" value="{lang key='passwordtips' minimum_length=$minimumPasswordLength maximum_length=$maximumPasswordLength}"}
{else}
    {assign var="passwordTipsText" value="{lang key='passwordtipsmaxonly' maximum_length=$maximumPasswordLength}"}
{/if}
{* The meter now fails a password missing a required digit or letter, so the tips beside it must
   say so too - otherwise a password can turn red with no explanation of why. *}
{if $passwordRequiresNumeric}
    {assign var="passwordTipsText" value="$passwordTipsText<br />{lang key='passwordtipsrequiresnumeric'}"}
{/if}
{if $passwordRequiresAlphabetic}
    {assign var="passwordTipsText" value="$passwordTipsText<br />{lang key='passwordtipsrequiresalphabetic'}"}
{/if}
{assign var="passwordTipsText" value="<small><i class='fa fa-info-circle fa-fw'></i> $passwordTipsText</small>"}
{if file_exists("templates/$template/includes/alert.tpl")}
    {include file="$template/includes/alert.tpl" type="info" msg=$passwordTipsText}
{elseif file_exists("templates/six/includes/alert.tpl")}
    {include file="six/includes/alert.tpl" type="info" msg=$passwordTipsText}
{/if}

<script>
    // maximumLength() is nullable (no rule in the policy carries a maximum), so this must not
    // interpolate straight into a numeric literal - null would emit "var maximumPasswordLength = ;",
    // a syntax error that breaks every script on this page, including validatePassword2() below.
    var maximumPasswordLength = {if $maximumPasswordLength}{$maximumPasswordLength}{else}null{/if};
    // minimumPasswordLength, passwordRequiresNumeric and passwordRequiresAlphabetic are assigned
    // only where WHMCS\Security\PasswordPolicy actually governs this field (see the comment
    // above); 0/false here means "not checked client-side", matching the tips text falling back
    // to maximum-only above.
    var minimumPasswordLength = {if $minimumPasswordLength}{$minimumPasswordLength}{else}0{/if};
    var passwordRequiresNumeric = {if $passwordRequiresNumeric}true{else}false{/if};
    var passwordRequiresAlphabetic = {if $passwordRequiresAlphabetic}true{else}false{/if};

    function passwordMeetsPolicy(password) {
        return (!minimumPasswordLength || password.length >= minimumPasswordLength)
            && (maximumPasswordLength === null || password.length <= maximumPasswordLength)
            && (!passwordRequiresNumeric || /[0-9]/.test(password))
            && (!passwordRequiresAlphabetic || /[a-zA-Z]/.test(password));
    }

    jQuery("#inputNewPassword1").keyup(function() {
        var pwStrengthErrorThreshold = {if isset($pwStrengthErrorThreshold)}{$pwStrengthErrorThreshold}{else}50{/if},
            pwStrengthWarningThreshold = {if isset($pwStrengthWarningThreshold)}{$pwStrengthWarningThreshold}{else}75{/if},
            progressBar = jQuery("#passwordStrengthBar .progress-bar"),
            pw = jQuery("#inputNewPassword1").val(),
            pwlength = (pw.length);
        if (pwlength > 5) {
            pwlength = 5;
        }
        var numnumeric = pw.replace(/[0-9]/g,""),
            numeric = (pw.length - numnumeric.length);
        if (numeric > 3) {
            numeric = 3;
        }
        var symbols = pw.replace(/\W/g,""),
            numsymbols = (pw.length-symbols.length);
        if (numsymbols > 3) {
            numsymbols = 3;
        }
        var numupper = pw.replace(/[A-Z]/g,""),
            upper = (pw.length - numupper.length);
        if (upper > 3) {
            upper = 3;
        }
        var pwstrength = ((pwlength * 10) - 20) + (numeric * 10) + (numsymbols * 15) + (upper * 10);
        if (pwstrength < 0) {
            pwstrength = 0;
        }
        if (pwstrength > 100) {
            pwstrength = 100;
        }

        jQuery(this).removeClass('is-invalid is-warning is-valid');
        progressBar.removeClass("bg-danger bg-warning bg-success").css("width", pwstrength + "%").attr('aria-valuenow', pwstrength);
        jQuery("#passwordStrengthBar .progress-bar .sr-only").html('{lang|addslashes key='pwstrengthrating'}: ' + pwstrength + '%');
        if ((pwstrength < pwStrengthErrorThreshold) || !passwordMeetsPolicy(pw)) {
            jQuery(this).addClass('is-invalid');
            progressBar.addClass("bg-danger");
        } else if (pwstrength < pwStrengthWarningThreshold) {
            jQuery(this).addClass('is-warning');
            progressBar.addClass("bg-warning");
        } else {
            jQuery(this).addClass('is-valid');
            progressBar.addClass("bg-success");
        }
        validatePassword2();
});

function validatePassword2() {
    var password1 = jQuery("#inputNewPassword1").val(),
        password2Input = jQuery("#inputNewPassword2"),
        password2 = password2Input.val();
    if (password2 && password1 !== password2) {
        password2Input.removeClass('is-valid')
            .addClass('is-invalid');
        jQuery("#inputNewPassword2Msg").html(
            '<p class="form-text text-muted" id="nonMatchingPasswordResult">{"{lang key='pwdoesnotmatch'}"|escape}</p>'
        );
        {if !isset($noDisable)}
            jQuery('input[type="submit"]').attr('disabled', 'disabled');
        {/if}
    } else {
        // Submit stays gated on max-length only, matching pre-existing behavior: a shorter/
        // non-numeric/non-alphabetic password is flagged as an error above (via
        // passwordMeetsPolicy in the keyup handler) but is still submittable, so the server's
        // own PasswordPolicy rejection message is what the user ultimately sees for those rules.
        if (password2 && (maximumPasswordLength === null || password1.length <= maximumPasswordLength)) {
            password2Input.removeClass('is-invalid')
                .addClass('is-valid');
            {if !isset($noDisable)}jQuery('.primary-content input[type="submit"]').removeAttr('disabled');{/if}
        } else {
            password2Input.removeClass('is-valid is-invalid');
        }
        jQuery("#inputNewPassword2Msg").html('');
    }
}

    jQuery(document).ready(function() {
        {if !isset($noDisable)}
        jQuery('.using-password-strength input[type="submit"]').attr('disabled', 'disabled');
        {/if}
        jQuery("#inputNewPassword2").keyup(function() {
            validatePassword2();
        });
    });
</script>
