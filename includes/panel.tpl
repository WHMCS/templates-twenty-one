<div class="row w-100 mx-auto mb-3">
    <div class="card w-100">
        {if isset($headerTitle)}
            <div class="card-title text-white bg-{$type}">
                <strong class="mx-2">{$headerTitle}</strong>
            </div>
        {/if}
        {if isset($bodyContent)}
            <div class="card-text{if isset($bodyTextCenter)} text-center{/if} mx-2">
                {$bodyContent}
            </div>
        {/if}
        {if isset($footerContent)}
            <div class="card-footer{if isset($footerTextCenter)} text-center{/if} mx-2">
                {$footerContent}
            </div>
        {/if}
    </div>
</div>
