<div class="row w-100 mx-auto mb-3">
    <div class="card w-100">
        {if isset($headerTitle)}
            <div class="card-title py-1 px-2 text-white font-weight-bold bg-{$type}">
                {$headerTitle}
            </div>
        {/if}
        {if isset($bodyContent)}
            <div class="card-text{if isset($bodyTextCenter)} text-center{/if} mx-2 mb-3">
                {$bodyContent}
            </div>
        {/if}
        {if isset($footerContent)}
            <div class="card-footer{if isset($footerTextCenter)} text-center{/if} mx-2 mb-3">
                {$footerContent}
            </div>
        {/if}
    </div>
</div>
