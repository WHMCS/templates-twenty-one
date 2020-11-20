<div class="card mw-540 mb-md-4 mt-md-4">
    <div class="card-body px-sm-5 py-5 text-center">
        {if $success}
            <h2>
                <i class="fas fa-check fa-2x text-success"></i><br>
                {lang key="emailVerification.success"}
            </h2>
        {elseif $expired}
            <h2>
                <i class="far fa-clock fa-2x text-warning"></i><br>
                {lang key="emailVerification.expired"}
            </h2>

            {if $loggedin}
                <button class="btn btn-default btn-lg btn-resend-verify-email" data-email-sent="{lang key='emailSent'}" data-error-msg="{lang key='error'}" data-uri="{routePath('user-email-verification-resend')}">
                    {lang key='resendEmail'}
                </button>
            {else}
                <p>{lang key="emailVerification.loginToRequest"}</p>
            {/if}
        {else}
            <h2>
                <i class="fas fa-times fa-2x text-danger"></i><br>
                {lang key="emailVerification.notFound"}
            </h2>

            {if !$loggedin}
                <p>{lang key="emailVerification.loginToRequest"}</p>
            {/if}
        {/if}

        <a href="{routePath('login-index')}" class="btn btn-primary btn-lg mt-4">
            {lang key="orderForm.continueToClientArea"}
            &nbsp;
            <i class="fa fa-arrow-right"></i>
        </a>

    </div>
</div>
