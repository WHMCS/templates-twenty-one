<div class="mb-4">
    <h6 class="h3">{lang key='pwreset'}</h6>
    <p class="text-muted mb-0">{lang key='pwresetemailneeded'}</p>
</div>

{if $errorMessage}
    {include file="$template/includes/alert.tpl" type="error" msg=$errorMessage textcenter=true}
{/if}

<form method="post" action="{routePath('password-reset-validate-email')}" role="form">
    <input type="hidden" name="action" value="reset" />

    <div class="form-group">
        <label for="inputEmail">{lang key='loginemail'}</label>
        <div class="input-group input-group-merge">
            <div class="input-group-prepend">
              <span class="input-group-text"><i class="fas fa-user"></i></span>
            </div>
            <input type="email" class="form-control" name="email" id="inputEmail" placeholder="name@example.com" autofocus>
          </div>
    </div>

    {if $captcha->isEnabled()}
        <div class="text-center margin-bottom">
            {include file="$template/includes/captcha.tpl"}
        </div>
    {/if}

    <div class="form-group text-center">
        <button type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}">
            {lang key='pwresetsubmit'}
        </button>
    </div>

</form>
