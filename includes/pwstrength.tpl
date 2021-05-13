<br />

<div class="progress mb-3" id="passwordStrengthBar">
    <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
        <span class="sr-only">{lang key='pwstrengthrating'}: 0%</span>
    </div>
</div>

{if file_exists("templates/$template/includes/alert.tpl")}
    {include file="$template/includes/alert.tpl" type="info" msg="<small><i class='fa fa-info-circle fa-fw'></i> {lang key='passwordtips'}</small>"}
{elseif file_exists("templates/six/includes/alert.tpl")}
    {include file="six/includes/alert.tpl" type="info" msg="<small><i class='fa fa-info-circle fa-fw'></i> {lang key='passwordtips'}</small>"}
{/if}

<script>
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
        if (pwstrength < pwStrengthErrorThreshold) {
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
        if (password2) {
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
