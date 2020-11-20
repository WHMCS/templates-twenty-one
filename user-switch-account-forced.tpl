<div class="card mw-540">
    <div class="card-body">
        <p>{lang key="switchAccount.forcedSwitchRequest"}</p>
        <div class="d-flex justify-content-center py-3">
            <p>
                <strong>
                    {$requiredClient->fullName}
                    {if $requiredClient->companyName}
                        ({$requiredClient->companyName})
                    {/if}
                </strong>
                <br>
                {$requiredClient->email}
            </p>
        </div>
        <form method="post" action="{routePath('user-accounts')}">
            <div class="d-flex justify-content-center">
                <input type="hidden" name="id" value="{$requiredClient->id}" >
                <button type="submit" class="btn btn-primary mr-3">
                    {lang key="continue"}
                    <i class="fas fa-arrow-right"></i>
                </button>
                <a href="{routePath('clientarea-home')}" class="btn btn-default">
                    {lang key="switchAccount.cancelAndReturn"}
                </a>
            </div>
        </form>
    </div>
</div>
