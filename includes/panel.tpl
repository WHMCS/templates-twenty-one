<div class="card">
    {if isset($headerTitle)}
        <div class="card-header  bg-{$type}">
            <h3 class="card-title"><strong>{$headerTitle}</strong></h3>
        </div>
    {/if}
    {if isset($bodyContent)}
        <div class="card-body{if isset($bodyTextCenter)} text-center{/if}">
            {$bodyContent}
        </div>
    {/if}
    {if isset($footerContent)}
        <div class="card-footer{if isset($footerTextCenter)} text-center{/if}">
            {$footerContent}
        </div>
    {/if}
</div>
