<div class="row justify-content-center">
    <div class="card mw-540 mb-4 mt-4">
        <div class="card-body px-md-5 py-5">
            {if $loggedin && $innerTemplate}
                {include file="$template/includes/alert.tpl" type="error" msg="{lang key='noPasswordResetWhenLoggedIn'}" textcenter=true}
            {else}
                {if $successMessage}
                    {include file="$template/includes/alert.tpl" type="success" msg=$successTitle textcenter=true}
                    <p>{$successMessage}</p>
                {else}
                    {if $innerTemplate}
                        {include file="$template/password-reset-$innerTemplate.tpl"}
                    {/if}
                {/if}
            {/if}
        </div>
    </div>
</div>
